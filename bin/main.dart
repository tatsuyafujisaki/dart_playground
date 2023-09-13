import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final greetProvider = Provider((ref) => 'Hello');

void main() {
  final providerContainer = ProviderContainer();

  final hello = providerContainer.read(greetProvider);
  print(hello); // Hello
}
