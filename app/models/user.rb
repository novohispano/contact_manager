class User < ActiveRecord::Base
  has_many :people
  has_many :companies

  def self.from_auth(data)
    User.find_or_create_by(
      provider: data['provider'],
      uid:      data['uid'],
      name:     data['info']['name']
    )
  end

  def to_s
    "#{name}"
  end
end
