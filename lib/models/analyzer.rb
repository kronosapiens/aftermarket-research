class Analyzer

  attr_accessor :num_array

  def initialize(num_array)
    self.num_array = num_array
  end

  def mean
    self.num_array.inject(&:+)/num_array.count
        # [a, b, c].inject(&:+) # =>  ((a + b)+ c)+ d)
        # [b, c, d].inject(a, &:+) # =>  ((a + b)+ c)+ d)
  end

  def median
    sorted = self.num_array.sort!
    sorted[sorted.count/2]
  end

  def mode
    freq = self.num_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    self.num_array.max_by { |v| freq[v] }
  end

  def print_calculations
    puts "Analysis complete, based on #{num_array.length} listings!"
    puts "The mean price for your search is #{mean}"
    puts "The median price for your search is #{median}"
    puts "The mode price for your search is #{mode}"
  end

end