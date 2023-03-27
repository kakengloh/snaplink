class LinkTrackerTest < ActiveSupport::TestCase
  test 'should increment clicks by 1 and create link visit' do
    link = links(:one)

    tracking_attributes = {
      user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Safari/537.36',
      referrer: 'https://www.google.com/search?q=coingecko',
      ip_address: '185.84.24.13',
      country: 'Malaysia',
      city: 'Kuala Lumpur'
    }

    LinkTracker.new(link.slug, tracking_attributes).execute

    link.reload

    assert_equal(2, link.clicks)
    assert_equal(2, link.visits.count)

    visit = link.visits.last

    assert_equal(tracking_attributes[:user_agent], visit.user_agent)
    assert_equal(tracking_attributes[:referrer], visit.referrer)
    assert_equal(tracking_attributes[:ip_address], visit.ip_address)
    assert_equal(tracking_attributes[:country], visit.country)
    assert_equal(tracking_attributes[:city], visit.city)
  end

  test 'should rollback if there is error' do
    link = links(:one)

    tracking_attributes = {
      a: 1,
      b: 2,
      c: 3
    }

    assert_raise(ActiveRecord::Rollback) do
      LinkTracker.new(link.slug, tracking_attributes).execute
    end
  end
end
