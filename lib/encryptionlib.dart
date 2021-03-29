import 'dart:convert';

import 'package:encrypt/encrypt.dart';

/*
 * AES mode intentionally not implemented yet
 */

const IV_LENGTH = 16;

class AmpEncrypter {
  AmpEncrypter(String key) : key = Key.fromUtf8(key);

  final Key key;

  AmpEncrypted encrypt(String input) {
    var iv = IV.fromSecureRandom(IV_LENGTH);
    return AmpEncrypted(Encrypter(AES(key)).encrypt(input, iv: iv).base64, iv);
  }

  String decrypt(AmpEncrypted ampEncrypted) =>
      Encrypter(AES(key)).decrypt(ampEncrypted.encrypted, iv: ampEncrypted.iv);
}

class AmpEncrypted {
  AmpEncrypted(this.cipher, this.iv);

  final IV iv;
  final String cipher;

  Encrypted get encrypted => Encrypted.fromBase64(cipher);

  String toJson() => '{"iv":"${iv.base64}","cipher":"$cipher"}';

  static AmpEncrypted fromJson(String input) {
    if (input == null) return null;
    var json = jsonDecode(input);
    return AmpEncrypted(json['cipher'], IV.fromBase64(json['iv']));
  }

  @override
  String toString() => toJson();
}

String base64Encode(String input) => base64.encode(utf8.encode(input));
