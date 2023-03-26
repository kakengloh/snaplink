require 'test_helper'

class V1::LinksControllerTest < ActionDispatch::IntegrationTest
  test 'should create short link given a target URL' do
    stub_request(:get, 'https://coingecko.com').to_return(body: '<title>CoinGecko</title>', status: 200)

    post('/v1/links', params: { target_url: 'https://coingecko.com' })

    assert_response(:success)

    json = JSON.parse(response.body)

    assert_equal(json['title'], 'CoinGecko')
    assert_equal(json['target_url'], 'https://coingecko.com')
    assert_not_nil(json['short_url'])
  end

  test 'should create short link given a target URL even if fetch title fails' do
    stub_request(:get, 'https://coingecko.com').to_return(status: 403)

    post('/v1/links', params: { target_url: 'https://coingecko.com' })

    assert_response(:success)

    json = JSON.parse(response.body)

    assert_nil(json['title'])
    assert_equal(json['target_url'], 'https://coingecko.com')
    assert_not_nil(json['short_url'])
  end

  test 'should throw bad request if `target_url` is not provided' do
    assert_raise(ActionController::ParameterMissing) do
      post('/v1/links')
    end
  end
end
