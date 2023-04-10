import 'package:shared_utils/shared_utils.dart' show TextX;

class Validators {
  /// simple input validator
  static String? validate(String? input) {
    if (input.isNullOrEmpty()) return 'required';
    return null;
  }

  static String? validateAuthCode(String? input) {
    input = input?.replaceAll(' ', '');
    if (input.isNullOrEmpty()) return 'Required';
    var regex = RegExp(r'^\d{6}$');
    return regex.hasMatch(input!.trim()) ? null : 'Auth code too short';
  }

  static String? validatePhone(String? input) {
    input = input?.replaceAll(' ', '');
    if (input.isNullOrEmpty()) return 'Required';
    var regex =
        RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');
    return regex.hasMatch(input!.trim()) ? null : 'Invalid phone number';
  }

  static String? validateEmail(String? input) {
    if (input.isNullOrEmpty()) return 'Required';
    var regex = RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
    return regex.hasMatch(input!.trim()) ? null : 'Invalid email address';
  }

  static String? validatePassword(String? input) {
    if (input.isNullOrEmpty()) return 'Required';

    /// min length of 4
    var regex = RegExp(r'[A-Za-z0-9@#$%^&+=]{4,}');
    return regex.hasMatch(input!.trim())
        ? null
        : 'Invalid password or too short';
  }
}
