require 'simple-random'

module MultiArmedBandit

  class MultiplePlayTS

    attr_accessor :k, :l, :alpha, :beta

    # Initialize an object
    # k: num of arms
    # l: num of selected arms
    def initialize(k, l)
      @k = k
      @l = l
      reset
    end

    # Reset instance variables
    def reset
      @alpha = Array.new(@k, 1)
      @beta = Array.new(@k, 1)
      @last_selected_arms = Array.new(@l, 0)
      @r = SimpleRandom.new
    end

    def get_selected_arms
      selected_arms = @alpha.zip(@beta).each_with_index
                      .map{|c,i| [i, @r.beta(c[0],c[1]) ]}
                      .sort_by{|v| -v[1]}
                      .map{|v| v[0]}[0..@l-1]
      @last_selected_arms = selected_arms
    end

    # idx: index number of clicked arm
    def update_parameters(idx)
      @last_selected_arms.map{|i| i==idx ? @alpha[i]+=1 : @beta[i]+=1}
    end

  end
end
