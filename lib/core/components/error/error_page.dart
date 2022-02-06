import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  final String? assetPath;
  final VoidCallback? onTap;
  final String? buttonText;
  const ErrorPage({
    Key? key,
    required this.errorMessage,
    this.assetPath,
    this.onTap,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                if (assetPath != null) ...[
                  Image.asset(assetPath!),
                ],
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyText1,
                ),
              ],
            ),
            if (onTap != null) ...[
              ElevatedButton(
                  onPressed: onTap,
                  child: Text(
                    buttonText ?? "Go Back",
                    style: context.textTheme.bodyText1,
                  ))
            ]
          ],
        ),
      ),
    );
  }
}
