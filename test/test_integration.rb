require 'webmachine'
require 'webmachine/adapters/rack'
require 'webmachine/sprockets'

require 'test_server'
Sprockets::Environment

class TestServer
  def webmachine_app(env)
    Webmachine::Application.new do |app|
      assets = Webmachine::Sprockets.resource_for(env)
      app.add_route [ 'assets', '*' ], assets

      index = Webmachine::Sprockets.resource_for(env.index)
      app.add_route [ 'cached', 'javascripts', '*' ], index
    end
  end

  def default_app
    Webmachine::Adapters::Rack.new(nil, webmachine_app(@env).dispatcher)
  end
end
