class FacebookData < ActiveRecord::Base
  include Encodable
  include BelongsToUser

  belongs_to :user

  after_create :update_user

  def full_name
    original_name
  end

  def update_user
    user.update_attributes(facebook: true)
  end
end
