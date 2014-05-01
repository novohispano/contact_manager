class EmailAddress < ActiveRecord::Base
  validates :address, presence: true, format: {
    with: /\A\S+@.+\.\S+\z/,
    message: "needs an valid email address"
  }

  belongs_to :contact, polymorphic: true
end
