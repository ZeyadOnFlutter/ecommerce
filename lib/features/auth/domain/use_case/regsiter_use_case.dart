import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/auth/data/models/regsiter_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegsiterUseCase {
  final AuthRepository _authRepository;

  RegsiterUseCase(this._authRepository);
  Future<Either<Faliure, User>> call(RegisterRequest registerRequest) =>
      _authRepository.register(registerRequest);
}
