require "lita"
require "httpi"
require "json"

module Lita
  module Handlers
    class SimpleMopidy < Handler
      route(
        /(?:music|mopidy)(?:\s+me)? (.+)/,
        :execute,
        :command => true,
        :help    => {
          "music ACTION" => "Executes the given ACTION in mopidy"
        }
      )

      def self.default_config(config)
        config.http_server = nil
      end

      def execute(response)
        action = response.matches[0][0]

        HTTPI.adapter = :curb
        HTTPI.post(
          Lita.config.handlers.simple_mopidy.http_server,
          {
            "method"  => "core.playback.#{ action }",
            "jsonrpc" => "2.0",
            "params"  => {},
            "id" => 1
          }.to_json,
          :curb
        )

        response.reply "#{ action } executed."
      end
    end

    Lita.register_handler(SimpleMopidy)
  end
end
