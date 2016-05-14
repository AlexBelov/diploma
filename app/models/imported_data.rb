class ImportedData < ActiveRecord::Base
  include Encodable

  belongs_to :user

  after_create :update_user

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_user
    user.update_attributes(import: true, name: encoded_name)
  end
end
