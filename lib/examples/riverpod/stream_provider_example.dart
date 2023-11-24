import 'package:riverpod/riverpod.dart';

final _streamProvider = StreamProvider.autoDispose<String>(
  (_) => Stream.periodic(
    Duration(seconds: 1),
    (count) => (count < 3) ? count.toString() : throw Exception(),
  ),
);

Future<void> _whenExample<T>(
  AutoDisposeStreamProvider<T> streamProvider,
) async {
  ProviderContainer().read(streamProvider).when(
        data: (data) => print('AsyncData: $data'),
        error: (error, _) => print('AsyncError: $error'),
        loading: () => print('AsyncLoading'),
      );
}

Future<void> _futureExample<T>(
  AutoDisposeStreamProvider<T> streamProvider,
) async {
  try {
    final future = ProviderContainer().read(streamProvider.future);
    print('awaited future: ${await future}');
  } catch (e) {
    print('awaited future error: $e');
  }
}

Future<void> _listenExample<T>(
  AutoDisposeStreamProvider<T> streamProvider,
) async {
  ProviderContainer().listen(
    streamProvider,
    (previous, next) {
      print('previous: $previous, next: $next');
    },
  );
}

void main() async {
  await _whenExample(_streamProvider);
  print('--');
  await _futureExample(_streamProvider);
  print('--');
  await _listenExample(_streamProvider);
}
