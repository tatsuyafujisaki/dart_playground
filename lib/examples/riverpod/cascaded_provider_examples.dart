import 'dart:math';

import 'package:riverpod/riverpod.dart';

final _stateProvider1 = StateProvider.autoDispose((_) => Random().nextInt(100));
final _stateProvider2 = StateProvider.autoDispose(
  (ref) => '${ref.watch(_stateProvider1)}!',
);

void main() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(_stateProvider2));
  providerContainer.invalidate(_stateProvider1);
  print(providerContainer.read(_stateProvider2));
}
