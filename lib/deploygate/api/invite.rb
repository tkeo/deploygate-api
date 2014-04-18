module Deploygate::Api
  module Invite
    module Role
      DEVELOPER = 1
      TESTER    = 2
    end

    class << self
      def get_members(owner_name, app_id, token)
        params = { token: token }
        response = connection.get(endpoint_path(owner_name, app_id), params)
        response.body
      end

      def add_members(owner_name, app_id, token, users, role = Role::DEVELOPER)
        params = {
          token: token,
          users: Array(users).join(","),
          role:  role,
        }
        response = connection.post(endpoint_path(owner_name, app_id), params)
        response.body
      end

      def remove_members(owner_name, app_id, token, users)
        params = {
          token: token,
          users: Array(users).join(","),
        }
        response = connection.delete(endpoint_path(owner_name, app_id), params)
        response.body
      end

      def connection
        Faraday.new(url: BASE_URL) do |faraday|
          faraday.request :url_encoded
          faraday.response :logger
          faraday.response :json
          faraday.adapter :net_http
        end
      end

      def endpoint_path(owner_name, app_id)
        path = "/api/users/%<owner_name>s/apps/%<app_id>s/members" % {
          owner_name: owner_name,
          app_id: app_id,
        }
      end
    end
  end
end
