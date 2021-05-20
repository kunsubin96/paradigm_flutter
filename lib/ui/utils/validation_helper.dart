class ValidationHelper{
  static final String EMAIL_PATTERN = r"^[_A-Za-z0-9-]+([.][_A-Za-z0-9-]+)*@[A-Za-z0-9]+([.][A-Za-z0-9]+)*([.][A-Za-z]{2,})$";
  static final String PHONE_PATTERN = r"^(?:[+0]9)?[0-9]{10}$";

  static bool isEmail(String email) {
    RegExp regExp = RegExp(EMAIL_PATTERN);
    return regExp.hasMatch(email);
  }
  static bool isPhoneNumber(String phone) {
    RegExp regExp = RegExp(PHONE_PATTERN);
    return regExp.hasMatch(phone);
  }
}