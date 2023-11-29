import 'package:riverpod/riverpod.dart';

final _parameterlessProvider = Provider.autoDispose((ref) => 'Hello!');
final _singleParameterProvider =
    Provider.autoDispose.family<String, String>((ref, name) => 'Hello, $name!');

final _stateProvider = StateProvider.autoDispose((_) => false);
final _setStateProvider = StateProvider.autoDispose((_) => <String>{});
final _mapStateProvider = StateProvider.autoDispose((_) => <String, bool>{});

void _showProviderExamples() {
  final container = ProviderContainer();
  print(container.read(_parameterlessProvider)); // Hello!
  print(
    container.read(_singleParameterProvider('Mickey')),
  ); // Hello, Mickey!
}

void _showStateProviderExamples() {
  final container = ProviderContainer();
  print(container.read(_stateProvider));
  container.read(_stateProvider.notifier).update((state) => !state);
  print(container.read(_stateProvider));
}

void _showSetStateProviderExamples() {
  final container = ProviderContainer();
  print(container.read(_setStateProvider)); // {}
  container.read(_setStateProvider.notifier).update((state) => {'a', 'b'});
  print(container.read(_setStateProvider)); // {'a', 'b'}
  container
      .read(_setStateProvider.notifier)
      .update((state) => {...state, 'c', 'd'});
  print(container.read(_setStateProvider)); // {'a', 'b', 'c', 'd'}
}

void _showMapStateProviderExamples() {
  final container = ProviderContainer();
  print(container.read(_mapStateProvider)); // {}
  container
      .read(_mapStateProvider.notifier)
      .update((state) => {'a': false, 'b': false});
  print(container.read(_mapStateProvider)); // {a: false, b: false}
  container.read(_mapStateProvider.notifier).update((state) {
    state['bar'] = true;
    return state;
  });
  print(container.read(_mapStateProvider)); // {a: false, b: true}
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
