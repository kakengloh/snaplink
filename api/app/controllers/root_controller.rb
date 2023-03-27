class RootController < ApplicationController
  def ping
    render(plain: 'OK')
  end

  def visit
    link = Link.find_by_slug!(params[:slug])

    LinkTracker.new(params[:slug], tracking_attributes).execute

    redirect_to(link.target_url, allow_other_host: true)
  end

  private

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
