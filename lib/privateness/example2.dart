import 'package:dart_playground/privateness/example1.dart';

void main() {
  // Top-level private variables are only accessible from the same file.
  // print(_myTopPrivateLevelVariable);
  print(myTopLevelPublicVariable);

  final myClass = MyClass();
  // Private instance variables can only be accessed from the same file.
  // print(myClass._myPrivateInstanceVariable);
  print(myClass.myPublicInstanceVariable);
}
