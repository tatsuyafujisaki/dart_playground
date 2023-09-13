import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

final fooProvider = Provider((ref) => 'Foo!');

@riverpod
String bar(BarRef ref) => 'Bar!';

@riverpod
Future<String> baz(BazRef ref) async => 'Baz!';

void main() async {
  final providerContainer = ProviderContainer();

  final foo = providerContainer.read(fooProvider); // The return type is String.
  print(foo); // Foo!

  final bar = providerContainer.read(barProvider); // The return type is String.
  print(bar); // Bar!

  // .read(bazProvider) returns Future<String>.
  providerContainer.read(bazProvider).when(
        data: (data) {
          // TODO: Not called. Check why.
          print(data);
        },
        error: (err, stack) => print(err.toString() + stack.toString()),
        loading: () => print('Loading!'),
      );
}
