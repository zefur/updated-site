class Language < ApplicationRecord
    has_many :projects, through: :stacks
end
