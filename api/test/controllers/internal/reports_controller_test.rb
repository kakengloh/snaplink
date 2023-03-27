require 'test_helper'

class Internal::ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'should get most clicked links report' do
    get('/internal/reports/most-clicked-links', params: { limit: 5 })

    assert_response(:success)

    json = JSON.parse(response.body)

    assert(json.length.positive?)
  end

  test 'should get clicks per day report' do
    get('/internal/reports/clicks-per-day', params: { limit: 5 })

    assert_response(:success)

    json = JSON.parse(response.body)

    assert(json.length.positive?)
  end

  test 'should get clicks per country report' do
    get('/internal/reports/clicks-per-country', params: { limit: 5 })

    assert_response(:success)

    json = JSON.parse(response.body)

    assert(json.length.positive?)
  end
end
