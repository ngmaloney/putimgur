require "putimgur/version"
require "net/http"
require "base64"
require "json"
require "debugger"

module Putimgur
  IMGUR_KEY = "411c81089f9ae135860c0f90d2f010ba"
  IMGUR_URL = "http://api.imgur.com/2/upload.json"
  # Your code goes here...

  class ImageHandler
    attr_reader :response
    
    def initialize(image)
      request = Net::HTTP.post_form(uri, key: IMGUR_KEY, image: encoded_image(image))
      @response = parse_response(request)
    end

    def uri
      URI(IMGUR_URL)
    end

    def encoded_image(image)
      file = File.open(image)
      Base64.strict_encode64(file.read).strip
    end

    def parse_response(request)
      results = JSON.parse(request.body)
      if results["upload"] && results["upload"]["links"] && results["upload"]["links"]["original"]
        path = results["upload"]["links"]["original"]
      else
        error "Error fetching results"
        exit 0
      end
      path
    end
  end
end
