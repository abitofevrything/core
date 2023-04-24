import 'package:args/args.dart';
import 'package:mineral/src/commands/compile/exe.dart';
import 'package:mineral/src/commands/compile/js.dart';
import 'package:mineral/src/commands/help.dart';
import 'package:mineral/src/commands/make/command.dart';
import 'package:mineral/src/commands/make/event.dart';
import 'package:mineral/src/commands/make/package.dart';
import 'package:mineral/src/commands/make/service.dart';
import 'package:mineral/src/commands/make/shared_state.dart';
import 'package:mineral/src/internal/services/console/console_service.dart';
import 'package:mineral/src/internal/services/console/themes/console_theme.dart';
import 'package:mineral/src/internal/services/console/themes/default_theme.dart';
import 'package:mineral_contract/mineral_contract.dart';
import 'package:mineral_ioc/ioc.dart';

class CommandLineInterface extends CliServiceContract {
  final List<MineralPackageContract> packages;
  final ArgParser _parser = ArgParser();
  final Map<String, CliCommandContract> _commands = {};
  final ConsoleService _console = ConsoleService(theme: DefaultTheme());

  CommandLineInterface({ this.packages = const [] }) {
    ioc.bind((ioc) => ConsoleService(theme: ConsoleTheme()));

    register([
      MakeEvent(_console),
      MakeCommand(_console),
      MakeSharedState(_console),
      MakeModule(_console),
      MakeService(_console),
      CompileExecutable(_console),
      CompileJavascript(_console),
      Help(_console, _commands),
    ]);

    for (final package in packages) {
      register(package.injectCommands());
    }
  }

  @override
  ConsoleService get console => _console;

  @override
  void register (List<CliCommandContract> commands) {
    for (final command in commands) {
      _commands.putIfAbsent(command.name, () => command);

      final ArgParser parser = ArgParser();
      if (command.arguments.isNotEmpty) {
        for (final argument in command.arguments) {
          parser.addOption(argument);
        }
      }

      _parser.addCommand(command.name, parser);
    }
  }

  @override
  Future<void> handle (List<String> arguments) async {
    ArgResults results = _parser.parse(arguments);
    final command = _commands[results.command?.name ?? 'help'];

    if (command != null) {
      if (command.arguments.isNotEmpty && results.arguments.length - 1 != command.arguments.length) {
        command.console.error('Please provide ${command.arguments.map((e) => '<$e>').join(', ')} params.');
        return;
      }

      final params = {};
      for (int i = 0; i < command.arguments.length; i++) {
        params.putIfAbsent(command.arguments[i], () => results.arguments[i + 1]);
      }

      return await command.handle(params);
    }
  }
}