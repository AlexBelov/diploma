class FacebookGroupMember < ActiveRecord::Base
  before_save :transliterate_name

  def transliterate_name
    self.name = Russian.translit(original_name)
  end
end
