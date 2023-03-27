class Internal::ReportsController < ApplicationController
  def most_clicked_links
    report = Reporter::MostClickedLinks.new(params[:limit]).execute
    render(json: report)
  end

  def clicks_per_day
    report = Reporter::ClicksPerDay.new(params[:limit]).execute
    render(json: report)
  end

  def clicks_per_country
    report = Reporter::ClicksPerCountry.new(params[:limit]).execute
    render(json: report)
  end
end
