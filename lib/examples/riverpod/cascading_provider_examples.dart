import 'dart:math';

import 'package:riverpod/riverpod.dart';

final _stateProvider = StateProvider.autoDispose((_) => Random().nextInt(100));
final _readingCascadingStateProvider = StateProvider.autoDispose(
  (ref) => '${ref.read(_stateProvider)}!',
);
final _watchingCascadingStateProvider2 = StateProvider.autoDispose(
  (ref) => '${ref.watch(_stateProvider)}!',
);

void main() {
  final container = ProviderContainer();

  print(container.read(_stateProvider));
  print(container.read(_readingCascadingStateProvider));
  print(container.read(_watchingCascadingStateProvider2));

  print('--');

  container.invalidate(_stateProvider);
  print(container.read(_stateProvider));
  print(container.read(_readingCascadingStateProvider));
  print(container.read(_watchingCascadingStateProvider2));
}
