// import 'dart:convert';
// import 'package:encrypt/encrypt.dart' as encrypt;

// class KeyPairData {
//   final String publicKey = '''-----BEGIN PUBLIC KEY-----
// MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoSXl6hjM8HsmYCZH0ILSzJvvLMlMqvBjeIrWS/yRQtvMhdy1yA2qHTBjvNX1OGsKMY30hMzv79S/xhTevWDTmuQ+gRPRwTd0SdQ6cIE0k+JX7t57eVcXYLQhN3yW8+kUjTGSOXGiRV40eHNQvkTjV5CSVqvU2DR8yGrb1XxV3AdkvupvW2Tsm2CbXQgn958QMyoH/wOLZ38soKJi1naNn3txBonKuBadxtwgwJ/aBygQfBCz1oxn9bN7mfcl0/vMkCBsTsRgnwq7+YJEsEjEEGvfT0Oz7uR4yQ5pZhX7g4t+xnd+jB7Mzf9sP0cyARy4h9MbysUIuhiFE6PVMjV2/wIDAQAB
// -----END PUBLIC KEY-----''';

//   final String privateKey = '''-----BEGIN PRIVATE KEY-----
// MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDa25uEa01jlioiopHlNwdE+lm9ZVdi6GcQe6v4ef8WkJBIXukqRM4RnWtgbh2SXJ4hNekCQKwjPjeCkcW2oA8Gx8lvA1rbVtZKbUiAp7RJXJByRrSQAs9RqT2sSKmpzkOU8oj0EyAtvoLPQNJDzP5pMM21VSxb3xCkR5fNidaZpoa/1sVxA6p88JUdSoUCVZaSwR03DEyN6SMbdcM/oY3CTQ3YHNKmQtMT1D5BpiGpwoh5uT0o5xM8T8jeAKUnXTQmmV0ZoI5ZXnoivIFf9HYu2uZdS5yS7ZST+SXecVyMnOEg5lEMkU9hxdQVC0kgMrjQ6/KCw8jhMUfDgmPmHN3LAgMBAAECggEAA2ckvONaObEtCIrUj+bSIx1tZcd8m1oXuCbkHqHu+G/Y/ncTUwfs2FNFRyOPLCZqgwOuks1kn8uo20ve8h78/NMAa8x2jjCEdnXKic2RvQ5GZLB6wD568L8b6WDb2nsNi/RVcs4VUwDCUeylGE7IqeQLXsVrQiZuwM8oKhb5kjwAQc0teSD1W1An0ZhDTkRk2/G2NOrtTgqbLQStVxJvbAUKql1+dYWcL2/Kpi1JQJ+Bqh6mM1ucdCKOq+2jKipp45Nqc6Z5IQBvoNbJWxlIj9Uc1/YX6wCIPVUDfdtmTeF3Z6mgzMLNgyrFIDFTlVXTbFRBI6EHegqVfAR9SuL8SQKBgQDwJp+h0gFRhpazVz2GXEeQ510gauYVZgjTO/CeKwoiqH/HWcDQ+pr8uerntLD+Iq9qFmgtBGvB6Mo4sHXKqKrBXU3/ERIqw6XT/oic7lyCVsByKyTZC0uioH/lvpkBAQ+9A1E18h24QTTk4rgB6yLakGoIiiQfYSS9dH+dVMAt3wKBgQDpTTxYjZDsHOlMm5KsHPXfZeiY5v84KyoeOX8GfmoSzlE/m7Z+BhRw2Ah3+MAFp4sh/8CG+JB30+VUQ5KeP/8PDUzeJHYTUwEYYWXWZ2JGd/ccwBw+Gr0EUyCcm7orfYpOSgqQVBUPeO1P7aB2BTniO5BeETObqj1lusstOZ01lQKBgD8alxXJfikzCYSEpxkYRIHyGcl77Yuv7R+8f2TAgIBM8I6sqfr/7xv7qptKIrwU1y00SBmUMNCaYBD3ZWxkV8JJx0X/8VslX/zNxI4gIFTrgNQ/PAaAblaEgDcZl1DpO356UauwPFj/YWvHm3x9kgIGsqYdzpIkT6gs5Z+s9nbXAoGBAMwpKcD4ibUGC+ddUTpK0aNgo+6CXx/BLkdq201MfPjeEd3PHyEjoumpM6gBR9Dq8GedTtcOWCZ0iQB3bawMpuB+LCFN2QJKJfA2845vxGGUg+xl9ZEnhvds42IJKR776ndedeYdnpx+n3XNphkBs8jVhR28geQcU0Rd9YUrIPcNAoGBAJCNs341+4Qh3NyD8SP7T3bxtCEute3MLqRZ1g010hy4ui9Wm7bGx/UV5ur80VYF+D+YCJnxa1IeOmFhiREwc6zcVVfonKnsKkV/gSFaH56UJPzPbjR5LCPbksmDwSwrBCzf9cpoHVQbIzJrLcYq1lQwR31p+pgz/2OOS86boHhq
// -----END PRIVATE KEY-----''';

