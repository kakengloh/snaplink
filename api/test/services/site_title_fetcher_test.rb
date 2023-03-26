class SiteTitleFetcherTest < ActiveSupport::TestCase
  test 'should fetch site title' do
    stub_request(:get, 'https://coingecko.com').to_return(body: '<title>CoinGecko</title>', status: 200)

    title = SiteTitleFetcher.new('https://coingecko.com').execute

    assert_equal('CoinGecko', title)
  end

  test 'should return nil if fetch fails' do
    stub_request(:get, 'https://coingecko.com').to_return(status: 403)

    title = SiteTitleFetcher.new('https://coingecko.com').execute

    assert_nil(title)
  end
end
