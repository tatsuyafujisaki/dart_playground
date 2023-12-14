import 'package:encrypt/encrypt.dart';

final _encryptor = Encrypter(
  AES(Key.fromBase64('wnhXiuxpZa8Aqm5yTWPAvJ660ZKJV6rDH3eVAfKFz/U=')),
);
final _iv = IV.fromLength(16);

String encrypt(String input) =>
    // Passing an empty string to encrypt() will throw an exception.
    input.isEmpty ? '' : _encryptor.encrypt(input, iv: _iv).base64;

String decrypt(String encoded) =>
    // Passing an empty string to decrypt64() will throw an exception.
    encoded.isEmpty ? '' : _encryptor.decrypt64(encoded, iv: _iv);
