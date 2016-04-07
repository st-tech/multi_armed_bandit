require 'simple-random'

module MultiArmedBandit

  class MultiplePlayTS

    attr_accessor :k, :l, :r, :alpha, :beta

    # Initialize an object
    # k: num of arms
    # l: num of selected arms
    def initialize(k, l)
      @k  = k
      @l = l
      @r = SimpleRandom.new
      reset
    end

    # Reset instance variables
    def reset
      @alpha = Array.new(@n_arms, 1)
      @beta = Array.new(@n_arms, 1)
    end

    def get_select_arms(alpha, beta)
      selected_arms = @alpha.zip(@beta).each_with_index
                      .map{|c,i| [i, @r.beta(c[0],c[1]) ] }
                      .sort_by{ |v| -s[1]}.
                      .map{|v| v[0]}[0..l-1]
      return selected_arms
    end

  end
end
