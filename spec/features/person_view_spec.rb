require 'features/feature_spec_helper'

# Capybara.default_driver = :selenium

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.phone_numbers.create(number: '555-1234')
    person.phone_numbers.create(number: '555-5678')
    person.email_addresses.create(address: 'jorge@example.com')
    person.email_addresses.create(address: 'mary@example.com')
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it 'has a link to add a new phone number' do
    expect(page).to have_link('Add phone number for John Doe', href: new_phone_number_path(contact_id: person, contact_type: 'Person'))
  end

  it 'adds a new phone number' do
    page.click_link('Add phone number for John Doe')
    page.fill_in('Number', with: '555-8888')
    page.click_button('Create Phone number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('555-8888')
  end

  it 'has a link to edit a phone number' do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('edit', href: edit_phone_number_path(phone) )
    end
  end

  it 'edits a phone number' do
    phone = person.phone_numbers.first
    old_number = phone.number

    first(:link, 'edit').click
    page.fill_in('Number', with: '555-9191')
    page.click_button('Update Phone number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('555-9191')
    expect(page).to_not have_content(old_number)
  end

  it 'has a link to destroy a phone number' do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('delete', href: phone_number_path(phone) )
    end
  end

  it 'deletes a phone number' do
    phone = person.phone_numbers.first

    first(:link, 'delete').click
    expect(current_path).to eq(person_path(person))
    expect(page).to_not have_content(phone)
  end

  it 'shows the email addresses' do
    person.email_addresses.each do |email|
      expect(page).to have_content(email.address)
    end
  end

  it 'has a link to add a new phone number' do
    expect(page).to have_link('Add email for John Doe', href: new_email_address_path(contact_id: person.id, contact_type: 'Person'))
  end

  it 'adds an email address' do
    page.click_link('Add email for John Doe')
    page.fill_in('Address', with: 'mary@example.com')
    page.click_button('Create Email address')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('mary@example.com')
  end

  it 'edits a email address' do
    email = person.email_addresses.first
    old_email = email.address

    first(:link, 'edit email').click
    page.fill_in('Address', with: 'jack@example.com')
    page.click_button('Update Email address')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('jack@example.com')
    expect(page).to_not have_content(old_email)
  end

  it 'deletes a email address' do
    email = person.email_addresses.first

    first(:link, 'delete email').click
    expect(current_path).to eq(person_path(person))
    expect(page).to_not have_content(email)
  end
end
