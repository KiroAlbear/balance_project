import 'dart:convert';

import 'package:balance_project/imports.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

const String englishLanguageCode = 'en';
const String arabicLanguageCode = 'ar';
const String frenchLanguageCode = 'fr';

class LocalizationController {
  static LocalizationController? _instance;
  static const List<String> supportedLanguages = <String>[
    arabicLanguageCode,
    englishLanguageCode
  ];

  Map<String, dynamic>? _localizedStrings;
  // Map<String, String> en = StaticLocalizationTexts.staticLocalization['en']!;
  // Map<String, String> ar = StaticLocalizationTexts.staticLocalization['ar']!;
  // Map<String, String> fr = StaticLocalizationTexts.staticLocalization['fr']!;
  Locale? locale = const Locale('ar', 'EG');

  static LocalizationController getInstance() {
    return _instance ??= LocalizationController();
  }

  Future<Map<String, dynamic>> getAndSaveResourceStringsToSharedPref(
      String languageCode) async {
    try {
      // this place is for online localization

      throw Exception();
    } catch (onError) {
      return _localizedStrings =
          StaticLocalizationTexts.getStaticLocalization(languageCode);
    }
  }

  Future<void> getResourceStringsFromSharedPref(String languageCode) async {
    try {
      dynamic result;
      ConnectivityResult connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        result = await getAndSaveResourceStringsToSharedPref(languageCode);
      } else {
        // result = await SharedPreferencesManager.getString(
        //   SharedPreferencesManager.appResourcesStrings,
        // );
      }
      dynamic jsonData = json.decode(result!);
      _localizedStrings = jsonData;
    } catch (onError) {
      // throw Exception("CAN't FIND STRINGS");
    }
  }

  String translate(BuildContext context, String key) {
    try {
      return Localizations.of<LocalizationController>(
              context, LocalizationController)!
          ._localizedStrings![key];
    } catch (error) {
      return '';
    }
  }

  bool isRTL() {
    return locale?.languageCode == arabicLanguageCode;
  }

  String getLanguage() {
    return locale!.languageCode;
  }

  Future<void> setup(Locale locale) async {
    this.locale = locale;

    await getResourceStringsFromSharedPref(this.locale!.languageCode);
  }
}

class LocalizationControllerDelegate
    extends LocalizationsDelegate<LocalizationController> {
  const LocalizationControllerDelegate();

  @override
  bool isSupported(Locale locale) {
    return LocalizationController.supportedLanguages
        .contains(locale.languageCode);
  }

  @override
  Future<LocalizationController> load(Locale locale) async {
    LocalizationController localizationsController =
        LocalizationController.getInstance();
    await LocalizationController.getInstance().setup(locale);
    return localizationsController;
  }

  @override
  bool shouldReload(LocalizationControllerDelegate old) => false;
}

class SetLanguageApi extends ApiHelper {
  SetLanguageApi._privateConstructor();

  static final SetLanguageApi _instance = SetLanguageApi._privateConstructor();

  factory SetLanguageApi() {
    return _instance;
  }

  Future<Map<String, dynamic>> getAllResourceStrings(String language) async {
    try {
      String url = Urls.getLocalizationStrings;
      // Map<String, dynamic> mappedData =
      //     await fetchData<Map<String, dynamic>>(url);

      return {};
    } catch (err) {
      rethrow;
    }
  }
}
