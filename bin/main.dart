import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

final greetProvider = Provider((ref) => 'Hello');

@riverpod
String farewell(FarewellRef ref) => 'Bye';

void main() {
  final providerContainer = ProviderContainer();

  final hello = providerContainer.read(greetProvider);
  print(hello); // Hello

  final bye = providerContainer.read(farewellProvider);
  print(bye); // Bye
}
