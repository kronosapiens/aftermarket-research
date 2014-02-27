require_relative 'spec_helper.rb'

describe "Scraper" do

  let(:runner){Runner.new}

  let(:sample_search){"brk macbook pro 400 900"}
  let(:bad_query){"clkj llkjasd 3q kj4 32"}

  let(:query){Query.new.parse(sample_search)}
  let(:scraper){Scraper.new(query)}

  let(:doc){Nokogiri::HTML(open('https://newyork.craigslist.org/search/sso/brk?zoomToPosting=&catAbb=sss&query=macbook+pro&minAsk=100&maxAsk=700&sort=rel&excats='))}

  it 'creates an array of area keywords as a class method' do
    expect(scraper.htmlify(query.search_query)).to eq("macbook+pro")
  end

  it 'creates an array of area keywords which can handle quotes' do
    query = Query.new.parse("que powerbook 15\" 0 1000")
    expect(scraper.htmlify(query.search_query)).to eq("powerbook+15\"")
  end

  # it 'creates a nokogiri file from a page' do
  #   nokogiri_page = scraper.scrape
  #   File.write('spec/sample_scrapes/sample_scrape', nokogiri_page)
  #   expect(nokogiri_page).to include("craigslist")
  # end

  it 'returns an array of integers' do
    scraper.scrape
    num_array = scraper.number_extraction
    expect(num_array[0]).to be_a(Integer)
  end


end