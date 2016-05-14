class LinkedinData < ActiveRecord::Base
  include Encodable
  include BelongsToUser

  belongs_to :user
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :skills
  has_many :positions
  has_many :addresses, as: :addressable

  after_create :update_user

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_user
    user.update_attributes(linkedin: true)
  end
end
