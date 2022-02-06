import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app/app_constant.dart';
import 'core/init/notifier/bloc_notifier.dart';
import 'core/init/theme/app_theme.dart';
import 'view/home/page/home_page.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocNotifier.instance.pageControllerCubit,
    BlocNotifier.instance.homeViewCubit
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.APP_TITTLE,
      theme: AppTheme.instance.theme,
      onGenerateRoute: NavigationRoute.instance.onGenerateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: const HomePage(),
    );
  }
}
