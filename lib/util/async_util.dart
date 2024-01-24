import 'dart:async';

void sync<T>(FutureOr<T> Function() computation) => Future.delayed(
      Duration.zero,
      computation,
    );
