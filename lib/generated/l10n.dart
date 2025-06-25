// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Username`
  String get Username {
    return Intl.message(
      'Username',
      name: 'Username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Inscription {
    return Intl.message(
      'Register',
      name: 'Inscription',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect username or password`
  String get MauvaisNomOuMotDePasse {
    return Intl.message(
      'Incorrect username or password',
      name: 'MauvaisNomOuMotDePasse',
      desc: '',
      args: [],
    );
  }

  /// `Error while connecting`
  String get ErreurConnexion {
    return Intl.message(
      'Error while connecting',
      name: 'ErreurConnexion',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get ConfirmezMotDePasse {
    return Intl.message(
      'Confirm password',
      name: 'ConfirmezMotDePasse',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get MotsDePasseDifferents {
    return Intl.message(
      'Passwords do not match',
      name: 'MotsDePasseDifferents',
      desc: '',
      args: [],
    );
  }

  /// `Username already taken`
  String get NomDejaPris {
    return Intl.message(
      'Username already taken',
      name: 'NomDejaPris',
      desc: '',
      args: [],
    );
  }

  /// `Username is too short`
  String get NomTropCourt {
    return Intl.message(
      'Username is too short',
      name: 'NomTropCourt',
      desc: '',
      args: [],
    );
  }

  /// `Username is too long`
  String get NomTropLong {
    return Intl.message(
      'Username is too long',
      name: 'NomTropLong',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get MotDePasseTropCourt {
    return Intl.message(
      'Password is too short',
      name: 'MotDePasseTropCourt',
      desc: '',
      args: [],
    );
  }

  /// `Password is too long`
  String get MotDePasseTropLong {
    return Intl.message(
      'Password is too long',
      name: 'MotDePasseTropLong',
      desc: '',
      args: [],
    );
  }

  /// `Error during registration, check your internet connection`
  String get ErreurInscription {
    return Intl.message(
      'Error during registration, check your internet connection',
      name: 'ErreurInscription',
      desc: '',
      args: [],
    );
  }

  /// `Network error, please try again.`
  String get ErreurReseau {
    return Intl.message(
      'Network error, please try again.',
      name: 'ErreurReseau',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Accueil {
    return Intl.message(
      'Home',
      name: 'Accueil',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get Recharger {
    return Intl.message(
      'Reload',
      name: 'Recharger',
      desc: '',
      args: [],
    );
  }

  /// `No tasks available`
  String get AucuneTache {
    return Intl.message(
      'No tasks available',
      name: 'AucuneTache',
      desc: '',
      args: [],
    );
  }

  /// `Progression : `
  String get Avancement {
    return Intl.message(
      'Progression : ',
      name: 'Avancement',
      desc: '',
      args: [],
    );
  }

  /// `Time elapsed : `
  String get TempsEcoule {
    return Intl.message(
      'Time elapsed : ',
      name: 'TempsEcoule',
      desc: '',
      args: [],
    );
  }

  /// `Deadline : `
  String get DateLimite {
    return Intl.message(
      'Deadline : ',
      name: 'DateLimite',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get AucuneImage {
    return Intl.message(
      'No image',
      name: 'AucuneImage',
      desc: '',
      args: [],
    );
  }

  /// `Error importing image`
  String get ErreurImportation {
    return Intl.message(
      'Error importing image',
      name: 'ErreurImportation',
      desc: '',
      args: [],
    );
  }

  /// `Task consultation`
  String get ConsultationTitre {
    return Intl.message(
      'Task consultation',
      name: 'ConsultationTitre',
      desc: '',
      args: [],
    );
  }

  /// `Name : `
  String get NomTache {
    return Intl.message(
      'Name : ',
      name: 'NomTache',
      desc: '',
      args: [],
    );
  }

  /// `Deadline : `
  String get DeadlineTache {
    return Intl.message(
      'Deadline : ',
      name: 'DeadlineTache',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of elapsed time : `
  String get TempsEcouleTache {
    return Intl.message(
      'Percentage of elapsed time : ',
      name: 'TempsEcouleTache',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of progress : `
  String get AvancementTache {
    return Intl.message(
      'Percentage of progress : ',
      name: 'AvancementTache',
      desc: '',
      args: [],
    );
  }

  /// `Import an image first`
  String get ImporterImageEnPremier {
    return Intl.message(
      'Import an image first',
      name: 'ImporterImageEnPremier',
      desc: '',
      args: [],
    );
  }

  /// `Import an image`
  String get ImporterImage {
    return Intl.message(
      'Import an image',
      name: 'ImporterImage',
      desc: '',
      args: [],
    );
  }

  /// `Back to home`
  String get RetourAccueil {
    return Intl.message(
      'Back to home',
      name: 'RetourAccueil',
      desc: '',
      args: [],
    );
  }

  /// `Error adding task`
  String get ErreurAjout {
    return Intl.message(
      'Error adding task',
      name: 'ErreurAjout',
      desc: '',
      args: [],
    );
  }

  /// `Create Task`
  String get AjoutTitre {
    return Intl.message(
      'Create Task',
      name: 'AjoutTitre',
      desc: '',
      args: [],
    );
  }

  /// `Name of the task`
  String get NomTacheCreation {
    return Intl.message(
      'Name of the task',
      name: 'NomTacheCreation',
      desc: '',
      args: [],
    );
  }

  /// `No date selected`
  String get AucuneDateSelectionnee {
    return Intl.message(
      'No date selected',
      name: 'AucuneDateSelectionnee',
      desc: '',
      args: [],
    );
  }

  /// `Deadline : `
  String get DealineCreation {
    return Intl.message(
      'Deadline : ',
      name: 'DealineCreation',
      desc: '',
      args: [],
    );
  }

  /// `Choose date`
  String get ChooseDate {
    return Intl.message(
      'Choose date',
      name: 'ChooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get BoutonAjouterTache {
    return Intl.message(
      'Add',
      name: 'BoutonAjouterTache',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get User {
    return Intl.message(
      'User',
      name: 'User',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get Deconnexion {
    return Intl.message(
      'Log out',
      name: 'Deconnexion',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
