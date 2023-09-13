import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

final myProvider1 = Provider.autoDispose((ref) => 'Hello!');
final myProvider2 =
    Provider.autoDispose.family<String, String>((ref, name) => 'Hello, $name!');

@riverpod
String myGenerated1(MyGenerated1Ref ref) => 'Hello!';

@riverpod
String myGenerated2(MyGenerated2Ref ref, String firstName) =>
    'Hello, $firstName!';

void main() async {
  final providerContainer = ProviderContainer();

  final hello =
      providerContainer.read(myProvider1); // The return type is String.
  print(hello); // Hello!

  final helloAlice =
      providerContainer.read(myProvider2('Jane')); // The return type is String.
  print(helloAlice); // Hello, Alice!

  final hello2 = providerContainer
      .read(myGenerated1Provider); // The return type is String.
  print(hello2); // Hello!

  final hello3 = providerContainer
      .read(myGenerated2Provider('Jane')); // The return type is String.
  print(hello3); // Hello!
}
