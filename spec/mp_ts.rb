require 'spec_helper'

describe MultiArmedBandit::MultiplePlayTS do

  k = 5
  l = 2

  it "Returned number of arms is correct" do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    arms = mpts.get_select_arms
    expect(arms.count).to eq(l)
  end	

  it 'Disp count up method works' do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    arms = [1,3]
    update_disp_count(arms)
    expect(mpts.alpha).to eq([1,2,1,2,1])
  end	

  it 'Click count up method works' do
    mpts = MultiArmedBandit::MultiplePlayTS.new(k, l)
    add_click_count(0)
    expect(mpts.beta).to eq([2,1,1,1,1])
  end

end 
