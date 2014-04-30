require 'spec_helper'

describe Person do
  let(:person) do
    Person.create(first_name: 'Jack', last_name: 'Smith')
  end

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
end
