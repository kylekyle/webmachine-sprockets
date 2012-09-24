Enumerator = Enumerable::Enumerator unless Object.const_defined?(:Enumerator)

module Webmachine
  module Sprockets
    class Resource < ::Webmachine::Resource
      class << self
        attr_accessor :sprockets
      end

      def initialize
        @rack_response = call_sprockets(rack_env)
      end

      def finish_request
        response.code = @rack_response[0]
        response.headers.clear
        response.headers.merge!(@rack_response[1])
        response.body = Enumerator.new(@rack_response[2]).to_a.join
      end

      private

      def call_sprockets(env)
        self.class.sprockets.call(env)
      end

      def rack_env
        env = {
          'PATH_INFO'    => '/' + logical_path,
          'QUERY_STRING' => query_string
        }
        request.headers.each {|key, value| env[cgi_key(key)] = value }
        env
      end

      def cgi_key(key)
        key = key.upcase.gsub('-', '_')
        key =~ /^Content-(Type|Length)$/ ? key : 'HTTP_' + key
      end

      def logical_path
        request.path_tokens.join("/")
      end

      def query_string
        request.uri.query.to_s
      end
    end
  end
end
