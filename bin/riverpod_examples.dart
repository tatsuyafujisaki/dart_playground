import 'package:riverpod/riverpod.dart';

final myParameterlessProvider = Provider.autoDispose((ref) => 'Hello!');
final mySingleParameterProvider =
    Provider.autoDispose.family<String, String>((ref, name) => 'Hello, $name!');

Future<void> _examples() async {
  final providerContainer = ProviderContainer();
  print(providerContainer.read(myParameterlessProvider)); // Hello!
  print(
    providerContainer.read(mySingleParameterProvider('Mickey')),
  ); // Hello, Mickey!
}
