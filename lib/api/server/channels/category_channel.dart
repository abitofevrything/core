import 'guild_channel.dart';

class CategoryChannel extends GuildChannel {
  CategoryChannel._(super.id, super.label, {required super.guild, required super.categoryChannel, required super.permissions, required super.flags, required super.position});
}