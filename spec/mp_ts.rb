require 'spec_helper'

describe MultiArmedBandit::MultiplePlayTS do

  k = 5
  l = 2

  it "Returned number of arms is correct" do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    arms = mpts.get_selected_arms
    expect(arms.count).to eq(l)
  end	

  it 'Beat update correctly works when arms draw' do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    mpts.update_params_draw([1,3])
    expect(mpts.beta).to eq([1,2,1,2,1])
  end

  it 'Alpha update correctly works when rewarded' do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    mpts.update_params_draw([1,3])
    mpts.update_params_reward(1)
    expect(mpts.beta).to eq([1,1,1,2,1])
  end

  it 'Alpha update correctly works when rewarded' do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    mpts.update_params_draw([1,3])
    mpts.update_params_reward(1)
    expect(mpts.alpha).to eq([1,2,1,1,1])
  end

end 
