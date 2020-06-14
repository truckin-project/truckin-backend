module HereApi
  class Client
    HTTP_OK_CODE = 200

    API_ENDPOINT = 'https://router.hereapi.com/v8/'.freeze

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def routes(params: {})
      request(
        http_method: :get,
        endpoint: "routes",
        params: params
      )
    end

    private
    def client
      @_client ||= Faraday.new(API_ENDPOINT) do |client|
        client.request :url_encoded
        client.adapter Faraday.default_adapter
      end
    end

    def request(http_method:, endpoint:, params: {})
      params.merge!(api_key: api_key) if api_key.present?
      params = params.deep_transform_keys { |key| key.to_s.camelize(:lower) }
      response = client.public_send(http_method, endpoint, params)
      parsed_response = Oj.load(response.body)
      parsed_response = parsed_response.deep_transform_keys { |key| key.to_s.underscore.to_sym }

      return parsed_response if response.status == HTTP_OK_CODE

      raise StandardError, "Code: #{response.status}, response: #{response.body}"
    end
  end
end
