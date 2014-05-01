require 'spec_helper'

describe Company do
  let(:company) { Company.create!(name: 'Lockheed') }

  it 'is valid' do
    expect(company).to be_valid
  end

  it 'has a name' do
    expect(company.name).not_to be_nil
    expect(company.name).to eq 'Lockheed'
  end

  it 'is invalid without a name' do
    company.name = nil
    expect(company).to be_invalid
  end
end
