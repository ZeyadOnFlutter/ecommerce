import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/regsiter_request.dart';
import 'package:ecommerce/features/auth/domain/use_case/login_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_case/regsiter_use_case.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(
    this._regsiterUseCase,
    this._loginUseCase,
  ) : super(AuthInitial());
  final RegsiterUseCase _regsiterUseCase;
  final LoginUseCase _loginUseCase;

  Future<void> register(RegisterRequest registerRequest) async {
    emit(RegsiterLoading());
    final response = await _regsiterUseCase(registerRequest);
    response.fold(
      (l) => emit(
        RegisterError(l.message),
      ),
      (r) => emit(
        RegisterSuccess(r),
      ),
    );
  }

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    final response = await _loginUseCase(loginRequest);
    response.fold(
      (l) => emit(
        LoginError(l.message),
      ),
      (r) => emit(
        LoginSuccess(r),
      ),
    );
  }
}
