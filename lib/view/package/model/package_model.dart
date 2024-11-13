class ApiResponseModel {
  UserInfo? userInfo;
  List<dynamic>? myRefer;
  String? notification;
  Wallet? wallet;
  List<String>? incomeType;
  Map<String, dynamic>? packages;

  ApiResponseModel({
    this.userInfo,
    this.myRefer,
    this.notification,
    this.wallet,
    this.incomeType,
    this.packages,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      userInfo: json['userInfo'] != null
          ? UserInfo.fromJson(json['userInfo'])
          : null,
      myRefer: json['myRefer'] != null ? List.from(json['myRefer']) : [],
      notification: json['notification'],
      wallet: json['wallets'] != null && json['wallets'].isNotEmpty
          ? Wallet.fromJson(json['wallets'][0])
          : null,
      incomeType: json['income_type'] != null
          ? List<String>.from(json['income_type'])
          : [],
      packages: json['packages'] != null ? Map<String, dynamic>.from(json['packages']) : {},
    );
  }
}

class UserInfo {
  String? name;
  String? phone;
  String? email;

  UserInfo({this.name, this.phone, this.email});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

class Wallet {
  String? name;
  double? balance;

  Wallet({this.name, this.balance});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      name: json['name'],
      balance: json['balance'].toDouble(),
    );
  }
}
