import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/network/exception/network_exception.dart';
import '../../model/data_model.dart';
import '../../model/valorant_model.dart';
import '../../service/home_service.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitialState());
  bool _isLoading = false;

  Future<dynamic> getValorantAPI() async {
    changeIsLoading();
    final response = await HomeService().dioGet();
    changeIsLoading();

    if (response is ValorantModel) {
      getDominantColor(response);
    } else if (response is NetworkExceptions) {
      emit(HomeViewErrorState(networkExceptions: response));
    }
  }

  getDominantColor(ValorantModel valorantModel) async {
    for (Data element in valorantModel.data!) {
      if (element.bustPortrait != null) {
        PaletteGenerator paletteGenerator =
            await PaletteGenerator.fromImageProvider(
          NetworkImage(element.bustPortrait!),
        );

        if (paletteGenerator.dominantColor != null) {
          element.dominantColor = paletteGenerator.dominantColor!.color;
        }
      }
    }
    emit(HomeViewSuccesState(valorantModel: valorantModel));
  }

  void changeIsLoading() {
    _isLoading = !_isLoading;
    emit(HomeViewLoadingState(isLoading: _isLoading));
  }
}

abstract class HomeViewState {}

class HomeViewInitialState extends HomeViewState {}

class HomeViewLoadingState extends HomeViewState {
  final bool isLoading;
  HomeViewLoadingState({
    required this.isLoading,
  });
}

class HomeViewSuccesState extends HomeViewState {
  final ValorantModel valorantModel;
  HomeViewSuccesState({
    required this.valorantModel,
  });
}

class HomeViewErrorState extends HomeViewState {
  final NetworkExceptions networkExceptions;
  HomeViewErrorState({
    required this.networkExceptions,
  });
}

class ControllerCubit extends Cubit<double> {
  ControllerCubit() : super(0);

  double scale = 0;
  int currentPage = 0;
  double? height;

  final PageController pageController = PageController();

  void animatedContainerHeight(bool isOnTap, BuildContext context) {
    if (isOnTap) {
      height = 0;
      emit(height!);
    } else {
      height = context.height * 0.5;
      emit(height!);
    }
  }

  void pageControllerListener() {
    pageController.addListener(() {
      scale = pageController.page!;
      emit(scale);
    });
  }

  void indexToCurrentPage(int index) {
    currentPage = index;
    emit(currentPage.toDouble());
  }
}
