extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidFirstName {
    // Assuming a valid first name contains only letters and may include spaces or hyphens
    final firstNameRegExp = RegExp(r"^[A-Za-z]+([- ]?[A-Za-z]+)*$");
    return firstNameRegExp.hasMatch(this);
  }

  bool get isValidLastName {
    final lastNameRegExp = RegExp(r"^[A-Za-z]+(?:-[A-Za-z]+)?$");
    return lastNameRegExp.hasMatch(this);
  }

  bool get isValidDateDDMMYYYY {
    final dateRegExp =
        RegExp(r"^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$");
    return dateRegExp.hasMatch(this);
  }
}
