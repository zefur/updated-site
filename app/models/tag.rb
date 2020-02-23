class Tag < ApplicationRecord
    has_many :taggings
    has_many :blogs, through: :taggings

    def self.counts
        self.select("topic, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
      end
end
