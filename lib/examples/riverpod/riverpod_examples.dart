import 'package:riverpod/riverpod.dart';

final _parameterlessProvider = Provider.autoDispose((ref) => 'Hello!');
final _singleParameterProvider =
    Provider.autoDispose.family<String, String>((ref, name) => 'Hello, $name!');

final _stateProvider = StateProvider.autoDispose((_) => false);
final _setStateProvider = StateProvider.autoDispose((_) => <String>{});
final _mapStateProvider = StateProvider.autoDispose((_) => <String, bool>{});

void _showProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(_parameterlessProvider)); // Hello!
  print(
    providerContainer.read(_singleParameterProvider('Mickey')),
  ); // Hello, Mickey!
}

void _showStateProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(_stateProvider));
  providerContainer.read(_stateProvider.notifier).update((state) => !state);
  print(providerContainer.read(_stateProvider));
}

void _showSetStateProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(_setStateProvider)); // {}
  providerContainer
      .read(_setStateProvider.notifier)
      .update((state) => {'a', 'b'});
  print(providerContainer.read(_setStateProvider)); // {'a', 'b'}
  providerContainer
      .read(_setStateProvider.notifier)
      .update((state) => {...state, 'c', 'd'});
  print(providerContainer.read(_setStateProvider)); // {'a', 'b', 'c', 'd'}
}

void _showMapStateProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(_mapStateProvider)); // {}
  providerContainer
      .read(_mapStateProvider.notifier)
      .update((state) => {'a': false, 'b': false});
  print(providerContainer.read(_mapStateProvider)); // {a: false, b: false}
  providerContainer.read(_mapStateProvider.notifier).update((state) {
    state['bar'] = true;
    return state;
  });
  print(providerContainer.read(_mapStateProvider)); // {a: false, b: true}
}

void main() {
  _showProviderExamples();
  print('--');
  _showStateProviderExamples();
  print('--');
  _showSetStateProviderExamples();
  print('--');
  _showMapStateProviderExamples();
}
