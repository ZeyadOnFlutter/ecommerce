class RegisterRequest {
  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      };
}
