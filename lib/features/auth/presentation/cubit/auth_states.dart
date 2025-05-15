import 'package:ecommerce/features/auth/domain/entities/user.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class RegsiterLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {
  final User user;

  RegisterSuccess(this.user);
}

class RegisterError extends AuthStates {
  final String errorMessage;

  RegisterError(this.errorMessage);
}
