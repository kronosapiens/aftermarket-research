require_relative 'spec_helper.rb'

describe "Scraper" do
  before(:each) do
# stuff
  end

  let(:clr){Runner.new}

  let(:sample_search){"brk macbook pro 400 900"}
  let(:bad_query){"clkj llkjasd 3q kj4 32"}

  let(:query){Query.new.parse(sample_search)}
  let(:cls){Scraper.new(query)}

  # let(:doc){Nokogiri::HTML(open('https://newyork.craigslist.org/search/sso/brk?zoomToPosting=&catAbb=sss&query=macbook+pro&minAsk=100&maxAsk=700&sort=rel&excats='))}
  let(:num_array){[1, 1, 1, 2, 4, 5, 7]}

  it 'creates an array of area keywords as a class method' do
    expect(cls.htmlify(query.search_query)).to eq("macbook+pro")
  end

  it 'creates an array of area keywords which can handle quotes' do
    query = Query.new.parse("que powerbook 15\" 0 1000")
    expect(cls.htmlify(query.search_query)).to eq("powerbook+15\"")
  end

  # it 'creates a nokogiri file from a page' do
  #   nokogiri_page = cls.scrape
  #   File.write('spec/sample_scrapes/sample_scrape', nokogiri_page)
  #   expect(nokogiri_page).to include("craigslist")
  # end

  xit 'returns an array of integers' do
    num_array = cls.number_extraction(doc)
    expect(num_array[0]).to be_a(Integer)
  end

  it 'calculates the mean' do
    mean = cls.mean(num_array)
    expect(mean).to be(3)
  end

  it 'calculates the median' do
    median = cls.median(num_array)
    expect(median).to be(2)
  end

  it 'calculates the mode' do
    mode = cls.mode(num_array)
    expect(mode).to be(1)
  end

  it 'returns an array of the mean, median, and mode prices' do
    analysis = cls.calculate(num_array)
    expect(analysis.length).to be(3)
  end

  xit 'prints the results of the analysis' do
    analysis = cls.calculate(num_array)
    expect($stdout).to receive(:puts).with("Search complete!")
    cls.print_calculations(analysis)
  end



end