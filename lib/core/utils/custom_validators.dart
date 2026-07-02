abstract class CustomValidators {
  static bool emailValidator({required String value}) {
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

    return RegExp(emailRegex).hasMatch(value);
  }
}
