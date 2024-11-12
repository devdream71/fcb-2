// import 'dart:convert';
// import 'dart:async';
// import 'package:encrypt/encrypt.dart' as encrypt;

// import 'package:pointycastle/asymmetric/api.dart' as rsa;
// import 'package:pointycastle/asymmetric/rsa.dart' as rsaLib;
// import 'package:http/http.dart' as http;

// class EncryptDecrypt {
//   final String publicKey =
//       '''MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoSXl6hjM8HsmYCZH0ILSzJvvLMlMqvBjeIrWS/yRQtvMhdy1yA2qHTBjvNX1OGsKMY30hMzv79S/xhTevWDTmuQ+gRPRwTd0SdQ6cIE0k+JX7t57eVcXYLQhN3yW8+kUjTGSOXGiRV40eHNQvkTjV5CSVqvU2DR8yGrb1XxV3AdkvupvW2Tsm2CbXQgn958QMyoH/wOLZ38soKJi1naNn3txBonKuBadxtwgwJ/aBygQfBCz1oxn9bN7mfcl0/vMkCBsTsRgnwq7+YJEsEjEEGvfT0Oz7uR4yQ5pZhX7g4t+xnd+jB7Mzf9sP0cyARy4h9MbysUIuhiFE6PVMjV2/wIDAQAB'''; // Your public key
//   final String privateKey =
//       '''MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDa25uEa01jlioiopHlNwdE+lm9ZVdi6GcQe6v4ef8WkJBIXukqRM4RnWtgbh2SXJ4hNekCQKwjPjeCkcW2oA8Gx8lvA1rbVtZKbUiAp7RJXJByRrSQAs9RqT2sSKmpzkOU8oj0EyAtvoLPQNJDzP5pMM21VSxb3xCkR5fNidaZpoa/1sVxA6p88JUdSoUCVZaSwR03DEyN6SMbdcM/oY3CTQ3YHNKmQtMT1D5BpiGpwoh5uT0o5xM8T8jeAKUnXTQmmV0ZoI5ZXnoivIFf9HYu2uZdS5yS7ZST+SXecVyMnOEg5lEMkU9hxdQVC0kgMrjQ6/KCw8jhMUfDgmPmHN3LAgMBAAECggEAA2ckvONaObEtCIrUj+bSIx1tZcd8m1oXuCbkHqHu+G/Y/ncTUwfs2FNFRyOPLCZqgwOuks1kn8uo20ve8h78/NMAa8x2jjCEdnXKic2RvQ5GZLB6wD568L8b6WDb2nsNi/RVcs4VUwDCUeylGE7IqeQLXsVrQiZuwM8oKhb5kjwAQc0teSD1W1An0ZhDTkRk2/G2NOrtTgqbLQStVxJvbAUKql1+dYWcL2/Kpi1JQJ+Bqh6mM1ucdCKOq+2jKipp45Nqc6Z5IQBvoNbJWxlIj9Uc1/YX6wCIPVUDfdtmTeF3Z6mgzMLNgyrFIDFTlVXTbFRBI6EHegqVfAR9SuL8SQKBgQDwJp+h0gFRhpazVz2GXEeQ510gauYVZgjTO/CeKwoiqH/HWcDQ+pr8uerntLD+Iq9qFmgtBGvB6Mo4sHXKqKrBXU3/ERIqw6XT/oic7lyCVsByKyTZC0uioH/lvpkBAQ+9A1E18h24QTTk4rgB6yLakGoIiiQfYSS9dH+dVMAt3wKBgQDpTTxYjZDsHOlMm5KsHPXfZeiY5v84KyoeOX8GfmoSzlE/m7Z+BhRw2Ah3+MAFp4sh/8CG+JB30+VUQ5KeP/8PDUzeJHYTUwEYYWXWZ2JGd/ccwBw+Gr0EUyCcm7orfYpOSgqQVBUPeO1P7aB2BTniO5BeETObqj1lusstOZ01lQKBgD8alxXJfikzCYSEpxkYRIHyGcl77Yuv7R+8f2TAgIBM8I6sqfr/7xv7qptKIrwU1y00SBmUMNCaYBD3ZWxkV8JJx0X/8VslX/zNxI4gIFTrgNQ/PAaAblaEgDcZl1DpO356UauwPFj/YWvHm3x9kgIGsqYdzpIkT6gs5Z+s9nbXAoGBAMwpKcD4ibUGC+ddUTpK0aNgo+6CXx/BLkdq201MfPjeEd3PHyEjoumpM6gBR9Dq8GedTtcOWCZ0iQB3bawMpuB+LCFN2QJKJfA2845vxGGUg+xl9ZEnhvds42IJKR776ndedeYdnpx+n3XNphkBs8jVhR28geQcU0Rd9YUrIPcNAoGBAJCNs341+4Qh3NyD8SP7T3bxtCEute3MLqRZ1g010hy4ui9Wm7bGx/UV5ur80VYF+D+YCJnxa1IeOmFhiREwc6zcVVfonKnsKkV/gSFaH56UJPzPbjR5LCPbksmDwSwrBCzf9cpoHVQbIzJrLcYq1lQwR31p+pgz/2OOS86boHhq'''; // Your private key

