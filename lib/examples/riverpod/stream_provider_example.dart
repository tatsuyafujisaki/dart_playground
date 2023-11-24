import 'package:riverpod/riverpod.dart';

final _streamProvider = StreamProvider.autoDispose<String>(
  (_) => Stream.periodic(
    Duration(seconds: 1),
    (count) => (count < 3) ? count.toString() : throw Exception(),
  ),
);

void main() async {
  final container = ProviderContainer();

  final asyncValue = container.read(_streamProvider)
    ..when(
      data: (data) => print('AsyncData: $data'),
      error: (error, _) => print('AsyncError: $error'),
      loading: () => print('AsyncLoading'),
    );
  print('AsyncValue: $asyncValue');

  try {
    final future = container.read(_streamProvider.future); // Future<String>
    print('awaited future: ${await future}'); // '0'
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
