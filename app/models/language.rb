class Language < ApplicationRecord
    has_many :stacks
    has_many :projects, through: :stacks

    def self.counts
        self.select("language, count(stacks.language_id) as count").joins(:stacks).group("stacks.language_id")
      end
end
