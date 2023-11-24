import 'dart:io';

void main() {
  print(Platform.version);
  print(const String.fromEnvironment('MY_VAR1'));
  print(const String.fromEnvironment('MY_VAR2'));
}
