import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_generator_examples.g.dart';

/// Generates AutoDisposeProvider<bool>
@riverpod
String myGeneratedParameterless(MyGeneratedParameterlessRef ref) => 'Hello!';

@riverpod
String myGeneratedRequiredParameter(
  MyGeneratedRequiredParameterRef ref,
  String name1,
) =>
    'Hello, $name1!';

@riverpod
String myGeneratedOptionalParameter(
  MyGeneratedOptionalParameterRef ref, [
  String name1 = 'Anonymous',
]) =>
    'Hello, $name1!';

@riverpod
String myGeneratedRequiredParameters(
  MyGeneratedRequiredParametersRef ref,
  String name1,
  int age,
) =>
    'Hello, $age-year-old $name1!';

/// Generates AutoDisposeNotifierProviderImpl<MyBool, bool>
@riverpod
class MyBool extends _$MyBool {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }
}

Future<void> _examples() async {
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

Future<void> _classExamples() async {
  final providerContainer = ProviderContainer();
  providerContainer.read(myBoolProvider.notifier).toggle();
}
