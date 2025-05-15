// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/service/register_module.dart' as _i82;
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i350;
import 'package:ecommerce/features/auth/data/data_source/local/auth_shared_prefs_data_source.dart'
    as _i132;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_api_data_source.dart'
    as _i450;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i1063;
import 'package:ecommerce/features/auth/data/repository/auth_repository_impl.dart'
    as _i638;
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart'
    as _i583;
import 'package:ecommerce/features/auth/domain/use_case/regsiter_use_case.dart'
    as _i454;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i350;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i350.AuthLocalDataSource>(
        () => _i132.AuthSharedPrefsDataSource(gh<_i460.SharedPreferences>()));
    gh.singleton<_i361.Dio>(
      () => registerModule.mainDio,
      instanceName: 'MainDio',
    );
    gh.singleton<_i1063.AuthRemoteDataSource>(
        () => _i450.AuthApiDataSource(gh<_i361.Dio>(instanceName: 'MainDio')));
    gh.singleton<_i583.AuthRepository>(() => _i638.AuthRepositoryImpl(
          gh<_i1063.AuthRemoteDataSource>(),
          gh<_i350.AuthLocalDataSource>(),
        ));
    gh.singleton<_i454.RegsiterUseCase>(
        () => _i454.RegsiterUseCase(gh<_i583.AuthRepository>()));
    gh.singleton<_i350.AuthCubit>(
        () => _i350.AuthCubit(gh<_i454.RegsiterUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i82.RegisterModule {}
