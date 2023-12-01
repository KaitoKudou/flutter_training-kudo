import 'package:flutter/material.dart';

class CommonTextButtonWidget extends StatelessWidget {
  const CommonTextButtonWidget({
    required VoidCallback onClosePressed,
    required VoidCallback onReloadPressed,
    super.key,
  }): _onClosePressed = onClosePressed, _onReloadPressed = onReloadPressed;

  final VoidCallback _onClosePressed;
  final VoidCallback _onReloadPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: _onClosePressed,
            child: const Text('Close'),
          ),
        ),

        Expanded(
          child: TextButton(
            onPressed: _onReloadPressed,
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
