class Project < ApplicationRecord
    has_many :languages, through: :stacks

    def stack_list
        self.tags.map(&:language).join(', ')
      end
    
      def stack_list=(language)
        self.tags = language.split(',').map do |n|
          Tag.where(language: n.strip).first_or_create!
        end
      end


end
