class VerificationModel {
  String verificationCode;

  VerificationModel({required this.verificationCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["verificationCode"] = verificationCode;
    return data;
  }
}
