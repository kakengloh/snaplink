require 'test_helper'

class V1::LinksControllerTest < ActionDispatch::IntegrationTest
  test 'should create short link given a target URL' do
    link_shortener_mock = Minitest::Mock.new
    link_shortener_mock.expect(:execute, links(:one))

    LinkShortener.stub(:new, link_shortener_mock) do
      post('/v1/links', params: { target_url: 'https://www.coingecko.com' })
    end

    assert_response(:success)

    json = JSON.parse(response.body)

    assert_equal(json['title'], 'CoinGecko')
    assert_equal(json['target_url'], 'https://www.coingecko.com')
    assert_not_nil(json['short_url'])
  end

  test 'should create short link given a target URL even if fetch title fails' do
    link_shortener_mock = Minitest::Mock.new
    link_shortener_mock.expect(:execute, links(:without_title))

    LinkShortener.stub(:new, link_shortener_mock) do
      post('/v1/links', params: { target_url: 'https://www.coingecko.com' })
    end

    assert_response(:success)

    json = JSON.parse(response.body)

    assert_nil(json['title'])
    assert_equal(json['target_url'], 'https://www.coingecko.com')
    assert_not_nil(json['short_url'])
  end

  test 'should throw bad request if `target_url` is not provided' do
    assert_raise(ActionController::ParameterMissing) do
      post('/v1/links')
    end
  end
end
