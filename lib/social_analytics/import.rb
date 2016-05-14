module SocialAnalytics
  module Import
    def self.from_list_of_graduates(file, year = nil)
      csv_text = File.read(file)
      CSV.parse(csv_text, headers: false).each do |row|
        last_name, first_name, middle_name = row[0].split(' ')
        ImportedData.create(
          first_name: first_name,
          last_name: last_name,
          middle_name: middle_name,
          graduated_at: SocialAnalytics::Preprocessing.graduation_date(year)
        )
      end
    end
  end
end
