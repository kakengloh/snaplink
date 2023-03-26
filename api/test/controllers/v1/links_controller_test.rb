require 'test_helper'

class V1::LinksControllerTest < ActionDispatch::IntegrationTest
  test 'should create short link given a target URL' do
    site_title_fetcher_mock = Minitest::Mock.new
    site_title_fetcher_mock.expect(:execute, 'CoinGecko')

    SiteTitleFetcher.stub(:new, site_title_fetcher_mock) do
      post('/v1/links', params: { target_url: 'https://coingecko.com' })
    end

    assert_response(:success)

    json = JSON.parse(response.body)

    assert_equal(json['title'], 'CoinGecko')
    assert_equal(json['target_url'], 'https://coingecko.com')
    assert_not_nil(json['short_url'])
  end

  test 'should create short link given a target URL even if fetch title fails' do
    site_title_fetcher_mock = Minitest::Mock.new
    site_title_fetcher_mock.expect(:execute, nil)

    SiteTitleFetcher.stub(:new, site_title_fetcher_mock) do
      post('/v1/links', params: { target_url: 'https://coingecko.com' })
    end

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
