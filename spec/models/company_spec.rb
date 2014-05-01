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

  it 'has phone numbers' do
    phone = company.phone_numbers.create!(number: '1234567890')
    expect(company).to respond_to :phone_numbers
    expect(company.phone_numbers).to include phone
  end

  it 'has email addresses' do
    email = company.email_addresses.create!(address: 'jorge@example.com')
    expect(company).to respond_to :email_addresses
    expect(company.email_addresses).to include email
  end
end
