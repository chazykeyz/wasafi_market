class SignUpBody {
  String username;
  String mobileNumber;
  String password;

  SignUpBody({
    required this.username,
    required this.mobileNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["mobile_number"] = mobileNumber;
    data["password"] = password;
    return data;
  }
}
