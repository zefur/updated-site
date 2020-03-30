class Project < ApplicationRecord
  include Placeholder
  has_many :stacks, dependent: :destroy
    has_many :languages, through: :stacks

    def stack_list
        self.tags.map(&:language).join(', ')
      end
    
      def stack_list=(language)
        self.tags = language.split(',').map do |n|
          Tag.where(language: n.strip).first_or_create!
        end
      end

      has_one_attached :main_image
      has_one_attached :thumb_image

      def set_defaults
        self.main_image ||= Placeholder.image(height:600, width: 400)
        self.thumb_image ||= Placeholder.image(height:300, width: 200)

    end

end
