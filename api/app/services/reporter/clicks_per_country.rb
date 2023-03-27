class Reporter::ClicksPerCountry
  def initialize(limit = 10)
    @limit = limit
  end

  def execute
    LinkVisit
      .select(:country, 'COUNT(*) AS clicks')
      .group(:country)
      .order('clicks DESC')
      .limit(@limit)
      .as_json(except: :id)
  end
end
