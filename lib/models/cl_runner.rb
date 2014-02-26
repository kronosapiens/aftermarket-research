class CL_Runner

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

  def interface
    on = true

    while on do

      puts "======================================="
      puts "Hello! Welcome to AfterMarket Research."
      puts
      puts "Please enter your query in the following format:"
      puts "[location keyword] [product query] [min price] [max price]"
      puts
      puts "(Type 'help' for more information, and type 'exit' to exit)"

      raw_user_command = gets.chomp.downcase
      query = CL_Query.new.parse(raw_user_command)
      # binding.pry
      if query.valid_query?
        puts "running search..."
        puts
        cls = CL_Scraper.new(query)
        cls.cl_scrape
        cls.analyze
      elsif query.keyword == "help"
        help
      elsif query.keyword == "exit"
        exit
        on = false
      else
        puts "Invalid Query! Please try again. Hit 'enter' to continue."
        gets
        "Invalid Query"
      end
    end
  end

  def help
    puts "Run a search by writing four query terms, as follows:"
    puts
    puts "FIRST, the area key -- #{CL_Runner.keywords} "
    # area_array = keywords.each_with_object([]) {|key, value, array| array << "#{key}: #{value}"} 
    puts
    puts "NEXT, your actual search. Feel free to format however you like, but please write it in quotes."
    puts
    puts "Finally, your minimum and maximum prices, as integers. These will be used to narrow the search."
    puts
    puts "Here is a sample search: \"brk 'macbook pro' 200 800\" "
    puts
    puts "Hit 'enter' to continue."
    gets
  end

  def exit
    puts "Thanks for using AfterMarket Research! Go get that surplus value!"
  end

end