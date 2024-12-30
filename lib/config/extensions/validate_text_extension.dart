import 'package:balance_project/core/constants/app_regex.dart';

extension ValidateTextExtension on String {
  bool get validateEmail => AppRegex.emailRegex.hasMatch(this);
  bool get validatePassword => AppRegex.passwordRegex.hasMatch(this);
  bool get validateName => AppRegex.nameRegex.hasMatch(this);
}
