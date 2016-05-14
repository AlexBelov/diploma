module BelongsToUser
  extend ActiveSupport::Concern

  included do
    after_create :create_user
  end

  protected

  def create_user
    return if self.user.present?
    update_columns(user_id: User.create(name: self.encoded_name))
  end
end
