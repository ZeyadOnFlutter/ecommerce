import 'package:ecommerce/features/auth/data/models/user_model.dart';

class AuthResponse {
  const AuthResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  final String message;
  final UserModel user;
  final String token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json["message"] ?? "",
      user: UserModel.fromJson(json["user"]),
      token: json["token"] ?? "",
    );
  }
}
