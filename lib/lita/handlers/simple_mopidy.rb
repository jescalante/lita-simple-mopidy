require "lita"
require "curb"
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

        param1, param2 = action.split(" ")

        body = {
          "method"  => "core.playback.#{ param1 }",
          "jsonrpc" => "2.0",
          "id"      => 1
        }

        body["params"] = if param1 == "set_volume" && !param2.nil?
          { "volume" => param2.to_i }
        else
          {}
        end

        HTTPI.adapter = :curb
        HTTPI.post(
          Lita.config.handlers.simple_mopidy.http_server,
          body.to_json,
          :curb
        )

        response.reply "#{ action } executed."
      end
    end

    Lita.register_handler(SimpleMopidy)
  end
end
