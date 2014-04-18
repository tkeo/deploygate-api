require "thor"

module Deploygate::Api
  class Cli < Thor
    desc "upload FILE", "Upload application binary file"
    method_option :owner_name,       aliases: "-o", required: true
    method_option :token,            aliases: "-t", required: true
    method_option :message,          aliases: "-m"
    method_option :distribution_key, aliases: "-d"
    method_option :release_note,     aliases: "-r"
    def upload(filepath)
      owner_name       = options[:owner_name]
      token            = options[:token]
      message          = options[:message]
      distribution_key = options[:distribution_key]
      release_note     = options[:release_note]
      Push.upload_file(owner_name, token, filepath, message, distribution_key, release_note)
    end
  end
end
