import 'package:riverpod/riverpod.dart';

final myParameterlessProvider = Provider.autoDispose((ref) => 'Hello!');
final mySingleParameterProvider =
    Provider.autoDispose.family<String, String>((ref, name) => 'Hello, $name!');

final myStateProvider = StateProvider.autoDispose((_) => false);
final mySetStateProvider = StateProvider.autoDispose((_) => <int>{});

void showProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(myParameterlessProvider)); // Hello!
  print(
    providerContainer.read(mySingleParameterProvider('Mickey')),
  ); // Hello, Mickey!
}

void showStateProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(myStateProvider));
  providerContainer.read(myStateProvider.notifier).update((state) => !state);
  print(providerContainer.read(myStateProvider));
}

void showSetStateProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(mySetStateProvider)); // {}
  providerContainer.read(mySetStateProvider.notifier).update((state) => {1, 2});
  print(providerContainer.read(mySetStateProvider)); // {1, 2}
  providerContainer
      .read(mySetStateProvider.notifier)
      .update((state) => {...state, 3, 4});
  print(providerContainer.read(mySetStateProvider)); // {1, 2, 3, 4}
}
