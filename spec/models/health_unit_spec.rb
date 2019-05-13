require 'rails_helper'

describe HealthUnit do
  let!(:ubs)  {create(:health_unit)}
  it 'must be valid' do
    expect(ubs).to be_valid
  end

  it 'name must be UBS Lavras' do
    expect(ubs.name).to eq('UBS Lavras')
  end

end