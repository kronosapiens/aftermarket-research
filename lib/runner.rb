class Runner

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
      query = Query.new.parse(raw_user_command)
      # binding.pry
      if query.valid_query?
        puts "running search..."
        puts
        scraper = Scraper.new(query)
        scraper.scrape
        if scraper.product_rows.length > 0
          analyzer = Analyzer.new(scraper.number_extraction)
          analyzer.print_calculations
          # puts
          # puts "Would you like to see your search results? (Y/n)"
          # to_web = gets.chomp.downcase
          # if to_web == "y"
          #   binding.pry
          #   scraper.open_url
          # end
        else
          puts "Sorry, your search returned no results."
        end
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
    puts "Run a craigslist search by including four query terms, as follows:"
    puts
    puts "FIRST, the area key -- #{Query.keywords} "
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