# lita-simple-mopidy

TODO: Add a description of the plugin.

## Installation

Add lita-simple-mopidy to your Lita instance's Gemfile:

``` ruby
gem "lita-simple-mopidy"
```

## Configuration

Specify the Mopidy API HTTP Server in the Lita config file. Check the [Mopidy API doc](https://docs.mopidy.com/en/latest/api/http/)

### Example

```ruby
Lita.configure do |config|
  config.handlers.simple_mopidy.http_server = "http://localhost:6680/mopidy/rpc"
end
```

## Usage

You can use the keyword `music` or `mopidy` and the action you want to perform. Optionally you can add the `me` suffix for those coming from [Hubot](http://hubot.github.com/)

```
Lita: music play
Lita: mopidy stop
Lita: music me previous
```

## License

[MIT](http://opensource.org/licenses/MIT)
