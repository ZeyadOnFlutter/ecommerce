import 'package:ecommerce/features/auth/data/models/regsiter_request.dart';
import 'package:ecommerce/features/auth/data/models/regsiter_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}
