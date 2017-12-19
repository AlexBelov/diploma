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

  def recommendations
    return nil if !stars.present?
    command = "python lib/stars.py #{stars.pluck(:repo).join(' ')}"
    JSON.parse(%x[#{command}])
  end

  def self.retrain_model
    command = "python lib/train_model.py"
    %x[#{command}]
  end
end
