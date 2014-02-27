class Scraper

  attr_accessor :query, :product_rows, :encoded_url

  def initialize(query_object)
    self.query = query_object
    self.product_rows = []
  end

  def htmlify(string)
    string.gsub(" ", "+")
  end

  def scrape
    self.encoded_url = URI.encode("https://newyork.craigslist.org/search/sss#{query.keyword_to_url}?zoomToPosting=&catAbb=sss&query=#{htmlify(query.search_query)}&minAsk=#{query.min_price}&maxAsk=#{query.max_price}&sort=rel&excats=")
    html = open(URI.parse(self.encoded_url)) # /sss?zo
    cl_page = Nokogiri::HTML(html.read)
    cl_page.css('div.content p.row').map do |product_row|
      self.product_rows << product_row
    end
  end

  def number_extraction
      self.product_rows.map do |product_row|
        product_row.css('span.l2 span.price').text[1..-1].to_i
    end
  end

  def open_url # in development, not implemented
    `open #{self.encoded_url}`
  end

end