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

  def self.chord_csv
    CSV.generate do |csv|
      csv << ['lang1', 'lang2', 'weight']
      Language.find_each do |lang|
        other_langs = lang.repositories.map(&:languages).flatten.map(&:id)
        most_used = other_langs.
                      each_with_object(Hash.new(0)){ |m,h| h[m] += 1 }.
                      sort_by{ |k,v| v }.last(5).map{ |o| o[1] }
        Language.where(id: most_used).each do |ol|
          csv << [lang.name, ol.name, other_langs.count(lang.id)]
        end
      end
    end
  end
end
