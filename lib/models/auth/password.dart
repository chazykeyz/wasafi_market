class PasswordChange {
  String currentPassword;
  String password;
  PasswordChange({required this.currentPassword, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["currentPassword"] = currentPassword;
    data["password"] = password;
    return data;
  }
}
