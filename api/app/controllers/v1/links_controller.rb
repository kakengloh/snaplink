class V1::LinksController < ApplicationController
  def create
    params.require(:target_url)

    link = LinkShortener.new(params[:target_url]).execute

    render(json: link)
  end
end
