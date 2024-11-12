 

class LoginResponseModel {
  final String clientId;
  final String data;

  LoginResponseModel({required this.clientId, required this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      clientId: json['client_id'] ?? '',
      data: json['data'] ?? '',
    );
  }
}


 