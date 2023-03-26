class RootController < ApplicationController
  def visit
    LinkTracker.new(params[:slug]).execute

    link = Link.find_by_slug!(params[:slug])

    redirect_to(link.target_url, allow_other_host: true)
  end

  def tracking_attributes
    {
      user_agent: request.user_agent,
      referrer: request.referrer,
      ip_address: request.ip,
      country: request.location.country_code,
      city: request.location.city
    }
  end
end
