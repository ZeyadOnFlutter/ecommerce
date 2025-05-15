import 'package:ecommerce/features/auth/data/models/user_model.dart';

class RegisterResponse {
  const RegisterResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  final String message;
  final UserModel user;
  final String token;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json["message"] ?? "",
      user: UserModel.fromJson(json["user"]),
      token: json["token"] ?? "",
    );
  }
}
