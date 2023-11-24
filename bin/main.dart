import 'dart:io';

void main() {
  final xs = <dynamic>['a', 'b', 'c'];
  print(xs.runtimeType); // List<dynamic>

  final ys = List<String>.from(xs);
  print(ys.runtimeType); // List<String>

  final zs = xs.cast<String>();
  print(zs.runtimeType); // CastList<dynamic, String>
}
