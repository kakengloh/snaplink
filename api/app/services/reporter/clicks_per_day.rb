class Reporter::ClicksPerDay
  def initialize(limit = 30)
    @limit = limit
  end

  def execute
    LinkVisit
      .select("DATE_TRUNC('day', created_at) AS day, COUNT(*) AS clicks")
      .group('day')
      .order('day ASC')
      .limit(@limit)
      .as_json(except: :id)
  end
end
