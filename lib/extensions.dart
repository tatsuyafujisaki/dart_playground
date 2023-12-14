import 'package:riverpod/riverpod.dart';

extension on String? {
  // ignore: unused_element
  bool get isNullOrEmpty => this?.isNotEmpty ?? true;
  // ignore: unused_element
  bool get isNeitherNullNorEmpty => this?.isNotEmpty ?? false;
}

extension on AsyncValue<dynamic> {
  // ignore: unused_element
  void printAll() => when(
        data: (data) => print('👀data=$data'),
        error: (error, stackTrace) =>
            print('👀error=$error, stackTrace=$stackTrace'),
        loading: () => print('👀loading'),
      );
}
