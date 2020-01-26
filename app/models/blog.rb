class Blog < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

    def self.tagged_with(topic)
        Tag.find_by!(topic: topic).blogs
      end
    
      def self.tag_counts
        Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
      end
    
      def tag_list
        self.tags.map(&:topic).join(', ')
      end
    
      def tag_list=(topics)
        self.tags = topics.split(',').map do |n|
          Tag.where(topic: n.strip).first_or_create!
        end
      end
    
end
