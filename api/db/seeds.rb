# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

20.times do
  slug = SlugGenerator.new.execute
  clicks = rand(0..100)

  link = Link.create(
    title: Faker::Company.name,
    slug: slug,
    short_url: "#{Rails.application.config.origin}/#{slug}",
    target_url: Faker::Internet.url,
    clicks: clicks
  )

  visits = []

  clicks.times do
    visits << {
      link_id: link.id,
      user_agent: Faker::Internet.user_agent,
      referrer: Faker::Internet.url,
      ip_address: Faker::Internet.public_ip_v4_address,
      device: nil,
      country: Faker::Address.country_code,
      city: Faker::Address.city
    }
  end

  LinkVisit.insert_all(visits)
end
