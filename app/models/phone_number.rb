class PhoneNumber < ActiveRecord::Base
  validates :number, presence: true

  belongs_to :contact, polymorphic: true
end
