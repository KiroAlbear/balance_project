class Urls {
  Urls._();

  static const String baseUrl = "http://127.0.0.1:8000";

  static String get getAllBeneficiaries {
    return 'https://mocki.io/v1/2def2ab4-d5e9-40a5-a699-92785ffda432';
  }

  static String get deleteAllBeneficiaries {
    return '$baseUrl/deleteAllUsers';
  }

  static String get addBeneficiary {
    return '$baseUrl/registerUser';
  }
}
