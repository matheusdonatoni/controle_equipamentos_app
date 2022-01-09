import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EasyEncrypter {
  EasyEncrypter() {
    _setupEncrypter();
  }

  Key get _key => Key.fromUtf8(dotenv.get('SECRET').substring(0, 32));
  IV get _iv => IV.fromLength(16);

  Encrypter _encrypter;

  void _setupEncrypter() {
    _encrypter = Encrypter(AES(_key));
  }

  String encrypt(String input) {
    try {
      return _encrypter.encrypt(input, iv: _iv).base64;
    } catch (_) {
      return '';
    }
  }

  String decrypt(String encoded) {
    try {
      return _encrypter.decrypt64(encoded, iv: _iv);
    } catch (_) {
      return '';
    }
  }
}
