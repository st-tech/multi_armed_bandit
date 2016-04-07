require 'simple-random'

module MultiArmedBandit

  class MultiplePlayTS

    attr_accessor :n_arms, :n_selected_arms, :r, :alpha, :beta

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
      @r = SimpleRandom.new
    end

    def get_select_arms
      selected_arms = @alpha.zip(@beta).each_with_index
                      .map{|c,i| [i, @r.beta(c[0],c[1]) ]}
                      .sort_by{|v| -v[1]}
                      .map{|v| v[0]}[0..n_selected_arms-1]
      update_disp_count(selected_arms)
      return selected_arms
    end

    def update_disp_count(selected_arms)
      selected_arms.each{|i| @beta += 1}
    end

    def add_click_count(idx)
      @alpha[idx] += 1
    end

  end
end
