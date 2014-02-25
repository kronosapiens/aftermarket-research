require_relative 'spec_helper.rb'

describe "CL_Scraper" do
  before(:each) do
# stuff
  end

  let(:clr){CL_Runner.new}
  let(:clq){CL_Query.new}
  let(:sample_search){"brk macbook pro 400 900"}
  let(:bad_query){"clkj llkjasd 3q kj4 32"}

  it 'creates an array of area keywords as a class method' do
    query = clq.parse(sample_search)
    cls = CL_Scraper.new(query)
    expect(cls.htmlify(query.search_query)).to eq("macbook+pro")
  end

  it 'creates a nokogiri file from a page' do
    query = clq.parse(sample_search)
    cls = CL_Scraper.new(query)
    expect(cls.cl_scrape).to be_a(Object)
  end



  it 'lets me into pry' do
    # binding.pry
  end


end