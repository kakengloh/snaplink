require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test 'should create link' do
    Link.create!(
      slug: 'A7Y9BA',
      target_url: 'https://www.coingecko.com',
      short_url: 'http://localhost:3000/A7Y9BA',
      title: 'Coingecko'
    )
  end

  test 'should create link even if title is nil' do
    Link.create!(
      slug: 'A7Y9BB',
      target_url: 'https://www.coingecko.com',
      short_url: 'http://localhost:3000/A7Y9BB',
      title: nil
    )
  end

  test 'should not create link if slug is absent' do
    assert_raise(ActiveRecord::RecordInvalid) do
      Link.create!(
        target_url: 'https://www.coingecko.com',
        short_url: 'http://localhost:3000/A7Y9BC',
        title: 'Coingecko'
      )
    end
  end

  test 'should not create link if target URL is not a valid URL' do
    assert_raise(ActiveRecord::RecordInvalid) do
      Link.create!(
        slug: 'A7Y9BD',
        target_url: 'x',
        short_url: 'http://localhost:3000/A7Y9BD',
        title: 'X'
      )
    end
  end
end
