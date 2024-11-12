//splash screen model for app get key------->

class KeyResponseModel {
  final int clientId;
  final String sendingKey;
  final String receivingKey;

  KeyResponseModel({
    required this.clientId,
    required this.sendingKey,
    required this.receivingKey,
  });

  factory KeyResponseModel.fromJson(Map<String, dynamic> json) {
    return KeyResponseModel(
      clientId: json['client_id'],
      sendingKey: json['sendingKey'],
      receivingKey: json['receivingKey'],
    );
  }
}
