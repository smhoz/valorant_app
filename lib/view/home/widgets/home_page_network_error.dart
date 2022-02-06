import 'package:flutter/material.dart';
import '../../../core/components/error/error_page.dart';
import '../../../core/init/network/exception/network_exception.dart';

class HomePageNetworkError extends StatelessWidget {
  final NetworkExceptions networkExceptions;
  const HomePageNetworkError({Key? key, required this.networkExceptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorPage(
      errorMessage: NetworkExceptions.getErrorMessage(networkExceptions),
      assetPath: "error".errorAsset,
    );
  }
}

extension ErrorAsset on String {
  String get errorAsset => "assets/error/$this" ".png";
}
