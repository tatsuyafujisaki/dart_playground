import 'package:riverpod/riverpod.dart';

final _futureProvider =
    FutureProvider.autoDispose<String>((_) => Future.value('Hello'));

// does not invoke .when(error).
// awaiting its future falls into the catch block of try-catch.
final _errorFutureProvider1 =
    FutureProvider.autoDispose<String>((_) => Future.error(Exception()));

// invokes .when(error).
// awaiting its future falls into the catch block of try-catch.
final _errorFutureProvider2 =
    FutureProvider.autoDispose<String>((_) => throw Exception());

void main() async {
  await _debugFutureProvider(_futureProvider);
  print('--');
  await _debugFutureProvider(_errorFutureProvider1);
  print('--');
  await _debugFutureProvider(_errorFutureProvider2);
}

Future<void> _debugFutureProvider(
  AutoDisposeFutureProvider<String> futureProvider,
) async {
  final container = ProviderContainer();

  container
      .read(futureProvider) // AsyncValue<String>
      .when(
        data: (data) => print('AsyncData: $data'),
        error: (error, _) => print('AsyncError: $error'),
        loading: () => print('AsyncLoading'),
      );

  try {
    final future = container.read(futureProvider.future); // Future<String>
    print('awaited future: ${await future}');
  } catch (e) {
    print('awaited future error: $e'); // awaited future error: Exception
  }
}
