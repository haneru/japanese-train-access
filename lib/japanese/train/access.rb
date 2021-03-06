require "japanese/train/access/version"
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'thor'

module Japanese
  module Train
    module Access
      def self.route
        puts "出発駅を入力してください"
        start = STDIN.gets.strip
        puts "終着駅を入力してください"
        finish = STDIN.gets.strip


    	  url = "http://transit.yahoo.co.jp/search/result?flatlon=&from=#{start}&tlatlon=&to=#{finish}"
    	  url_escape = URI.escape(url)
    	  page = Nokogiri::HTML.parse(open(url_escape).read)



        3.times do |i|
          route = "ルート#{i+1}"
          route_box = page.css("#route0#{i+1}")

          puts route
          puts route_box.css('.routeSummary .time').text
          puts route_box.css('.fare span').text.match(/\d+/).to_s + '円'
          time = route_box.css('.routeDetail .station .time').map(&:text).map(&:strip)
          station = route_box.css('.station dl dt a').map(&:text)
          access = route_box.css('.access div').text.delete("[train]").strip.split
          #binding pry
          station.count.times do |i|
            puts time[i] + " " + station[i]
            puts access[i]
            next unless access
          end
        end
      end
    end
  end
end
