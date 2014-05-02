class Person < ActiveRecord::Base
  include Contact

  belongs_to :user

  validates :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
