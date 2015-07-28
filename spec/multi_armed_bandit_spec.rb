require 'spec_helper'

describe MultiArmedBandit do
  it 'has a version number' do
    expect(MultiArmedBandit::VERSION).not_to be nil
  end
 end

describe MultiArmedBandit::Softmax do

  counts = [100,100,100,100,100]
  rewards = [1,1,1,1,1]

  it "bulk_update's sum of prob list equals 1.0" do
 	sm = MultiArmedBandit::Softmax.new(0.01, 5)
 	probs = sm.bulk_update(counts, rewards)
 	# round 15 decimal places
 	sum = probs.inject(:+).round(15)
 	expect(sum).to eq(1.0)
  end	

  it 'reset method works' do
 	sm = MultiArmedBandit::Softmax.new(0.01, 3)
 	sm.bulk_update(counts, rewards)
 	sm.reset(3)
 	expect(sm.counts).to eq([0,0,0])
  end	

  it 'probs return exact numbers' do
 	sm = MultiArmedBandit::Softmax.new(0.01, 5)
 	probs = sm.bulk_update(counts, [1,1,1,1,1])
 	expect(probs).to eq([0.2,0.2,0.2,0.2,0.2])
  end	

  it 'Update method words' do
 	sm = MultiArmedBandit::Softmax.new(1, 3)
 	sm.update(0, 0)
 	sm.update(1, 0)
 	sm.update(2, 0)
 	sm.update(0, 1)
 	sm.update(1, 1)
 	sm.update(2, 1)
        expect(sm.values).to eq([0.5, 0.5, 0.5])
  end	

  
end 
