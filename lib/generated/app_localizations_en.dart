// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get selectTheme => 'Select Theme';

  @override
  String get lightTheme => 'Light Theme';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get mainMenu => 'Main Menu';

  @override
  String get goToInteractiveWidgets => 'Interactive Widgets';

  @override
  String get startGame => 'Start Game';

  @override
  String get aboutProject => 'About the Project';

  @override
  String get authors => 'Authors';

  @override
  String get gameHistory => 'Game History';

  @override
  String get settings => 'Settings';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageRussian => 'Russian';

  @override
  String get languageKazakh => 'Кazakh';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get aboutTheGame => 'About the Game';

  @override
  String get aboutTheTeam => 'About the Team';

  @override
  String get developers => 'Developers';

  @override
  String get designer => 'Designer';

  @override
  String get logicDeveloper => 'Logic Developer';

  @override
  String get courseInfo =>
      'The project was created as part of the “Cross-platform development” course at Astana IT University.';

  @override
  String get mentor => 'Supervisor: Assistant Professor Abzal Kyzyrkanov';

  @override
  String get game => 'Game';

  @override
  String get gameDescription =>
      'This is a simple cross-platform Tic Tac Toe game developed using Flutter. The game supports both landscape and portrait orientations and provides a clean and responsive UI.';

  @override
  String get profile => 'Profile';

  @override
  String get guestModeBanner =>
      'You are in guest mode. Please sign in to access all features.';

  @override
  String get signIn => 'Sign In';

  @override
  String get logout => 'log out';

  @override
  String get tic_tac_toe => 'Tic Tac Toe';

  @override
  String get playAgain => 'Play Again';

  @override
  String playerWins(Object player) {
    return 'Player $player wins!';
  }

  @override
  String get draw => 'It\'s a draw!';

  @override
  String currentTurn(Object player) {
    return 'Current turn: $player';
  }

  @override
  String get gameHistoryTitle => 'Game History';

  @override
  String get emptyHistory => 'History is empty';
}
