class CL_Scraper

  attr_accessor :query, :pages_array

  def initialize(query_object)
    self.query = query_object
    self.pages_array = []
  end

  def cl_scrape
  # doc = Nokogiri::HTML(open('https://newyork.craigslist.org/search/sss/brk?zoomToPosting=&catAbb=sss&#{htmlify(query.search_query)}&minAsk=100&maxAsk=700&sort=rel&excats=').read)
  # html = open("https://newyork.craigslist.org/search/sso/#{query.keyword}?zoomToPosting=&catAbb=sso&query=#{htmlify(query.search_query)}&minAsk=#{query.min_price}&maxAsk=#{query.max_price}&srchType=T&excats=")
  encoded_url = URI.encode("https://newyork.craigslist.org/search/sss/#{query.keyword}?zoomToPosting=&catAbb=sss&query=#{htmlify(query.search_query)}&minAsk=#{query.min_price}&maxAsk=#{query.max_price}&sort=rel&excats=")
  uri = URI.parse(encoded_url)
  html = open(uri)
  self.pages_array << Nokogiri::HTML(html.read)
  end

  def analyze
    num_array = number_extraction(pages_array[0])
    if !num_array.empty?
      calc_array = calculate(num_array)
      print_calculations(calc_array)
    else
      puts "Sorry, your search returned no results."
    end
  end

  def number_extraction(page)
    page.css('div.content p.row').map do |item_row|
      item_row.css('span.l2 span.price').text[1..-1].to_i
    end
  end

  def htmlify(string)
    string.gsub(" ", "+")
  end

  def mean(num_array)
    num_array.inject(&:+)/num_array.count
      # [a, b, c].inject(&:+) # =>  ((a + b)+ c)+ d)
      # [b, c, d].inject(a, &:+) # =>  ((a + b)+ c)+ d)
  end

  def median(num_array)
    num_array.sort!
    num_array[num_array.count/2]
  end

  def mode(num_array)
    freq = num_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    num_array.max_by { |v| freq[v] }
  end

  def calculate(num_array)
    [mean(num_array), median(num_array), mode(num_array)]
  end

  def print_calculations(calc_array)
    # puts "Search complete!"
    puts "Search complete!"
    # puts "Based on your search for #{query.search_query} in #{CL_Runner.keywords[query.keyword]} with a minimum price of #{query.min_price} and a maximum price of #{query.max_price}"
    puts "The mean price for your search is #{calc_array[0]}"
    puts "The median price for your search is #{calc_array[1]}"
    puts "The mode price for your search is #{calc_array[2]}"
  end

end

  # content = doc.css('div.content')
  # content.css('p.row').count # => 78, which is the number of items
  # doc.css('div.content p.row').first.css('span.l2 span.price').text # => $600
  # doc.css('div.content p.row').first.css('span.l2 span.price').text[1..-1].to_i # => 600


  # binding.pry

  # # projects: kickstarter.css("li.project.grid_4")
  # # title: project.css("h2.bbcard_name strong a").text
  # # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # # description: project.css("p.bbcard_blurb").text
  # # project location: project.css("ul.project-meta a span").text
  # # % funded: project.css("ul.project-stats li.first strong").text.gsub("%","").to_i

  # projects = {}

  # kickstarter.css("li.project.grid_4").each do |project|
  #   title = project.css("h2.bbcard_name strong a").text.to_sym
  #   projects[title] = {
  #     :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
  #     :description => project.css("p.bbcard_blurb").text,
  #     :location => project.css("ul.project-meta span.location-name").text,
  #     :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
  #   }
  # end
  
  # projects