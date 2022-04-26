class SignUpBody {
  String username;
  String phone;
  String password;
  String gender;
  String email;
  int age;

  SignUpBody(
      {required this.username,
      required this.phone,
      required this.password,
      required this.gender,
      required this.email,
      required this.age});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["phone"] = phone;
    data["gender"] = gender;
    data["age"] = age;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
