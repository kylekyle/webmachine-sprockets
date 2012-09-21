require 'webmachine'
require 'sprockets'

require 'webmachine/sprockets/resource'
require 'webmachine/sprockets/version'

module Webmachine
  module Sprockets
    def self.resource_for(sprockets)
      Resource.dup.tap {|r| r.sprockets = sprockets }
    end
  end
end
