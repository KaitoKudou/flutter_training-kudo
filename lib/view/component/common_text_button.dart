import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton({
    required VoidCallback onClosePressed,
    required VoidCallback onReloadPressed,
    super.key,
  })  : _onClosePressed = onClosePressed,
        _onReloadPressed = onReloadPressed;

  final VoidCallback _onClosePressed;
  final VoidCallback _onReloadPressed;

  @visibleForTesting
  static final reloadButton = UniqueKey();
  @visibleForTesting
  static final closeButton = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            key: closeButton,
            onPressed: _onClosePressed,
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            key: reloadButton,
            onPressed: _onReloadPressed,
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
