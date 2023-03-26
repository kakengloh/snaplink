class LinkShortenerTest < ActiveSupport::TestCase
  test 'should shorten and return a link' do
    slug_generator_mock = Minitest::Mock.new
    slug_generator_mock.expect(:execute, '3eLpeV')

    site_title_fetcher = Minitest::Mock.new
    site_title_fetcher.expect(:execute, 'CoinGecko')

    SlugGenerator.stub(:new, slug_generator_mock) do
      SiteTitleFetcher.stub(:new, site_title_fetcher) do
        link = LinkShortener.new('https://coingecko.com').execute

        assert_equal('CoinGecko', link.title)
        assert_equal('3eLpeV', link.slug)
        assert_equal('http://localhost:3000/3eLpeV', link.short_url)
        assert_equal('https://coingecko.com', link.target_url)
      end
    end
  end
end
