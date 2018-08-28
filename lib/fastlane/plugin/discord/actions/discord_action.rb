require 'fastlane/action'
require_relative '../helper/discord_helper'
require 'discordrb/webhooks'

module Fastlane
  module Actions
    class DiscordAction < Action
      def self.run(params)
        client = Discordrb::Webhooks::Client.new(url: params[:discord_url])
        client.execute do |builder|
          builder.content = params[:message]
          # builder.add_embed do |embed|
          #   embed.title = 'Embed title'
          #   embed.description = 'Embed description'
          #   embed.timestamp = Time.now
          # end
        end
      end

      def self.description
        "post message to discord"
      end

      def self.authors
        ["Yugo Terada"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "post message to discord"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :message,
                                  env_name: "DISCORD_MESSAGE",
                               description: "Post message",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :discord_url,
                                  env_name: "DISCORD_URL",
                               description: "URL of discord webhook",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
