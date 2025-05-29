// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get selectTheme => 'Тақырыпты таңдаңыз';

  @override
  String get lightTheme => 'Ашық тақырып';

  @override
  String get darkTheme => 'Қараңғы тақырып';

  @override
  String get mainMenu => 'Басты мәзір';

  @override
  String get goToInteractiveWidgets => 'Интерактивті виджеттерге өту';

  @override
  String get startGame => 'Ойынды бастау';

  @override
  String get aboutProject => 'Жоба туралы';

  @override
  String get authors => 'Авторлар';

  @override
  String get gameHistory => 'Ойын тарихы';

  @override
  String get settings => 'Баптаулар';

  @override
  String get languageEnglish => 'Ағылшын';

  @override
  String get languageRussian => 'Орыс';

  @override
  String get languageKazakh => 'Қазақ';

  @override
  String get selectLanguage => 'Тілді таңдаңыз';

  @override
  String get aboutTheGame => 'Ойын туралы';

  @override
  String get aboutTheTeam => 'Топ туралы';

  @override
  String get developers => 'Бағдарламашылар:';

  @override
  String get designer => 'UI/UX дизайнері:';

  @override
  String get logicDeveloper => 'Ойын логикасын жасаушы:';

  @override
  String get courseInfo =>
      'Бұл жоба Astana IT University-де «Кроссплатформалық әзірлеу» курсы аясында жасалған.';

  @override
  String get mentor => 'Жетекші: ассистент-профессор Абзал Қызырқанов';

  @override
  String get game => 'Ойын';

  @override
  String get gameDescription =>
      'Бұл Flutter қолданбасы арқылы жасалған қарапайым кросс-платформалық Tic Tac Toe ойыны. Ойын пейзаж және портреттік бағыттарды қолдайды, таза және икемді интерфейс ұсынады.';

  @override
  String get profile => 'Профиль';

  @override
  String get guestModeBanner =>
      'Сіз қонақ режимінде тұрсыз. Барлық мүмкіндіктерге қол жеткізу үшін кіріңіз.';

  @override
  String get signIn => 'Кіру';

  @override
  String get logout => 'Шығу';

  @override
  String get tic_tac_toe => 'айқас алаңы';

  @override
  String get playAgain => 'Тагы ойнау';

  @override
  String playerWins(Object player) {
    return 'Ойыншы $player жеңді!';
  }

  @override
  String get draw => 'Тең ойын!';

  @override
  String currentTurn(Object player) {
    return 'Қазіргі кезек: $player';
  }

  @override
  String get gameHistoryTitle => 'Ойын тарихы';

  @override
  String get emptyHistory => 'Тарих бос';
}
