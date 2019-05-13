require 'rails_helper'

describe HealthUnit do
  let!(:ubs)  {create(:health_unit)}
  it 'must be valid' do
    expect(ubs).to be_valid
  end

  it 'UBS name must be CRUZEIRO DO SUL' do
    expect(ubs.name).to eq('CRUZEIRO DO SUL')
  end

end