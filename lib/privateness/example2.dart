import 'package:dart_playground/privateness/example1.dart';

void main() {
  // Top-level private variables are only accessible from within the same file.
  // print(_myTopPrivateLevelVariable);
  print(myTopLevelPublicVariable);

  final myClass = MyClass();
  // Private  variables can only be accessed from the same file.
  // print(myClass._myPrivateVariable);
  print(myClass.myPublicVariable);
  // myClass._myPrivateMethod()
  myClass.myPublicMethod();
}
