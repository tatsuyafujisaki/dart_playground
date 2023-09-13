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

@riverpod
String myGenerated3(MyGenerated3Ref ref, [String firstName1 = 'Anonymous']) =>
    'Hello, $firstName1!';

void main() async {
  final providerContainer = ProviderContainer();

  final hello =
      providerContainer.read(myProvider1); // The return type is String.
  print(hello); // Hello!

  final helloAlice = providerContainer
      .read(myProvider2('Minnie')); // The return type is String.
  print(helloAlice); // Hello, Minnie!

  final hello2 = providerContainer
      .read(myGenerated1Provider); // The return type is String.
  print(hello2); // Hello!

  final hello3 = providerContainer
      .read(myGenerated2Provider('Mickey')); // The return type is String.
  print(hello3); // Hello, Mickey!

  final hello4 = providerContainer
      .read(myGenerated3Provider()); // The return type is String.
  print(hello4); // Hello, Anonymous!

  final hello5 = providerContainer
      .read(myGenerated3Provider('Donald')); // The return type is String.
  print(hello5); // Hello, Donald!
}
