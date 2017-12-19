class Skill < ActiveRecord::Base
  has_and_belongs_to_many :linkedin_data

  def self.bubble_csv
    CSV.generate do |csv|
      csv << ['id', 'value']
      Skill.find_each do |skill|
        csv << [skill.name, LinkedinDataSkills.where(skill_id: skill.id).count]
      end
    end
  end
end
