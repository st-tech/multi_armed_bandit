class Softmax

  def initialize(temperature, n_arms)
    @temperature = temperature
    @counts = Array.new(n_arms, 0)
    @values = Array.new(n_arms, 0.0)
  end

  def reset(n_arms)
    @counts = Array.new(n_arms, 0)
    @values = Array.new(n_arms, 0.0)
  end

  def update(new_counts, new_rewards)

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
    probs = @values.collect{|i| Math.exp(i/@temperature)/z}

    return probs

  end
end
