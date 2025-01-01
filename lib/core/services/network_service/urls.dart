class Urls {
  Urls._();

  static const String baseUrl =
      "https://balance-project-29bd527336fc.herokuapp.com";

  static String get getAllBeneficiaries {
    return '$baseUrl/getAllUsers';
  }

  static String get deleteAllBeneficiaries {
    return '$baseUrl/deleteAllUsers';
  }

  static String get deleteOneBeneficiary {
    return '$baseUrl/deleteOneUser';
  }

  static String get addBeneficiary {
    return '$baseUrl/registerUser';
  }
}
