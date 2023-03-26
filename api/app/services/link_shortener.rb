class LinkShortener
  def initialize(target_url)
    @target_url = target_url
  end

  def execute
    slug = SlugGenerator.new.execute

    Link.create!(
      title: SiteTitleFetcher.new(@target_url).execute,
      slug: slug,
      short_url: "#{Rails.application.config.origin}/#{slug}",
      target_url: @target_url
    )
  end
end
