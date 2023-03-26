require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test 'should create link' do
    Link.create!(
      slug: 'A7Y9BN',
      target_url: 'https://www.coingecko.com',
      short_url: 'http://localhost:3000/A7Y9BN',
      title: 'Coingecko'
    )
  end

  test 'should create link even if title is nil' do
    Link.create!(
      slug: 'A7Y9BN',
      target_url: 'https://www.coingecko.com',
      short_url: 'http://localhost:3000/A7Y9BN',
      title: nil
    )
  end

  test 'should not create link if slug is absent' do
    assert_raise(ActiveRecord::RecordInvalid) do
      Link.create!(
        target_url: 'https://www.coingecko.com',
        short_url: 'http://localhost:3000/A7Y9BN',
        title: 'Coingecko'
      )
    end
  end
end
