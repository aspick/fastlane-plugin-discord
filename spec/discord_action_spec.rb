describe Fastlane::Actions::DiscordAction do
  describe '#run' do
    it 'post message' do
      url = 'http://127.0.0.1'
      message = "Test message"

      arguments = Fastlane::ConfigurationHelper.parse(Fastlane::Actions::DiscordAction, {
        discord_url: url,
        message: message
      })

      expect(RestClient).to receive(:post).with(url, anything, anything)

      Fastlane::Actions::DiscordAction.run(arguments)
    end
  end
end
