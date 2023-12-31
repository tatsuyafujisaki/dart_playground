import 'dart:math';

import 'package:riverpod/riverpod.dart';

// ignore: unused_element
final _stateProvider = StateProvider.autoDispose(
  (ref) {
    ref
      ..listenSelf(
        (previous, next) => print('previous: $previous, next: $next'),
      )
      ..onDispose(
        () => print('onDispose is called!'),
      );
    // ref.invalidateSelf();
    return Random().nextInt(100);
  },
);
