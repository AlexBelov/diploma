class ImportedData < ActiveRecord::Base
  include Encodable
  include BelongsToUser

  belongs_to :user

  after_create :update_user

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def update_user
    user.update_attributes(import: true)
  end
end
