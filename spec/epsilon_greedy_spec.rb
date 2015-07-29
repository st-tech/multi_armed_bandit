require 'spec_helper'

describe MultiArmedBandit::EpsilonGreedy do

  counts = [100,100,100,100,100]
  rewards = [1,1,1,1,2]
  epsilon = 0.6

  it "Sum of return values of bulk_updat method equals 1.0" do
    eg = MultiArmedBandit::EpsilonGreedy.new(epsilon, 5)
    probs = eg.bulk_update(counts, rewards)
    sum = probs.inject(:+)
    expect(sum).to eq(1.0)
  end	

  it 'Retuen values of bulk_update are correct' do
    eg = MultiArmedBandit::EpsilonGreedy.new(0.4, 5)
    probs = eg.bulk_update(counts, rewards)
    expect(probs).to eq([0.1,0.1,0.1,0.1,0.6])
  end	

  it "Reset method works" do
    eg = MultiArmedBandit::EpsilonGreedy.new(epsilon, 5)
    eg.bulk_update(counts, rewards)
    eg.reset()
    expect(eg.counts).to eq([0,0,0,0,0])
  end	

  it 'Update method works' do
    eg = MultiArmedBandit::EpsilonGreedy.new(0.6, 2)
    eg.update(0, 0)
    eg.update(1, 0)
    eg.update(0, 0)
    eg.update(1, 1)
    expect(eg.values).to eq([0.0, 0.5])
  end	
  
end

