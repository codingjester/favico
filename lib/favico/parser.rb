require 'nokogiri'
require 'httparty'

module Favico
  class Parser
    include HTTParty

    def root_favicon?(url)
      url = url + "/favicon.ico"
      response = self.class.head(url)
      return response.code == 200
    end

    def fetch_favicon(url)
      if root_favicon?(url)
        return url + "/favicon.ico"
      end
      parse_favicon(url)
    end

    def parse_favicon(url)
      response = self.class.get(url)
      favicon = xpath_parse(response.body)
      if (!favicon.start_with?("http"))
        favicon = url + "/" + favicon
      end
      favicon
    end

    def xpath_parse(body)
      doc = Nokogiri::HTML(body)
      doc.xpath("//link[contains(@rel, 'icon')]/@href")[0].value
    end
  end
end
