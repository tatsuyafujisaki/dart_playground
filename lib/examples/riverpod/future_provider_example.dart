import 'package:riverpod/riverpod.dart';

final _futureProvider =
    FutureProvider.autoDispose<String>((_) => Future<String>.value('Hello'));

// does not invoke .when(error).
// awaiting its future falls into the catch block of try-catch.
final _errorFutureProvider1 =
    FutureProvider.autoDispose<String>((_) => Future<String>.error('💀'));

// invokes .when(error).
// awaiting its future falls into the catch block of try-catch.
final _errorFutureProvider2 =
    FutureProvider.autoDispose<String>((_) => throw Exception());

Future<void> _showExamples<T>(
  AutoDisposeFutureProvider<T> futureProvider,
) async {
  await _whenExample(futureProvider);
  await _futureExample(futureProvider);
  await _listenExample(futureProvider);
}

Future<void> _whenExample<T>(
  AutoDisposeFutureProvider<T> futureProvider,
) async {
  ProviderContainer().read(futureProvider).when(
        data: (data) => print('AsyncData: $data'),
        error: (error, _) => print('AsyncError: $error'),
        loading: () => print('AsyncLoading'),
      );
}

Future<void> _futureExample<T>(
  AutoDisposeFutureProvider<T> futureProvider,
) async {
  try {
    final future = ProviderContainer().read(futureProvider.future);
    print('awaited future: ${await future}');
  } on Exception catch (e) {
    print('awaited future error: $e');
  }
}

Future<void> _listenExample<T>(
  AutoDisposeFutureProvider<T> futureProvider,
) async {
  ProviderContainer().listen(
    futureProvider,
    (previous, next) {
      print('previous: $previous, next: $next');
    },
  );
}

void main() async {
  await _showExamples(_futureProvider);
  print('--');
  await _showExamples(_errorFutureProvider1);
  print('--');
  await _showExamples(_errorFutureProvider2);
}
