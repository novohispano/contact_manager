require 'spec_helper'

describe Person do
  let(:person) { Fabricate :person }

  it 'is valid' do
    expect(person).to be_valid
  end

  it 'has a first name' do
    expect(person).to be_valid
    expect(person.first_name).to eq 'Jack'
  end

  it 'is invalid without a first name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it 'has phone numbers' do
    phone = person.phone_numbers.create!(number: '123456789')
    expect(person).to respond_to :phone_numbers
    expect(person.phone_numbers).to include phone
  end

  it 'has email_addresses' do
    email = person.email_addresses.create!(address: 'jorge@example.com')
    expect(person).to respond_to :email_addresses
    expect(person.email_addresses).to include email
  end

  it 'is a child of the user' do
    expect(person.user).to be_instance_of User
  end
end
