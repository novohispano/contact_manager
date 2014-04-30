require 'spec_helper'

describe PhoneNumber do
  let(:person) { Person.create(first_name: 'Mary', last_name: 'Jones') }
  let(:phone)  { PhoneNumber.create(number: '1234567890', person_id: person.id) }

  it 'is valid' do
    expect(phone).to be_valid
  end

  it 'is invalid without a phone' do
    phone.number = nil
    expect(phone).to be_invalid
  end

  it 'has a person' do
    expect(phone.person).to eq person
  end
end
