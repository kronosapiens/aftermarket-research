class CL_Scraper

  attr_accessor :query, :pages_array

def initialize(query_object)
  self.query = query_object
  self.pages_array = []
end

def cl_scrape

  self.pages_array << Nokogiri::HTML(open("https://newyork.craigslist.org/search/sso/#{query.keyword}?zoomToPosting=&catAbb=sso&query=#{htmlify(query.search_query)}&minAsk=#{query.min_price}&maxAsk=#{query.max_price}&srchType=T&excats="))

  binding.pry

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
  end

  def htmlify(string)
    string.gsub(" ", "+")
  end


end