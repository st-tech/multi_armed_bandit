

module MultiArmedBandit

  class Softmax

    attr_accessor :temperature, :counts, :values, :probs

    # Initialize an object
    def initialize(temperature, n_arms)
      @temperature = temperature
      reset(n_arms)    
    end

    # Reset instance variables
    def reset(n_arms)
      @counts = Array.new(n_arms, 0)
      @values = Array.new(n_arms, 0.0)
      @probs = Array.new(n_arms, 0.0)
    end

    # Update in a lump. new_counts is a list of each arm's trial number and
    # new_rewards means a list of rewards.
    def bulk_update(new_counts, new_rewards)

      # update expectations of each arm
      new_values = []
      @counts.zip(@values, new_counts, new_rewards).each do |n, value, nn, reward|
        new_values << (n * value + reward) / (n + nn)
      end
      @values = new_values

      # update the numbers of each arm's trial
      @counts = @counts.zip(new_counts).map{|f, s| f + s}

      # calcurate probabilities
      z = @values.collect{|i| Math.exp(i/@temperature)}.reduce(:+)
      @probs = @values.collect{|i| Math.exp(i/@temperature)/z}

      return probs
    end

    
    def update(chosen_arm, reward)
      @counts[chosen_arm] = @counts[chosen_arm] + 1
      n = @counts[chosen_arm]
      
      value = @values[chosen_arm]
      new_value = ((n - 1) / n.to_f) * value + (1 / n.to_f) * reward
      @values[chosen_arm] = new_value
      return
    end
      
    
    def select_arm
      z = @values.collect{|i| Math.exp(i/@temperature)}.reduce(:+)
      @probs = @values.collect{|i| Map.exp(i/@temperature)/z}
      return categorical_draw(@probs)
    end

    private
    def categorical_draw(probs)
      z = rand()
      cum_prob = 0.0

      probs.size().times do |i|
        prob = probs[i]
        cum_prob += prob
        if cum_prob > z
          return i
        end
      end
      
      return probs.size() - 1
    end
    
  end
end
