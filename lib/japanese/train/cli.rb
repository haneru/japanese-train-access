require 'japanese/train/access'
require 'thor'

module JapaneseTrainAccess
  class CLI < Thor
    desc "jta", "If you want to seach train access information in japan near by now time."
    def jta
      Japanese::Train::Access.route
    end

    desc "version", "version"
    def version
      p Japanese::Train::Access::VERSION
    end
  end
end
