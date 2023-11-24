import 'package:riverpod/riverpod.dart';

final _futureProvider = FutureProvider<String>((_) => Future.value('Hello'));

void main() async {
  final container = ProviderContainer();

  final asyncValueInt = container.read(_futureProvider) // AsyncValue<String>
    ..when(
      data: (data) => print('data: $data'),
      error: (error, stackTrace) => print(error),
      loading: () => print('loading'),
    );
  print(asyncValueInt); // AsyncLoading<String>()

  final future = container.read(_futureProvider.future); // Future<String>
  print('future: ${await future}  '); // future: Hello
}
