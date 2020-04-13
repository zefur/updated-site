class Project < ApplicationRecord
  include Placeholder
  has_many :stacks, dependent: :destroy
  has_many :languages, through: :stacks

    def self.tagged_with(code)
      Language.find_by!(language: code).projects
    end
  
    def self.language_counts
      Language.select('language.*, count(stacks.language_id) as count').joins(:stacks).group('stacks.language_id')
    end

    def stack_list
        self.languages.map(&:language).join(',')
    end
    
    def stack_list=(language)
      self.languages = language.split(',').map do |n|
        Language.where(language: n.strip).first_or_create!
      end
    end

    has_one_attached :main_image
    has_one_attached :thumb_image

    def set_defaults
      self.main_image ||= Placeholder.image(height:600, width: 400)
      self.thumb_image ||= Placeholder.image(height:300, width: 200)

  end

end
