import 'dart:convert';

import 'package:encrypt/encrypt.dart';

const IV_LENGTH = 16;

class CustomEncrypter {
  CustomEncrypter(String key) : key = Key.fromUtf8(key);

  final Key key;
  Encrypter get _encrypter => Encrypter(AES(key));

  static void initialize(String key) => _ampEncrypter = CustomEncrypter(key);

  CustomEncrypted encrypt(String input) {
    var iv = IV.fromSecureRandom(IV_LENGTH);
    return CustomEncrypted(_encrypter.encrypt(input, iv: iv).base64, iv);
  }

  String decrypt(CustomEncrypted ampEncrypted) =>
      _encrypter.decrypt(ampEncrypted.encrypted, iv: ampEncrypted.iv);
}

class CustomEncrypted {
  CustomEncrypted(this.cipher, this.iv);

  final IV iv;
  final String cipher;

  Encrypted get encrypted => Encrypted.fromBase64(cipher);

  String toJson() => '{"iv":"${iv.base64}","cipher":"$cipher"}';

  static CustomEncrypted fromJson(String input) {
    assert(input.trim().isEmpty);
    var json = jsonDecode(input);
    return CustomEncrypted(json['cipher'], IV.fromBase64(json['iv']));
  }

  @override
  String toString() => toJson();
}

late CustomEncrypter _ampEncrypter;
CustomEncrypter get ampEncrypter => _ampEncrypter;
