import 'package:riverpod/riverpod.dart';

final _streamProvider = StreamProvider.autoDispose<int>(
  (_) => Stream.periodic(
    Duration(seconds: 1),
    (count) => (count < 3) ? count : throw Exception(),
  ),
);

void main() async {
  final container = ProviderContainer();

  final asyncValueInt = container.read(_streamProvider) // AsyncValue<int>
    ..when(
      data: (data) => print('data: $data'),
      error: (error, _) => print('error: $error'),
      loading: () => print('loading'),
    );
  print(asyncValueInt); // AsyncLoading<int>()

  try {
    final future = container.read(_streamProvider.future); // Future<int>
    print('awaited future: ${await future}'); // 0
  } catch (e) {
    print('awaited future error: $e');
  }

  container.listen(
    _streamProvider,
    (previous, next) {
      print('previous: $previous, next: $next');
    },
  );
}
