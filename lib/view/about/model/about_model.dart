class ApiResponse {
  List<dynamic> myRefer;
  dynamic notification;
  UserInfo userInfo;
  List<Wallet> wallets;
  List<dynamic> income;
  List<String> incomeType;
  List<dynamic> incomeList;
  Map<String, int> packages;
  List<dynamic> sentMoney;
  List<dynamic> receiveMoney;

  ApiResponse({
    required this.myRefer,
    required this.notification,
    required this.userInfo,
    required this.wallets,
    required this.income,
    required this.incomeType,
    required this.incomeList,
    required this.packages,
    required this.sentMoney,
    required this.receiveMoney,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      myRefer: json['myRefer'] ?? [],
      notification: json['notification'],
      userInfo: UserInfo.fromJson(json['userInfo']),
      wallets: (json['wallets'] as List)
          .map((item) => Wallet.fromJson(item))
          .toList(),
      income: json['income'] ?? [],
      incomeType: List<String>.from(json['income_type'] ?? []),
      incomeList: json['income_list'] ?? [],
      packages: Map<String, int>.from(json['packages'] ?? {}),
      sentMoney: json['sent_money'] ?? [],
      receiveMoney: json['receive_money'] ?? [],
    );
  }
}

class UserInfo {
  int id;
  String name;
  String uuid;
  String phone;
  String email;
  String image;
  int approved;
  int genderId;
  int isInvest;
  String? emailVerifiedAt;
  int themeId;
  int rankId;
  int treeId;
  String createdAt;

  UserInfo({
    required this.id,
    required this.name,
    required this.uuid,
    required this.phone,
    required this.email,
    required this.image,
    required this.approved,
    required this.genderId,
    required this.isInvest,
    required this.emailVerifiedAt,
    required this.themeId,
    required this.rankId,
    required this.treeId,
    required this.createdAt,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      uuid: json['uuid'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      approved: json['approved'] ?? 0,
      genderId: json['gender_id'] ?? 0,
      isInvest: json['is_invest'] ?? 0,
      emailVerifiedAt: json['email_verified_at'],
      themeId: json['theme_id'] ?? 0,
      rankId: json['rank_id'] ?? 0,
      treeId: json['tree_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class Wallet {
  String name;
  double balance;
  String walletId;
  int currencyId;
  int userId;
  String mood;
  int status;
  String createdAt;

  Wallet({
    required this.name,
    required this.balance,
    required this.walletId,
    required this.currencyId,
    required this.userId,
    required this.mood,
    required this.status,
    required this.createdAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      name: json['name'] ?? '',
      balance: json['balance'] ?? 0,
      walletId: json['wallet_id'] ?? '',
      currencyId: json['currency_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      mood: json['mood'] ?? '',
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}
