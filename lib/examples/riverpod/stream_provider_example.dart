import 'package:riverpod/riverpod.dart';

final _streamProvider = StreamProvider<int>(
  (_) => Stream.periodic(Duration(seconds: 1), (count) => count),
);

void main() async {
  final container = ProviderContainer();

  final asyncValueInt = container.read(_streamProvider) // AsyncValue<int>
    ..when(
      data: (data) => print('data: $data'),
      loading: () => print('loading'),
      error: (error, stackTrace) => print(error),
    );
  print(asyncValueInt); // AsyncLoading<int>()

  final futureInt = container.read(_streamProvider.future); // Future<int>
  print('futureInt: ${await futureInt}  '); // 0

  container.listen(
    _streamProvider,
    (previous, next) {
      print('previous: $previous, next: $next');
    },
  );
}