//   // Method to convert PEM to RSA Key
//   rsa.RSAPublicKey parsePublicKey(String pem) {
//     final parser = rsaLib.RSAKeyParser();
//     return parser.parse(pem) as rsa.RSAPublicKey;
//   }

//   rsa.RSAPrivateKey parsePrivateKey(String pem) {
//     final parser = rsaLib.RSAKeyParser();
//     return parser.parse(pem) as rsa.RSAPrivateKey;
//   }

//   // Method to encrypt data
//   String encryptData(Map<String, dynamic> data) {
//     final dataString = jsonEncode(data);

//     // Parse the public key from PEM format
//     final publicKeyObj = parsePublicKey(publicKey);

//     // Encrypt data using public key
//     final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: publicKeyObj));
//     final encrypted = encrypter.encrypt(dataString,
//         iv: encrypt.IV.fromLength(
//             16)); // Using an empty IV (use appropriate IV if needed)

//     return base64Encode(utf8
//         .encode(encrypted.base64)); // Return encrypted data as base64 string
//   }

//   // Method to decrypt data
//   List<dynamic> decryptDataChunk(String encryptedData) {
//     List<String> chunkData = encryptedData.split('==');
//     List<String> encryptedChunks = [];

//     // Add '==' to every chunk except the last one
//     for (int i = 0; i < chunkData.length - 1; i++) {
//       encryptedChunks.add(chunkData[i] + '==');
//     }
//     if (chunkData.isNotEmpty) {
//       encryptedChunks.add(
//           chunkData.last); // Add last chunk without '==' (if it's not empty)
//     }

//     String decryptedData = ''; // Initialize the decrypted data

//     // Loop through each chunk and decrypt it
//     for (int i = 0; i < encryptedChunks.length; i++) {
//       final encryptedChunk = base64Decode(encryptedChunks[i]);

//       if (encryptedChunk.isEmpty) {
//         print("Base64 decode failed on chunk $i");
//         return []; // Return empty if decoding fails
//       }

//       final privateKeyObj = parsePrivateKey(privateKey); // Parse private key
//       final encrypter =
//           encrypt.Encrypter(encrypt.RSA(privateKey: privateKeyObj));

//       final decryptedChunk = encrypter.decrypt64(encryptedChunks[i],
//           iv: encrypt.IV.fromLength(16)); // Decrypt each chunk
//       decryptedData += decryptedChunk;
//     }

//     return jsonDecode(decryptedData); // Return the decrypted data
//   }
// }

// class NetworkService {
//   final String baseUrl = 'https://your-api-url.com';

//   // Post method to send encrypted data and get response
//   Future<String> authInject(Map<String, dynamic> postFields) async {
//     final url = Uri.parse('$baseUrl/verify_token'); // Corrected URL format

//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization':
//           'Bearer 35|DzTQGwy0Jlt1k3J4oJ420BeSDA12pGhy9Cuuzeunbaed2966', // Replace with actual token
//     };

//     final response = await http.post(
//       url,
//       headers: headers,
//       body: jsonEncode(postFields),
//     );

//     if (response.statusCode == 200) {
//       print(response.body);
//       return response.body;
//     } else {
//       return 'Error: ${response.statusCode}';
//     }
//   }
// }

// class HomeController {
//   final EncryptDecrypt encryptDecrypt = EncryptDecrypt();
//   final NetworkService networkService = NetworkService();

//   Future<List<dynamic>> home() async {
//     final encryptedData = encryptDecrypt.encryptData({'app_id': 1003});

//     final postFields = {
//       'client_id': 2,
//       'data': encryptedData,
//     };

//     final response = await networkService.authInject(postFields);

//     return encryptDecrypt.decryptDataChunk(response);
//   }
// }
