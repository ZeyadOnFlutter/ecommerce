import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/home/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/subcategories_cubit.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce/features/products/presentation/screens/product_details.dart';
import 'package:ecommerce/features/products/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CategoriesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<SubcategoriesCubit>(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      case Routes.products:
        return MaterialPageRoute(
          builder: (_) => const ProductsScreen(),
          settings: settings,
        );
      case Routes.productDetails:
        return MaterialPageRoute(
          builder: (_) => const ProductDetails(),
          settings: settings,
        );
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
