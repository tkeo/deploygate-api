# deploygate-api

ruby client for [deploygate](https://deploygate.com/) API (unofficial)

## Installation

Add this line to your application's Gemfile:

    gem 'deploygate-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deploygate-api

## Example

    require "deploygate-api"

    owner_name = "YOUR USERNAME"
    app_id = "com.example.app"
    token = "YOUR API KEY"

    Deploygate::Api::Push.upload_file(owner_name, token, "/path/to/binary")
    Deploygate::Api::Invite.get_members(owner_name, app_id, token)
    Deploygate::Api::Invite.add_members(owner_name, app_id, token, "username")
    Deploygate::Api::Invite.remove_members(owner_name, app_id, token, "username")

## CLI Usage

    $ deploygate-api help upload
    Usage:
      deploygate-api upload FILE -o, --owner-name=OWNER_NAME -t, --token=TOKEN

    Options:
      -o, --owner-name=OWNER_NAME
      -t, --token=TOKEN
      -m, [--message=MESSAGE]
      -d, [--distribution-key=DISTRIBUTION_KEY]
      -r, [--release-note=RELEASE_NOTE]

    Upload application binary file

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
