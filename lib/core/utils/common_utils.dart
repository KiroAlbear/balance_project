class CommonUtils {
  static bool isValidInteger(String value) {
    return int.tryParse(value) != null;
  }
}
