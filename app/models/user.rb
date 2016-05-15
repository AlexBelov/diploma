class User < ActiveRecord::Base
  has_one :facebook_data
  has_one :linkedin_data
  has_many :github_data
  has_one :imported_data
  has_many :addresses, as: :addressable
  has_many :images, as: :imageable

  def self.remove_duplicates
    users = User.order(:name).pluck(:id, :name)
    names = users.map{|u| u[1]}
    duplicates = users.select{|u| names.count(u[1]) > 1}
    user_uniq_names = duplicates.map{|u| u[1]}.uniq
    user_uniq_names.each do |name|
      users = duplicates.select{|d| d[1] == name}
      original, *rest = users.sort_by{|u| u[0]}
      rest_users = User.where(id: rest.map{|r| r[0]})
      rest_users.delete_all
    end
  end
end
