require "lita"
require "httpi"

module Lita
  module Handlers
    class SimpleMopidy < Handler
      URL = "http://mopidi.local:6680/mopidy/rpc"

      route(
        /(?:music|mopidy)(?:\s+me)? (.+)/,
        :execute,
        :command => true,
        :help    => {
          "music ACTION" => "Executes the given ACTION in mopidy"
        }
      )

      def execute(response)
        action = response.matches[0][0]

        HTTPI.post(
          URL,
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
