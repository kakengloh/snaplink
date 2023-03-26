require 'test_helper'

class LinkVisitTest < ActiveSupport::TestCase
  test 'should create link visit' do
    LinkVisit.create!(
      link_id: 1,
      user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Safari/537.36',
      referrer: 'https://www.google.com/search?q=coingecko',
      ip_address: '185.84.24.13',
      country: 'Malaysia',
      city: 'Kuala Lumpur'
    )
  end

  test 'should not create link visit without link ID' do
    assert_raise(ActiveRecord::RecordInvalid) do
      LinkVisit.create!(
        user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Safari/537.36',
        referrer: 'https://www.google.com/search?q=coingecko',
        ip_address: '185.84.24.13',
        country: 'Malaysia',
        city: 'Kuala Lumpur'
      )
    end
  end
end
