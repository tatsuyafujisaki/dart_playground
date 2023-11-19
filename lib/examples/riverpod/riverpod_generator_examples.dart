import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_generator_examples.g.dart';

/// Generates AutoDisposeProvider<bool>
@riverpod
String myGeneratedParameterless(MyGeneratedParameterlessRef ref) => 'Hello!';

@riverpod
String myGeneratedRequiredParameter(
  MyGeneratedRequiredParameterRef ref,
  String name,
) =>
    'Hello, $name!';

@riverpod
String myGeneratedOptionalParameter(
  MyGeneratedOptionalParameterRef ref, [
  String name = 'Anonymous',
]) =>
    'Hello, $name!';

@riverpod
String myGeneratedRequiredParameters(
  MyGeneratedRequiredParametersRef ref,
  String name,
  int age,
) =>
    'Hello, $age-year-old $name!';

/// Generates AutoDisposeNotifierProviderImpl<MyBool, bool>
@riverpod
class MyBool extends _$MyBool {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }
}

@riverpod
class MySet extends _$MySet {
  @override
  Set<String> build() => {};

  void add(String s) {
    state = {...state, s};
  }

  void remove(String s) {
    state.remove(s);
  }
}

void showGeneratedFunctionProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(myGeneratedParameterlessProvider)); // Hello!
  print(
    providerContainer.read(myGeneratedRequiredParameterProvider('Minnie')),
  ); // Hello, Minnie!
  print(
    providerContainer.read(myGeneratedOptionalParameterProvider()),
  ); // Hello, Anonymous!
  print(
    providerContainer.read(myGeneratedOptionalParameterProvider('Donald')),
  ); // Hello, Donald!

  print(
    providerContainer.read(myGeneratedRequiredParametersProvider('Goofy', 18)),
  ); // Hello, Donald!
}

void showGeneratedBoolNotifirerProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(myBoolProvider)); // false
  providerContainer.read(myBoolProvider.notifier).toggle();
  print(providerContainer.read(myBoolProvider)); // true
}

void showGeneratedSetNotifirerProviderExamples() {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(mySetProvider)); // {}
  providerContainer.read(mySetProvider.notifier).add('a');
  print(providerContainer.read(mySetProvider)); // {'a'}
  providerContainer.read(mySetProvider.notifier).add('b');
  providerContainer.read(mySetProvider.notifier).remove('a');
  print(providerContainer.read(mySetProvider)); // {'b'}
}
