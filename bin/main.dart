import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final greetProvider = Provider((ref) => 'Hello');

void main() {
  ProviderContainer()
      .listen(greetProvider, (previous, value) => print('changed'));
}
