class Country
  def self.bubble_csv
    CSV.generate do |csv|
      csv << ['id', 'value']
      countries = Company.pluck(:country).compact + LinkedinData.pluck(:country).compact
      countries_uniq = countries.uniq
      countries_uniq.each do |country|
        csv << [country, countries.count(country)]
      end
    end
  end
end
