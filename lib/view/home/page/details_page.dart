part of 'home_page.dart';

class DetailsPage extends StatelessWidget {
  final Data data;
  const DetailsPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: data.dominantColor!,
      body: SafeArea(
        child: _scaffoldBody(context),
      ),
    );
  }

  Stack _scaffoldBody(BuildContext context) {
    return Stack(
      children: [
        _blurNetworkImage(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _animatedContainerWithNetworkImage(context),
            _animationTranslate(context),
            context.read<ControllerCubit>().height == 0
                ? _abilitiesList()
                : Container(),
            _arrowUpIcon(context)
          ],
        )
      ],
    );
  }

  SizedBox _arrowUpIcon(BuildContext context) {
    return SizedBox(
      height: context.height * 0.08,
      child: GestureDetector(
        onTap: () {
          ControllerCubit controllerCubitRead = context.read<ControllerCubit>();
          controllerCubitRead.height == 0
              ? controllerCubitRead.animatedContainerHeight(false, context)
              : controllerCubitRead.animatedContainerHeight(true, context);
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: _arrowUpIconAndText(context),
        ),
      ),
    );
  }

  Column _arrowUpIconAndText(BuildContext context) {
    bool isHeightZero = context.read<ControllerCubit>().height == 0;
    return Column(
      children: [
        Icon(
          isHeightZero
              ? Icons.arrow_drop_down_rounded
              : Icons.arrow_drop_up_rounded,
        ),
        Text(
          isHeightZero ? "HOME" : "ABILITIES",
          style: context.textTheme.bodyText1!
              .copyWith(color: context.themeColor.background, fontSize: 14),
        ),
      ],
    );
  }

  Expanded _abilitiesList() {
    return Expanded(
      child: ListView.builder(
        itemCount: data.abilities!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.paddingLow,
            child: _abilitiesListTile(context, index),
          );
        },
      ),
    );
  }

  ListTile _abilitiesListTile(BuildContext context, int index) {
    return ListTile(
      tileColor: data.dominantColor!.withOpacity(0.5),
      contentPadding: context.paddingMedium,
      leading: Image.network(data.abilities![index].displayIcon!),
      title: Text(
        data.abilities![index].displayName!,
        style: context.textTheme.bodyText1!
            .copyWith(color: context.themeColor.secondary),
      ),
      subtitle: Text(
        data.abilities![index].description!,
        style: context.textTheme.headline5!
            .copyWith(color: context.themeColor.background),
      ),
    );
  }

  AnimationTranslate _animationTranslate(BuildContext context) {
    return AnimationTranslate(
      child: Padding(
        padding: context.paddingLow,
        child: Container(
          decoration: _animationTranslateBoxDecoration(),
          padding: context.paddingMedium,
          height: context.height * 0.25,
          child: _animationTranslateTexts(context),
        ),
      ),
    );
  }

  BoxDecoration _animationTranslateBoxDecoration() {
    return BoxDecoration(
        color: data.dominantColor!.withOpacity(0.5),
        borderRadius: CustomBorderRadius.allCircular());
  }

  Column _animationTranslateTexts(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          data.displayName!,
          style: context.textTheme.bodyText1
              ?.copyWith(color: context.themeColor.secondary),
        ),
        Text(
          data.description!,
          style: context.textTheme.headline5
              ?.copyWith(color: context.themeColor.background),
        ),
      ],
    );
  }

  AnimatedContainer _animatedContainerWithNetworkImage(BuildContext context) {
    return AnimatedContainer(
        duration: context.normalDuration,
        height: context.watch<ControllerCubit>().height ?? context.height * 0.5,
        child: CircularNetworkImage(imageURL: data.fullPortrait!));
  }

  BlurNetworkImage _blurNetworkImage() {
    return BlurNetworkImage(
      imageURL: data.background!,
      blurSigmaX: 10,
      blurSigmaY: 10,
    );
  }
}
