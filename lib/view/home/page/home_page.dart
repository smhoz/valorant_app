import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/components/animation/animation_translate.dart';
import '../../../core/components/image/circular_network_image.dart';
import '../widgets/home_page_network_error.dart';
import '../widgets/home_page_network_image.dart';

import '../../../core/components/border/border_radius.dart';
import '../../../core/components/image/blur_network_image.dart';
import '../../../core/components/loading/circular_page.dart';
import '../../../core/constants/navigation/navigation_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../model/data_model.dart';
import '../model/valorant_model.dart';
import '../viewmodel/cubit/home_view_model.dart';

part 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        if (state is HomeViewLoadingState) {
          return _circularPage();
        } else if (state is HomeViewErrorState) {
          return _errorPage(state);
        } else if (state is HomeViewSuccesState) {
          final ValorantModel valorantModel = state.valorantModel;

          context.read<ControllerCubit>().pageControllerListener();

          return BlocBuilder<ControllerCubit, double>(
            builder: (context, state) {
              return _succesStateScaffold(context, valorantModel);
            },
          );
        } else {
          return _circularPage();
        }
      },
    );
  }

  Scaffold _succesStateScaffold(
      BuildContext context, ValorantModel valorantModel) {
    ControllerCubit controllerCubitRead = context.read<ControllerCubit>();

    List<Data> valorantModelData = valorantModel.data ?? [];

    return Scaffold(
      backgroundColor:
          valorantModelData[controllerCubitRead.currentPage].dominantColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _backgroundBlurImage(context, valorantModelData),
          FractionallySizedBox(
            heightFactor: 0.55,
            child: _pageView(context, valorantModelData),
          )
        ],
      ),
    );
  }

  void navigateDetailsPage(Data data) {
    NavigationService.instance.navigateToPage(
        path: NavigationConstants.DETAILS_PAGE,
        data: DetailsPage(
          data: data,
        ));
  }

  Widget _backgroundBlurImage(
    BuildContext context,
    List<Data> valorantModelData,
  ) {
    ControllerCubit controllerCubitRead = context.read<ControllerCubit>();

    final String bustPortrait =
        valorantModelData[controllerCubitRead.currentPage].bustPortrait!;

    return BlurNetworkImage(
        valueKey: ValueKey<String>(bustPortrait), imageURL: bustPortrait);
  }

  PageView _pageView(
    BuildContext context,
    List<Data> valorantModelData,
  ) {
    ControllerCubit controllerCubitRead = context.read<ControllerCubit>();

    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) {
        controllerCubitRead.indexToCurrentPage(value);
      },
      controller: controllerCubitRead.pageController,
      itemCount: valorantModelData.length,
      itemBuilder: (context, index) {
        final String bustPortrait = valorantModelData[index].bustPortrait!;
        return GestureDetector(
          onTap: () => navigateDetailsPage(valorantModelData[index]),
          child: Stack(
            children: [
              _homeViewNetworkImageBackground(
                  context, valorantModelData[index]),
              HomeViewNetworkImage(
                  imageURL: bustPortrait,
                  scale: 1 + (controllerCubitRead.scale - index))
            ],
          ),
        );
      },
    );
  }

  Padding _homeViewNetworkImageBackground(BuildContext context, Data data) {
    return Padding(
      padding: context.privatePadding,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: context.height * 0.35,
          decoration: BoxDecoration(
              borderRadius: CustomBorderRadius.allCircular(),
              boxShadow: [
                _boxShadow(data),
              ]),
        ),
      ),
    );
  }

  BoxShadow _boxShadow(Data data) {
    return BoxShadow(
      color: data.dominantColor!.withOpacity(0.3),
      blurRadius: 5,
      offset: const Offset(0, 0),
    );
  }

  HomePageNetworkError _errorPage(HomeViewErrorState state) {
    return HomePageNetworkError(networkExceptions: state.networkExceptions);
  }

  CircularPage _circularPage() => const CircularPage();
}
