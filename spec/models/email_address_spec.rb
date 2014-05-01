require 'spec_helper'

describe EmailAddress do
  let(:person)  { Person.create!(first_name: 'Jorge', last_name: 'Smith') }
  let(:company) { Company.create!(name: 'Lockheed') }

  let(:email_1) do
    EmailAddress.create!(address: 'jorge@example.com', contact_id: person.id, contact_type: 'Person')
  end

  let(:email_2) do
    EmailAddress.create!(address: 'mary@example.com', contact_id: company.id, contact_type: 'Company')
  end

  it 'is valid' do
    expect(email_1).to be_valid
  end

  it 'has an address' do
    expect(email_1.address).not_to be_nil
    expect(email_1.address).to eq 'jorge@example.com'
  end

  it 'is invalid without an address' do
    email_1.address = nil
    expect(email_1).to be_invalid
  end

  it 'is invalid without a valid address' do
    email_1.address = 'some string'
    expect(email_1).to be_invalid
  end

  it 'has a person' do
    expect(email_1.contact).to eq person
  end

  it 'has a company' do
    expect(email_2.contact).to eq company
  end
end
