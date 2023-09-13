import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

final myParameterlessProvider = Provider.autoDispose((ref) => 'Hello!');
final mySingleParameterProvider =
    Provider.autoDispose.family<String, String>((ref, name) => 'Hello, $name!');

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

void main() async {
  final providerContainer = ProviderContainer();

  print(providerContainer.read(myParameterlessProvider)); // Hello!
  print(
    providerContainer.read(mySingleParameterProvider('Minnie')),
  ); // Hello, Minnie!
  print(providerContainer.read(myGeneratedParameterlessProvider)); // Hello!
  print(
    providerContainer.read(myGeneratedRequiredParameterProvider('Mickey')),
  ); // Hello, Mickey!
  print(
    providerContainer.read(myGeneratedOptionalParameterProvider()),
  ); // Hello, Anonymous!
  print(
    providerContainer.read(myGeneratedOptionalParameterProvider('Donald')),
  ); // Hello, Donald!
}
