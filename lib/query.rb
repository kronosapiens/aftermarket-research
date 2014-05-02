class Query

  attr_accessor :keyword, :search_query, :min_price, :max_price, :autotune

  def self.keywords
    {
      "mnh" => "Manhattan",
      "brk" => "Brooklyn",
      "que" => "Queens",
      "brx" => "The Bronx",
      "stn" => "Staten Island",
      "jsy" => "New Jersey",
      "lgi" => "Long Island",
      "wch" => "Westchester",
      "fct" => "Fairfield",
      "nyc" => "New York City",
    }
  end

  def initialize(args = {})
    @keyword = args.fetch("keyword", "nyc")
    @search_query = args.fetch("search_query", "bookshelf")
    @min_price = args.fetch("min_price", 0)
    @max_price = args.fetch("max_price", 2000)
    @autotune = args.fetch("autotune", false)
  end

  def parse(query_string)
    query_array = query_string.split(" ")
    self.keyword = query_array.shift
    
    self.max_price = query_array.pop.to_i
    self.min_price = query_array.pop.to_i
    self.search_query = query_array.join(" ")
    return self
  end

  def valid_query?
    Query.keywords.keys.include?(self.keyword) && self.search_query.is_a?(String) && self.max_price.is_a?(Integer) && self.min_price.is_a?(Integer)
  end

  def keyword_to_url
    if keyword == "nyc"
      ""
    else
      "/#{keyword}"
    end
  end

end