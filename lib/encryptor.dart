import 'dart:math';

import 'package:encrypt/encrypt.dart';

class Encryptor {
  final Encrypter _encryptor = Encrypter(
    AES(Key.fromBase64(_generateRandomString(32))),
  );
  final _iv = IV.fromLength(16);

  Encrypted encrypt(String input) => _encryptor.encrypt(input, iv: _iv);
  String decrypt(String encrypted) => _encryptor.decrypt64(encrypted, iv: _iv);

  static String _generateRandomString(int length) {
    final random = Random();
    return String.fromCharCodes(
      List.generate(length, (index) => random.nextInt(33) + 89),
    );
  }
}
