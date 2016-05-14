module Encodable
  extend ActiveSupport::Concern

  included do
    before_save :encode_name
  end

  protected

  def encode_name
    self.encoded_name = SocialAnalytics::Preprocessing.encode_name(full_name)
  end
end
