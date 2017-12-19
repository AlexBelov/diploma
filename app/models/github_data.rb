class GithubData < ActiveRecord::Base
  include BelongsToUser

  belongs_to :user
  has_many :repositories
  has_many :stars

  after_create :update_user

  def full_name
    name
  end

  def encoded_name
    name
  end

  def update_user
    user.update_attributes(github: true)
  end
end
