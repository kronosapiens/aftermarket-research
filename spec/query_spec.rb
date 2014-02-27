require_relative 'spec_helper.rb'

describe "Query" do

  let(:query){Query.new}
  let(:sample_query){"brk macbook pro 400 900"}
  let(:bad_query){"clkj llkjasd 3q kj4 32"}

  it 'can parse a query keyword' do
    query.parse(sample_query)
    expect(query.keyword).to eq("brk")
  end

  it 'can parse a query search term' do
    query.parse(sample_query)
    expect(query.search_query).to include("pro")
  end

  it 'recognizes nyc' do
    query.parse("nyc bookshelf 100 1000")
    expect(query.keyword_to_url).to eq("")
  end

  it 'recognizes queens and can modify the url' do
    query.parse("que bookshelf 100 1000")
    expect(query.keyword_to_url).to eq("/que")
  end

  it 'converts min to an integer' do
    query.parse(sample_query)
    expect(query.min_price).to be_a(Integer)
  end

  it 'recognizes a valid query' do
    query.parse(sample_query)
    expect(query.valid_query?).to eq(true)
  end

  it 'recognizes a bad query' do
    query.parse(bad_query)
    expect(query.valid_query?).to eq(false)
  end

end