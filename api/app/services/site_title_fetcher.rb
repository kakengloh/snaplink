require 'open-uri'

# Service to fetch and parse title tag from a website
class SiteTitleFetcher
  def initialize(url)
    @url = url
  end

  def execute
    response = URI.parse(@url).open.read
    parse_title(response)
  end

  private

  def parse_title(html)
    match = html.match(%r{<title>(.*?)</title>})
    match ? match[1].strip : nil
  end
end
