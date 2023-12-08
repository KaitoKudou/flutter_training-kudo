import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

mixin EndOfScreenDrawingMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    unawaited(
      SchedulerBinding.instance.endOfFrame.then(
        (_) => endOfScreenDrawing(),
      ),
    );
  }

  void endOfScreenDrawing();
}
