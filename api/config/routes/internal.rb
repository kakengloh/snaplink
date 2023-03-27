namespace :internal do
  scope path: 'reports', controller: 'reports' do
    get 'most-clicked-links' => :most_clicked_links
    get 'clicks-per-day' => :clicks_per_day
    get 'clicks-per-country' => :clicks_per_country
  end
end
