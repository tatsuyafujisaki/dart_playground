import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Future<void> _dateFormatExample() async {
  final date = DateTime.now();

  print(
    DateFormat('yyyy-MM-dd hh:mm:ss').format(date),
  ); // yyyy-MM-dd hh:mm:ss

  print('--');

  await initializeDateFormatting('ja').then(
    (_) {
      print(DateFormat.MMMEd('ja').format(date)); // MM月dd日(E)
      print(DateFormat.yMMMEd('ja').format(date)); // yyyy年MM月dd日(E)
      print(
        DateFormat('yyyy年MM月dd日(E)', 'ja')
            .format(date), // yyyy年MM月dd日(E) (same as above)
      );
      print(DateFormat.Md('ja').format(date)); // MM/dd
      print(DateFormat.MEd('ja').format(date)); // MM/dd(E)
      print(DateFormat.yMEd('ja').format(date)); // yyyy/MM/dd(E)
    },
  );
}

void main() async {
  await _dateFormatExample();
}
