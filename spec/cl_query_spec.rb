require_relative 'spec_helper.rb'

describe "CL_Query" do
  before(:each) do
# stuff
end

let(:clq){CL_Query.new}
let(:sample_query){"brk macbook pro 400 900"}
let(:bad_query){"clkj llkjasd 3q kj4 32"}

it 'can parse a query keyword' do
  clq.parse(sample_query)
  expect(clq.keyword).to eq("brk")
end

it 'can parse a query search term' do
  clq.parse(sample_query)
  expect(clq.search_query).to include("pro")
end

it 'converts min to an integer' do
  clq.parse(sample_query)
  expect(clq.min_price).to be_a(Integer)
end

it 'recognizes a valid query' do
  clq.parse(sample_query)
  expect(clq.valid_query?).to eq(true)
end

it 'recognizes a bad query' do
  clq.parse(bad_query)
  expect(clq.valid_query?).to eq(false)
end

end