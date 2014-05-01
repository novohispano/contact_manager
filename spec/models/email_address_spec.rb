require 'spec_helper'

describe EmailAddress do
  let(:person) { Person.create!(first_name: 'Jorge', last_name: 'Smith') }
  let(:email)  { EmailAddress.create!(address: 'jorge@example.com', person_id: person.id) }

  it 'is valid' do
    expect(email).to be_valid
  end

  it 'has an address' do
    expect(email.address).not_to be_nil
    expect(email.address).to eq 'jorge@example.com'
  end

  it 'is invalid without an address' do
    email.address = nil
    expect(email).to be_invalid
  end

  it 'is invalid without a valid address' do
    email.address = 'some string'
    expect(email).to be_invalid
  end

  it 'has a person' do
    expect(email.person).to eq person
  end
end
