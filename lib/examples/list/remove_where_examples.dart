import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_where_examples.freezed.dart';

@freezed
class Minion with _$Minion {
  const factory Minion({
    required String name,
  }) = _Minion;
}

void main() {
  final minions = [
    const Minion(name: 'Kevin'),
    const Minion(name: 'Stuart'),
    const Minion(name: 'Bob'),
  ];

  print(minions);
  minions.removeWhere((minion) => minion.name == 'Stuart');
  print(minions);
}
