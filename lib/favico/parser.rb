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
      favicon_url = fetch_favicon_url(url)
      response = self.class.get(favicon_url)
      if not response.nil? && response.code == 200
        return response.body
      end
      nil
    end

    def fetch_favicon_url(url)
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
      icon = "//link[contains(@rel, 'icon')]/@href"
      shortcut_icon = "//link[contains(@rel, 'Shortcut Icon')]/@href"
      resource = doc.at_xpath(icon, shortcut)
      if !resource.nil?
        resource.value
      else
        return nil
      end
    end
  end
end
