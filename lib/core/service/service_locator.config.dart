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
import 'package:ecommerce/features/auth/domain/use_case/login_use_case.dart'
    as _i733;
import 'package:ecommerce/features/auth/domain/use_case/regsiter_use_case.dart'
    as _i454;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i350;
import 'package:ecommerce/features/home/data/data_source/categories_api_data_source.dart'
    as _i636;
import 'package:ecommerce/features/home/data/data_source/categories_remote_data_source.dart'
    as _i522;
import 'package:ecommerce/features/home/data/repository/categories_repository_impl.dart'
    as _i962;
import 'package:ecommerce/features/home/domain/repository/categories_repository.dart'
    as _i423;
import 'package:ecommerce/features/home/domain/use_case/categories_use_case.dart'
    as _i327;
import 'package:ecommerce/features/home/presentation/cubit/categories_cubit.dart'
    as _i156;
import 'package:ecommerce/features/products/data/data_source/product_api_data_source.dart'
    as _i614;
import 'package:ecommerce/features/products/data/data_source/product_remote_data_source.dart'
    as _i884;
import 'package:ecommerce/features/products/data/repository/product_repository_impl.dart'
    as _i770;
import 'package:ecommerce/features/products/domain/repository/product_repository.dart'
    as _i879;
import 'package:ecommerce/features/products/domain/use_case/product_use_case.dart'
    as _i498;
import 'package:ecommerce/features/products/presentation/cubit/product_cubit.dart'
    as _i320;
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
    gh.lazySingleton<_i884.ProductRemoteDataSource>(() =>
        _i614.ProductApiDataSource(gh<_i361.Dio>(instanceName: 'MainDio')));
    gh.lazySingleton<_i522.CategoriesRemoteDataSource>(() =>
        _i636.CategoriesApiDataSource(gh<_i361.Dio>(instanceName: 'MainDio')));
    gh.singleton<_i1063.AuthRemoteDataSource>(
        () => _i450.AuthApiDataSource(gh<_i361.Dio>(instanceName: 'MainDio')));
    gh.singleton<_i583.AuthRepository>(() => _i638.AuthRepositoryImpl(
          gh<_i1063.AuthRemoteDataSource>(),
          gh<_i350.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i879.ProductRepository>(
        () => _i770.ProductRepositoryImpl(gh<_i884.ProductRemoteDataSource>()));
    gh.singleton<_i733.LoginUseCase>(
        () => _i733.LoginUseCase(gh<_i583.AuthRepository>()));
    gh.singleton<_i454.RegsiterUseCase>(
        () => _i454.RegsiterUseCase(gh<_i583.AuthRepository>()));
    gh.singleton<_i350.AuthCubit>(() => _i350.AuthCubit(
          gh<_i454.RegsiterUseCase>(),
          gh<_i733.LoginUseCase>(),
        ));
    gh.lazySingleton<_i423.CategoriesRepository>(() =>
        _i962.CategoriesRepositoryImpl(gh<_i522.CategoriesRemoteDataSource>()));
    gh.lazySingleton<_i327.CategoriesUseCase>(
        () => _i327.CategoriesUseCase(gh<_i423.CategoriesRepository>()));
    gh.lazySingleton<_i498.ProductUseCase>(
        () => _i498.ProductUseCase(gh<_i879.ProductRepository>()));
    gh.lazySingleton<_i320.ProductCubit>(
        () => _i320.ProductCubit(gh<_i498.ProductUseCase>()));
    gh.lazySingleton<_i156.CategoriesCubit>(
        () => _i156.CategoriesCubit(gh<_i327.CategoriesUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i82.RegisterModule {}
