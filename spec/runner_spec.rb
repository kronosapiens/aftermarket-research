require_relative 'spec_helper.rb'

describe "Runner" do
  before(:each) do
# stuff
  end

  let(:clr){Runner.new}
  let(:clq){Query.new}
  let(:sample_search){"brk macbook pro 400 900"}
  let(:bad_query){"clkj llkjasd 3q kj4 32"}


  it 'creates an array of area keywords as a class method' do
    expect(Runner.keywords.keys).to include("brk")
  end

  it 'recognizes an invalid search' do
  end


  it 'lets me into pry' do
    # binding.pry
  end


end