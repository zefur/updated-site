class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
    
    before_action :set_copyright

    def set_copyright
        @copyright = Copyright::Renderer.copyright 'James Hall', 'All rights reserved'
    end
end
    module Copyright
        class Renderer
            def self.copyright name, msg
                "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
            end
        end
    end

