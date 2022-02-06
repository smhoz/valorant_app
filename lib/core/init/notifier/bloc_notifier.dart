import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view/home/viewmodel/cubit/home_view_model.dart';

class BlocNotifier {
  static BlocNotifier? _instance;
  BlocNotifier._();
  static BlocNotifier get instance => _instance ??= BlocNotifier._();

  final BlocProvider<ControllerCubit> pageControllerCubit = BlocProvider(
    create: (context) => ControllerCubit(),
  );
  final BlocProvider<HomeViewCubit> homeViewCubit = BlocProvider(
    create: (context) {
      final cubit = HomeViewCubit();
      cubit.getValorantAPI();
      return cubit;
    },
  );
}
