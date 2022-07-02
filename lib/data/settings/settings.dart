import 'dart:convert';

import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final bool useBioMetric;
  final bool showUnreadMessageBadge;
  final Themetype theme;
  final SupportedLanguages language;
  final NotificationLevel notificationLevel;
  const Settings({
    this.useBioMetric = false,
    this.showUnreadMessageBadge = true,
    this.theme = Themetype.system,
    this.language = SupportedLanguages.englishUS,
    this.notificationLevel = NotificationLevel.all,
  });

  Settings copyWith({
    bool? useBioMetric,
    bool? showUnreadMessageBadge,
    Themetype? theme,
    SupportedLanguages? language,
    NotificationLevel? notificationLevel,
  }) {
    return Settings(
      useBioMetric: useBioMetric ?? this.useBioMetric,
      showUnreadMessageBadge:
          showUnreadMessageBadge ?? this.showUnreadMessageBadge,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      notificationLevel: notificationLevel ?? this.notificationLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'useBioMetric': useBioMetric,
      'showUnreadMessageBadge': showUnreadMessageBadge,
      'theme': theme.name,
      'language': language.name,
      'notificationLevel': notificationLevel.name,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      useBioMetric: map['useBioMetric'] ?? false,
      showUnreadMessageBadge: map['showUnreadMessageBadge'] ?? false,
      theme: Themetype.values.byName(map['theme']),
      language: SupportedLanguages.values.byName(map['language']),
      notificationLevel:
          NotificationLevel.values.byName(map['notificationLevel']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Settings(useBioMetric: $useBioMetric, showUnreadMessageBadge: $showUnreadMessageBadge, theme: $theme, language: $language, notificationLevel: $notificationLevel)';
  }

  @override
  List<Object> get props {
    return [
      useBioMetric,
      showUnreadMessageBadge,
      theme,
      language,
      notificationLevel,
    ];
  }
}

enum Themetype {
  system,
  dark,
  light,
}

enum SupportedLanguages {
  englishUS,
  englishUK,
  spanish,
  french,
}

String supportedLanguagesToLocal(SupportedLanguages supportedLanguage) {
  switch (supportedLanguage) {
    case SupportedLanguages.englishUS:
      return 'en';
    case SupportedLanguages.englishUK:
      return '';
    case SupportedLanguages.spanish:
      return 'es';
    case SupportedLanguages.french:
      return 'fr';
  }
}

enum NotificationLevel {
  all,
  importatantOnly,
  none,
}
