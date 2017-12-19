class Language < ActiveRecord::Base
  has_and_belongs_to_many :repositories

  def self.bubble_csv
    CSV.generate do |csv|
      csv << ['id', 'value']
      Language.find_each do |lang|
        csv << [lang.name, LanguagesRepositories.where(language_id: lang.id).count]
      end
    end
  end
end
