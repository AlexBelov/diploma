class FacebookData < ActiveRecord::Base
  belongs_to :user

  before_save :transliterate_name

  def transliterate_name
    self.encoded_name = Russian.translit(original_name)
  end
end
