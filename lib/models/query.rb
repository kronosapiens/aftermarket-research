class Query

  attr_accessor :keyword, :search_query, :min_price, :max_price

  def parse(query_string)
    query_array = query_string.split(" ")
    self.keyword = query_array.shift
    self.max_price = query_array.pop.to_i
    self.min_price = query_array.pop.to_i
    self.search_query = query_array.join(" ")
    return self
  end

  def valid_query?
    Runner.keywords.keys.include?(self.keyword) && self.search_query.is_a?(String) && self.max_price.is_a?(Integer) && self.min_price.is_a?(Integer)
  end

end