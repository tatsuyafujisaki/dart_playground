import 'package:riverpod/riverpod.dart';

final myParameterlessProvider = Provider.autoDispose((ref) => 'Hello!');
final mySingleParameterProvider =
    Provider.autoDispose.family<String, String>((ref, name) => 'Hello, $name!');

final myStateProvider = StateProvider.autoDispose((_) => false);
final mySetStateProvider = StateProvider.autoDispose((_) => <String>{});
final myMapStateProvider = StateProvider.autoDispose((_) => <String, bool>{});

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
  providerContainer
      .read(mySetStateProvider.notifier)
      .update((state) => {'a', 'b'});
  print(providerContainer.read(mySetStateProvider)); // {'a', 'b'}
  providerContainer
      .read(mySetStateProvider.notifier)
      .update((state) => {...state, 'c', 'd'});
  print(providerContainer.read(mySetStateProvider)); // {'a', 'b', 'c', 'd'}
}

void showMapStateProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(myMapStateProvider)); // {}
  providerContainer
      .read(myMapStateProvider.notifier)
      .update((state) => {'a': false, 'b': false});
  print(providerContainer.read(myMapStateProvider)); // {a: false, b: false}
  providerContainer.read(myMapStateProvider.notifier).update((state) {
    state['bar'] = true;
    return state;
  });
  print(providerContainer.read(myMapStateProvider)); // {a: false, b: true}
}
