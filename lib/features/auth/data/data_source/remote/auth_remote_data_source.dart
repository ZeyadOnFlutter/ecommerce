import 'package:ecommerce/features/auth/data/models/auth_response.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/regsiter_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> register(RegisterRequest registerRequest);
  Future<AuthResponse> login(LoginRequest loginRequest);
}
