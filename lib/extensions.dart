import 'package:riverpod/riverpod.dart';

extension on String? {
  bool get isNullOrEmpty => this?.isNotEmpty ?? true;
  bool get isNeitherNullNorEmpty => this?.isNotEmpty ?? false;
}

extension on AsyncValue<dynamic> {
  void printAll() => when(
        data: (data) => print('👀data=$data'),
        error: (error, stackTrace) =>
            print('👀error=$error, stackTrace=$stackTrace'),
        loading: () => print('👀loading'),
      );
}
