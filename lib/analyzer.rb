class Analyzer

  attr_accessor :num_array, :new_min, :new_max

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

  def auto_tune
    benchmark = mean / 2.0

    if num_array.length <= 10
      self.new_min = false
      self.new_max = false
      "AutoTune cannot adjust for less than 10 results."
    elsif median < benchmark
      self.new_min = false 
      self.new_max = mean 
      "AutoTune analysis complete -- high mean, new maximum set."
    elsif mode < benchmark
      self.new_min = benchmark
      self.new_max = false
      "AutoTune analysis complete -- low mode, new minimum set."
    else
      self.new_min = false
      self.new_max = false
      "AutoTune analysis complete -- your search is good."
    end
  end

  def print_calculations
    puts "Analysis complete, based on #{num_array.length} craigslist listings!"
    puts "The mean price for your search is #{mean}"
    puts "The median price for your search is #{median}"
    puts "The mode price for your search is #{mode}"
  end

end