import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

final myProvider1 = Provider.autoDispose((ref) => 'Hello!');
final myProvider2 =
    Provider.autoDispose.family<String, String>((ref, name) => 'Hello, $name!');

@riverpod
String bar(BarRef ref) => 'Bar!';

@riverpod
Future<String> baz(BazRef ref) async => 'Baz!';

void main() async {
  final providerContainer = ProviderContainer();

  final hello =
      providerContainer.read(myProvider1); // The return type is String.
  print(hello); // Hello!

  final helloAlice = providerContainer
      .read(myProvider2('Alice')); // The return type is String.
  print(helloAlice); // Hello, Alice!

  final helloBob =
      providerContainer.read(myProvider2('Bob')); // The return type is String.
  print(helloBob); // Hello, Bob!

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
