import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/mappers/user_mapper.dart';
import 'package:ecommerce/features/auth/data/models/regsiter_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);
  @override
  Future<Either<Faliure, User>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final response = await _authRemoteDataSource.register(registerRequest);
      _authLocalDataSource.saveToken(response.token);
      log(await _authLocalDataSource.getToken());
      return Right(response.user.toEntity);
    } on EcommerceAppExceptions catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
