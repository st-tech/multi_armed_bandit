require 'simple-random'

module MultiArmedBandit

  class MultiplePlayTS

    attr_accessor :k, :l, :alpha, :beta, :arm_ids

    # k: num of arms
    # l: num of selected arms
    def initialize(k, l)
      @k = k
      @l = l
      @r = SimpleRandom.new
      reset
    end

    def reset
      @alpha = Array.new(@k, 1)
      @beta = Array.new(@k, 1)
      @arm_ids = Array.new(@k, '')
    end

    # Get selected arm ids
    def get_selected_arms
      selected_arms = @alpha.zip(@beta).zip(@arm_ids)
                      .map{|c,i| [i, @r.beta(c[0],c[1])]}
                      .sort_by{|v| -v[1]}
                      .map{|v| v[0]}[0..@l-1]
    end

    # selected_arms: List of selected drawn arms
    def update_params_draw(selected_arms)
      selected_arms.map{|i| @beta[i]+=1}
    end

    # idx: Index number of rewarded arm
    def update_params_reward(idx)
      @alpha[idx]+=1
      @beta[idx]-=1
    end
    
  end
end
