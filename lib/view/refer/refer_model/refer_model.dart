class MyReferApiResponseModel {
  UserInfo? userInfo;
  List<MyRefer>? myRefer;   
  String? notification;
  Wallet? wallet;
  List<String>? incomeType;
  Map<String, dynamic>? packages;
  List<Map<String, dynamic>>? incomes;

  MyReferApiResponseModel({
    this.userInfo,
    this.myRefer,
    this.notification,
    this.wallet,
    this.incomeType,
    this.packages,
    this.incomes,
  });

  factory MyReferApiResponseModel.fromJson(Map<String, dynamic> json) {
    return MyReferApiResponseModel(
      userInfo: json['userInfo'] != null
          ? UserInfo.fromJson(json['userInfo'])
          : null,
      myRefer: json['myRefer'] != null
          ? (json['myRefer'] as List).map((e) => MyRefer.fromJson(e)).toList()
          : [],
      notification: json['notification'],
      wallet: json['wallets'] != null && json['wallets'].isNotEmpty
          ? Wallet.fromJson(json['wallets'][0])
          : null,
      incomeType: json['income_type'] != null
          ? List<String>.from(json['income_type'])
          : [],
      packages: json['packages'] != null ? Map<String, dynamic>.from(json['packages']) : {},
      incomes: json['income'] != null ? List<Map<String, dynamic>>.from(json['income']) : [],
    );
  }
}

class MyRefer {
  int? id;
  String? joiningDate;
  int? placement;
  int? lCarryPoint;
  int? rCarryPoint;
  int? lMember;
  int? rMember;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;
  int? uplinkId;
  int? downlinkLeftId;
  int? downlinkRightId;
  int? referById;
  User? user;

  MyRefer({
    this.id,
    this.joiningDate,
    this.placement,
    this.lCarryPoint,
    this.rCarryPoint,
    this.lMember,
    this.rMember,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userId,
    this.uplinkId,
    this.downlinkLeftId,
    this.downlinkRightId,
    this.referById,
    this.user,
  });

  factory MyRefer.fromJson(Map<String, dynamic> json) {
    return MyRefer(
      id: json['id'],
      joiningDate: json['joining_date'],
      placement: json['placement'],
      lCarryPoint: json['l_carry_point'],
      rCarryPoint: json['r_carry_point'],
      lMember: json['l_member'],
      rMember: json['r_member'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      userId: json['user_id'],
      uplinkId: json['uplink_id'],
      downlinkLeftId: json['downlink_left_id'],
      downlinkRightId: json['downlink_right_id'],
      referById: json['refer_by_id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? email;

  User({this.id, this.name, this.phone, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
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
