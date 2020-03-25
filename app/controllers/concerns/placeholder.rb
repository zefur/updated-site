module Placeholder
    extend ActiveSupport::Concern

    def self.image(height:, width:)
        "http://placehold.it/#{height}x#{width}"
    end

end