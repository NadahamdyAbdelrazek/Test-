
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revision/src/features/home/presentation/home/bloc/home_bloc.dart';
import 'package:revision/src/features/home/presentation/home/view/home_Screen.dart';

import '../../features/home/presentation/home/view/ItemDetails.dart';
import '../../features/login/login/presentation/bloc/login_bloc.dart';
import '../../features/login/login/presentation/view/login_page.dart';
import '../services/dependency_injection_service.dart';

class Routes {
  static const String home = "/HomeScreen";
  static const String login = "/";
  static const String details = "/ItemDetails";

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (context) {
      return BlocProvider(
          create: (_) => di<HomeBloc>()..add(GetData()),
          child: HomeScreen());
    },
    Routes.login: (context) {
      return BlocProvider.value(
        value: di<LoginBloc>(),
        child: const LoginPage(),
      );
    },
    Routes.details: (context) => const ItemDetails(),
  };
}