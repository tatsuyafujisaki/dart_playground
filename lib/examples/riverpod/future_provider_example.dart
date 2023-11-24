import 'package:riverpod/riverpod.dart';

final _futureProvider =
    FutureProvider.autoDispose<String>((_) => Future.value('Hello'));

final _errorFutureProvider1 =
    FutureProvider.autoDispose<String>((_) => Future.error(Exception()));

final _errorFutureProvider2 =
    FutureProvider.autoDispose<String>((_) => throw Exception());

void main() async {
  await _debugFutureProvider(_futureProvider);
  await _debugFutureProvider(_errorFutureProvider1);
  await _debugFutureProvider(_errorFutureProvider2);
}

Future<void> _debugFutureProvider(
  AutoDisposeFutureProvider<String> futureProvider,
) async {
  final container = ProviderContainer();

  final asyncValue = container.read(futureProvider) // AsyncValue<String>
    ..when(
      data: (data) => print('data: $data'),
      error: (error, _) => print('error: $error'),
      loading: () => print('loading'),
    );
  print(asyncValue); // AsyncLoading<String>()

  try {
    final future = container.read(futureProvider.future); // Future<String>
    print('awaited future: ${await future}');
  } catch (e) {
    print('awaited future error: $e'); // awaited future error: Exception
  }
}