//   // Encrypt the data with public key
//   String? encryptData(Map<String, dynamic> data) {
//     final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: publicKey));
//     final encrypted = encrypter.encrypt(jsonEncode(data));
//     return encrypted.base64;
//   }

//   // Decrypt the data with private key
//   Map<String, dynamic>? decryptData(String encrypted) {
//     final encrypter = encrypt.Encrypter(encrypt.RSA(privateKey: privateKey));
//     final decrypted = encrypter.decrypt64(encrypted);
//     final decodedData = jsonDecode(decrypted);
//     return decodedData;
//   }

//   // Decrypt the data in chunks
//   Map<String, dynamic>? decryptDataChunk(String encryptedData) {
//     List<String> chunkData = encryptedData.split('==');
//     List<String> encryptedChunks = [];
    
//     // Add '==' to every chunk except the last one
//     for (var chunk in chunkData) {
//       if (chunk.length > 1) {
//         encryptedChunks.add(chunk + '==');
//       }
//     }

//     String decryptedData = '';  // Initialize decrypted data

//     // Decrypt each chunk
//     for (var chunk in encryptedChunks) {
//       final decryptedChunk = decryptData(chunk);
//       if (decryptedChunk == null) {
//         return null;  // Return null if decryption fails
//       }
//       decryptedData += jsonEncode(decryptedChunk);  // Concatenate decrypted chunk
//     }

//     // Return the final decoded data
//     return jsonDecode(decryptedData);
//   }
// }





// <?php

// namespace App\Http\Controllers;

// use App\CCA\InjectApiHelper;
// use App\CCA\KeyPairData;
// use Illuminate\Http\Request;
// use JsonException;

// class ApiHelper extends Controller
// {
//     private KeyPairData $keyPairData;
//     private InjectApiHelper $injectApiHelper;

//     private static $baseUrl = 'https://fcbglobal.uk/api/v1';

//     //private static $baseUrl = 'https://fcbglobal.uk/api/v1';

//     public function __construct()
//     {
//         $this->keyPairData = new KeyPairData();
//         $this->injectApiHelper = new InjectApiHelper();
//     }

//     public function getKeyPairApiData()
//     {
//         $url = self::$baseUrl . '/get-key';
//         $data = json_encode([], JSON_THROW_ON_ERROR);
//         return $this->injectApiHelper->injection(url: $url, postFields: $data);
//     }

//     /**
//      * @throws JsonException
//      */
//     public function login()
//     {
//         $url = self::$baseUrl . '/login';
//         $encryptedData = $this->keyPairData->encryptData([
//             'client_id' => 3,
//             'app_id' => 1001,
//             'user_id' => 'mashbi@fcbuk.com',
//             'password' => 'Mashbi940493'
//         ]);
//         $postFiled = json_encode([
//             'client_id' => 3,
//             'data' => $encryptedData
//         ], JSON_THROW_ON_ERROR);
//         $response =  $this->injectApiHelper->injection(url: $url, postFields: $postFiled);
//         return $this->keyPairData->decryptData($response);
//     }

//     public function logout()
//     {
//         $url = self::$baseUrl . '/logout';
//         $encryptedData = $this->keyPairData->encryptData([
//             'client_id' => 2,
//             'app_id' => 1002,
//         ]);
//         $postFiled = json_encode([
//             'client_id' => 2,
//             'data' => $encryptedData
//         ], JSON_THROW_ON_ERROR);
//         return $this->injectApiHelper->injection(url: $url, postFields: $postFiled);
//     }

//     public function home()
//     {
//         $url = self::$baseUrl . '/inject';
//         $encryptedData = $this->keyPairData->encryptData([
//             'app_id' => 1003,
//         ]);

//         $postFiled = [
//             'client_id' => 3,
//             'data' => $encryptedData
//         ];

//         return $response = $this->injectApiHelper->authInject($postFiled);
//         return $this->keyPairData->decryptDataChunk($response);
//     }

// }
