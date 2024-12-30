import 'keys.dart';

class StaticLocalizationTexts {
  static Map<String, Map<String, String>> staticLocalization =
      <String, Map<String, String>>{
    'ar': <String, String>{
      LKeys.test: "نأسف! حدث خطأ بالصفحة",
    },
    'en': <String, String>{
      LKeys.test: "Sorry! error occurred in this page",
    },
    'fr': <String, String>{
      LKeys.test: "Désolé! une erreur s'est produite sur cette page",
    },
  };
  static Map<String, String> getStaticLocalization(String languageCode) {
    return staticLocalization[languageCode]!;
  }

  // static const Map<String, String> tempLocalization = <String, String>{
  //   LKeys.test: "",
  //   LKeys.recentProgramsAppBarTitle: "برامج حديثة",
  //
  //
  // };
}
