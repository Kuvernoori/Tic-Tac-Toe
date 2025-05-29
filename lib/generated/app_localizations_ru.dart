// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get selectTheme => 'Выберите тему';

  @override
  String get lightTheme => 'Светлая тема';

  @override
  String get darkTheme => 'Тёмная тема';

  @override
  String get mainMenu => 'Главное меню';

  @override
  String get goToInteractiveWidgets => 'Интерактивные виджеты';

  @override
  String get startGame => 'Начать игру';

  @override
  String get aboutProject => 'О проекте';

  @override
  String get authors => 'Авторы';

  @override
  String get gameHistory => 'История игр';

  @override
  String get settings => 'Настройки';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageRussian => 'Руский';

  @override
  String get languageKazakh => 'Казахский';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get aboutTheGame => 'Об игре';

  @override
  String get aboutTheTeam => 'О команде';

  @override
  String get developers => 'Разработчики:';

  @override
  String get designer => 'Дизайнер интерфейса:';

  @override
  String get logicDeveloper => 'Разработчик логики игры:';

  @override
  String get courseInfo =>
      'Проект создан в рамках курса «Кроссплатформенная разработка» в Astana IT University.';

  @override
  String get mentor =>
      'Научный руководитель: Ассистент-профессор Абзал Кызырканов';

  @override
  String get game => 'Игра';

  @override
  String get gameDescription =>
      'Это простая кросс-платформенная игра в крестики-нолики, разработанная с использованием Flutter. Игра поддерживает как ландшафтную, так и портретную ориентацию, а также предоставляет чистый и отзывчивый интерфейс.';

  @override
  String get profile => 'Профиль';

  @override
  String get guestModeBanner =>
      'Вы находитесь в гостевом режиме. Пожалуйста, войдите, чтобы получить доступ ко всем функциям.';

  @override
  String get signIn => 'Войти';

  @override
  String get logout => 'Выйти';

  @override
  String get tic_tac_toe => 'крестики-нолики';

  @override
  String get playAgain => 'Играть снова';

  @override
  String playerWins(Object player) {
    return 'Игрок $player выиграл!';
  }

  @override
  String get draw => 'Ничья!';

  @override
  String currentTurn(Object player) {
    return 'Текущий ход: $player';
  }

  @override
  String get gameHistoryTitle => 'Game History';

  @override
  String get emptyHistory => 'History is empty';
}
