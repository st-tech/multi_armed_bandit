require 'spec_helper'

describe MultiArmedBandit::MultiplePlayTS do

  k = 5
  l = 2

  it "Returned number of arms is correct" do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    arms = mpts.get_selected_arms
    expect(arms.count).to eq(l)
  end	

  it 'Alpha update correctly works' do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    mpts.last_selected_arms = [1,3]
    mpts.update_params(1)
    expect(mpts.alpha).to eq([1,2,1,1,1])
  end

  it 'Beta update correctly works' do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    mpts.last_selected_arms = [1,3]
    mpts.update_params(1)
    expect(mpts.beta).to eq([1,1,1,2,1])
  end

end 
