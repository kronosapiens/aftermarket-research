require_relative 'spec_helper.rb'

describe "Analyzer" do

let(:normal_nums){[1, 1, 1, 2, 4, 5, 7]}
let(:low_mode){[1, 1, 1, 1, 4, 6, 8, 8, 9, 9, 10]}
let(:high_mean){[1, 1, 2, 2, 3, 4, 4, 4, 5, 7, 8, 8, 9, 10, 11, 100]}
let(:analyzer){Analyzer.new(normal_nums)}

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

  it 'adjusts for a low mode' do
    analyzer = Analyzer.new(low_mode)
    analyzer.auto_tune
    expect(analyzer.new_max).to be(false)
    expect(analyzer.new_min).to eq(analyzer.mean / 2.0)
  end

  it 'adjusts for a high mean' do
    analyzer = Analyzer.new(high_mean)
    analyzer.auto_tune
    expect(analyzer.new_min).to be(false)
    expect(analyzer.new_max).to eq(analyzer.mean)
  end

  it 'sets new_min to false if the search is good' do
    analyzer.auto_tune
    expect(analyzer.new_max).to be(false)
    expect(analyzer.new_min).to be(false)
  end

  it 'returns false without enough data' do
    analyzer.auto_tune
    expect(analyzer.new_max).to be(false)
    expect(analyzer.new_min).to be(false)
  end

end