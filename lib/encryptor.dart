import 'package:encrypt/encrypt.dart';

class Encryptor {
  final Encrypter _encryptor = Encrypter(
    AES(Key.fromBase64('wnhXiuxpZa8Aqm5yTWPAvJ660ZKJV6rDH3eVAfKFz/U=')),
  );
  final _iv = IV.fromLength(16);

  String encrypt(String input) => _encryptor.encrypt(input, iv: _iv).base64;
  String decrypt(String encrypted) => _encryptor.decrypt64(encrypted, iv: _iv);
}

void encryptorExample([String input = 'Hello!']) {
  final encryptor = Encryptor();
  final encrypted = encryptor.encrypt('Hello!');
  final decrypted = encryptor.decrypt(encrypted);
  print('encrypted: $encrypted');
  print('decrypted: $decrypted');
}
