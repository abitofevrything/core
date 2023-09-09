class WelcomeScreen {
  final String? description;
  final List<WelcomeScreenChannel>? welcomeChannels;

  WelcomeScreen({
    this.description,
    this.welcomeChannels,
  });
}

class WelcomeScreenChannel {
  final String channelId;
  final String description;

  // todo replace to Emoji builder
  final String? emojiId;
  final String? emojiName;

  WelcomeScreenChannel({
    required this.channelId,
    required this.description,
    this.emojiId,
    this.emojiName,
  });
}