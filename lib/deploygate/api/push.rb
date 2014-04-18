module Deploygate::Api
  module Push
    class << self
      def upload_file(owner_name, token, filepath,
                      message = nil, distribution_key = nil, release_note = nil)
        params = {
          token: token,
          file: Faraday::UploadIO.new(filepath, "application/octet-stream"),
          message: message,
          distribution_key: distribution_key,
          release_note: release_note,
        }.select {|k, v| v }
        response = connection.post(endpoint_path(owner_name), params)
        response.body
      end

      def connection
        Faraday.new(url: BASE_URL) do |faraday|
          faraday.request :multipart
          faraday.request :url_encoded
          faraday.response :logger
          faraday.response :json
          faraday.adapter :net_http
        end
      end

      def endpoint_path(owner_name)
        path = "/api/users/%<owner_name>s/apps" % {
          owner_name: owner_name,
        }
      end
    end
  end
end
