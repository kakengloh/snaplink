class Reporter::MostClickedLinks
  def initialize(limit = 10)
    @limit = limit
  end

  def execute
    Link
      .select(:title, :short_url, :clicks)
      .order(clicks: :desc)
      .limit(@limit)
      .as_json(except: :id)
  end
end
