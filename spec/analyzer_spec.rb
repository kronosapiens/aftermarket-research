require_relative 'spec_helper.rb'

describe "Analyzer" do

let(:analyzer){Analyzer.new([1, 1, 1, 2, 4, 5, 7])}

  it 'calculates the mean' do
    mean = analyzer.mean
    expect(mean).to be(3)
  end

  it 'calculates the median' do
    median = analyzer.median
    expect(median).to be(2)
  end

  it 'calculates the mode' do
    mode = analyzer.mode
    expect(mode).to be(1)
  end

end