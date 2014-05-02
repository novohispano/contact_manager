class Company < ActiveRecord::Base
  include Contact

  belongs_to :user

  validates :name, presence: true

  def to_s
    "#{name}"
  end
end
