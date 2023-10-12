import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Future<void> dateFormatExample() async {
  print(
    DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
  ); // yyyy-MM-dd hh:mm:ss

  await initializeDateFormatting('ja').then((_) {
    print(DateFormat.yMMMEd('ja').format(DateTime.now())); // yyyy年MM月dd日(E)
    print(
      DateFormat('yyyy年MM月dd日(E)', 'ja')
          .format(DateTime.now()), // yyyy年MM月dd日(E) (same as above)
    );
  });
}
