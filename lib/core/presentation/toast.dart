import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

Future<void> showNoConnectionToast(
  BuildContext context, [
  String message = "Couldn't reach servers.\nSome Data may be outdated.",
]) async {
  await showFlash(
    context: context,
    duration: const Duration(seconds: 4),
    transitionDuration: const Duration(milliseconds: 300),
    builder: (context, controller) {
      return Flash.dialog(
        controller: controller,
        barrierColor: Colors.black26,
        borderRadius: BorderRadius.circular(8),
        backgroundColor: Colors.black.withOpacity(0.7),
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );
    },
  );
}

Future<bool> showConfirmationDialog(
  BuildContext context, {
  required String message,
}) async {
  final result = await context.showFlashDialog<bool>(
    barrierColor: Theme.of(context).shadowColor.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    title: const Text('Are you sure?'),
    content: Text(message),
    negativeActionBuilder: (context, controller, _) {
      return TextButton(
        child: const Text('NO'),
        onPressed: () => controller.dismiss(false),
      );
    },
    positiveActionBuilder: (context, controller, _) {
      return TextButton(
        child: const Text('YES'),
        onPressed: () => controller.dismiss(true),
      );
    },
  );
  return result ?? false;
}
