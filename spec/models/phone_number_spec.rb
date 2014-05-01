require 'spec_helper'

describe PhoneNumber do
  let(:person)  { Person.create(first_name: 'Mary', last_name: 'Jones') }
  let(:company) { Company.create(name: 'Lockheed') }

  let(:phone_1) do
    PhoneNumber.create(
      number:       '1234567890',
      contact_id:   person.id,
      contact_type: 'Person'
      )
  end

  let(:phone_2) do
    PhoneNumber.create(
      number:       '2223334444',
      contact_id:   company.id,
      contact_type: 'Company'
      )
  end

  it 'is valid' do
    expect(phone_1).to be_valid
  end

  it 'is invalid without a phone' do
    phone_1.number = nil
    expect(phone_1).to be_invalid
  end

  it 'has a person' do
    expect(phone_1.contact).to eq person
  end

  it 'has a company' do
    expect(phone_2.contact).to eq company
  end
end
