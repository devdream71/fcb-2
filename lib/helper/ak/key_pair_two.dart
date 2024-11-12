import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class KeyPairData {
  late final String publicKey;
  late final String privateKey;

  KeyPairData() {
    publicKey = '''-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3qyeYWm92AYz3r5iEaC+RkvT/aC19ieLKbiSVoEy7TCxhJEPOo61c31Z7QHCQ3eZC0uf3BLIzFPapWa9am0Mo/bP+hJi0hlcKmIQXQ31YT8TlO7PXbGtBzAGv2DFOmufYHGXgMbCylBOy5oVUEwS/SJwixVCursJ5FteAbPiNoTgVjJgWaFRukWNik9tIJ6El2kJwTJQMjC/M3spMdAYDkh96u79KA4nx88S7DKBv2FSgYGdcYGbxlgXt4Tmk08ngQQhzxr13kjrxLl7qC4xTgfHhpkuIFDpmqSJTzFvG+WRgnofsAfNOHQ8XilpJRBsLFC5MpbLryvdQ5PWtlx3cwIDAQAB
-----END PUBLIC KEY-----''';

    privateKey = '''-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCUKrg58K5ceyM6mreui390hQdfBXvlro7KA+vfpQJvDmZqcIV3lbvQRFLiyBRmL/AwTde/SjGjaiSpDjWOLk1A7Y8GinvCTohOfOfzuaFyzprCMKmIxDsXSinjp4KyKcsPtBrbZX0RFKNOTZ5QlTseneMSv256MtRbP7DZgpmrj4ELNBaDOrkdSMZI70lhAGcRdd5uOlz4BySUu0fqyTUx8q0K2lFeBGhKBcKZtgB4xDfFpT1wSuv6ncGxbok4QkKVFnVvGlVGQNFG5d8IppIBZUF8PMVUkIdvZ+PAEHaW2H3ja5/zehyQV7TScA3y8PAeTLv4rwn9zDstVRKprWUDAgMBAAECggEANf/fxpYWJfRm4Xvzx7RljkTRa+smvY3B0pRdSdPssCbyYoaBzhSPL5dHEgnTjW6ZPjGQmNHkh2cu10IreJcdZrVts/eSpT1T5i8VpjkYQyxTMMTldMf3tUQ9QhARzPb4X8/HHgC99RStc+NL+Jh6xGzMjk+gZv7RcDQlMxCrCuAjM0A9129Y8FD9I2cv1ikEEeyqSUjNXV0RnauiUs9Rv9EeI+YH+LKFH2KwfVeE2IUa3iB9i6RE16lRMpLinBqttp1XpCIsO6B5WDr9XKXAWx2481Wm5nJeQ3fZMq2B3AYUpqecK4cwsfsKN6TEYQONWsRR9fZmieIsYZOLsoV2OQKBgQDBGYwjljtwgFYJea+TCr0nbDugkq2s7nk6PtlBzMzu10mZLgZfFD+XhyA5s16TYMUzlGtUHGToRFz5iWc7nokK272Wtl5YF8fpSslY5EyHhU7JOLGP9B8YYYN75gsJNA/7j8FLFLk7Co3rMs6kwD9OFNzDB/4j7EBJWsrSkqpJxQKBgQDEbj+TaQNwMAhMHbZIfrQQZqiU2Hu2zHI93SRFphjzRD1iItuOwLZQ3/dGQTgz2S2oNS1lc6Wzf71OLPq32+z3W/Bgk3sAbmXRVH/XcS1jvu9sXcDsupmpYi1z3GSed/6udKyQEHWzzDVffIH5h37hEO7KfvgKIbOpq97FDpYIJwKBgQC8G8oUBM7kmnC2DE/Im4aG9/3iP+FmfG2mGwGEAyGEbj9pNJfKWaxVTbJL43t3cKbKx4QCzSJTzf0QrhTd1GPGKyg2wHOJt6jskAkzSjtvLaMBjPQUuwjrtFrlAMWxcoE7W+A95vNHG9IC1FzPy+QfiV1BtPCTSBucGhFJLs0qzQKBgG96BfiZi0r652qTHiTsSzJXoGrApQ0r39W+D9y7E8PTQWbVU3cjZRRm1oV3c/bw1Nl2PGosBKjm4L9iBXOci1IiSjv01sR64qu24cqZv2GxNV1xo5B1ockgH512QWAxx0aojlpADRxZ0xx6o6TCQb5nBq3C+u99CuJK2OVKjtjXAoGBAK4BzoaY3Vo+g0qZDrT2x2wWy5emsnWeqA2Rqe/xJXmusliOZO2CjR+OLFsdfsmGea0BclSf3ZZ0J6M3wSeGcYhZZ/RpAHq/tIliBQh7SgaSJcBCWsTtLK1ajD5jnGLyKO1XoJq4EICQmdxw7oeTcFGUMXdCHwy69C6bvLW2wZew
-----END PRIVATE KEY-----''';
  }

  // Convert the key strings to RSAPublicKey and RSAPrivateKey using pointycastle
  RSAPublicKey _getPublicKey(String key) {
    final parser = RSAKeyParser();
    return parser.parse(key) as RSAPublicKey;
  }

  RSAPrivateKey _getPrivateKey(String key) {
    final parser = RSAKeyParser();
    return parser.parse(key) as RSAPrivateKey;
  }

  // Encrypt data
  String? encryptData(Map<String, dynamic> data) {
    try {
      final encrypter =
          encrypt.Encrypter(encrypt.RSA(publicKey: _getPublicKey(publicKey)));
      final encrypted = encrypter.encrypt(jsonEncode(data));
      return base64.encode(encrypted.bytes);
    } catch (e) {
      print('Encryption failed: $e');
      return null;
    }
  }

  // Decrypt data
  Map<String, dynamic>? decryptData(String encrypted) {
    try {
      final decrypter = encrypt.Encrypter(
          encrypt.RSA(privateKey: _getPrivateKey(privateKey)));
      final decrypted = decrypter.decrypt64(encrypted);
      return jsonDecode(decrypted);
    } catch (e) {
      print('Decryption failed: $e');
      return null;
    }
  }
}
