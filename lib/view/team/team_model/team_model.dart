class TreeResponse {
  final int id;
  final String joiningDate;
  final int placement;
  final int lCarryPoint;
  final int rCarryPoint;
  final int lMember;
  final int rMember;
  final String createdAt;
  final String updatedAt;
  final int userId;
  final User user;
  final Downlink? downlinkLeft;
  final Downlink? downlinkRight;
  final ReferBy referBy;

  TreeResponse({
    required this.id,
    required this.joiningDate,
    required this.placement,
    required this.lCarryPoint,
    required this.rCarryPoint,
    required this.lMember,
    required this.rMember,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.user,
    this.downlinkLeft,
    this.downlinkRight,
    required this.referBy,
  });

  factory TreeResponse.fromJson(Map<String, dynamic> json) {
    return TreeResponse(
      id: json['id'],
      joiningDate: json['joining_date'],
      placement: json['placement'],
      lCarryPoint: json['l_carry_point'],
      rCarryPoint: json['r_carry_point'],
      lMember: json['l_member'],
      rMember: json['r_member'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userId: json['user_id'],
      user: User.fromJson(json['user']),
      downlinkLeft: json['downlink_left'] != null
          ? Downlink.fromJson(json['downlink_left'])
          : null,
      downlinkRight: json['downlink_right'] != null
          ? Downlink.fromJson(json['downlink_right'])
          : null,
      referBy: ReferBy.fromJson(json['refer_by']),
    );
  }
}

class Downlink {
  final int id;
  final String joiningDate;
  final int placement;
  final int lCarryPoint;
  final int rCarryPoint;
  final int lMember;
  final int rMember;
  final User user;
  final Downlink? downlinkLeft2nd;
  final Downlink? downlinkRight2nd;

  Downlink({
    required this.id,
    required this.joiningDate,
    required this.placement,
    required this.lCarryPoint,
    required this.rCarryPoint,
    required this.lMember,
    required this.rMember,
    required this.user,
    this.downlinkLeft2nd,
    this.downlinkRight2nd,
  });

  factory Downlink.fromJson(Map<String, dynamic> json) {
    return Downlink(
      id: json['id'],
      joiningDate: json['joining_date'],
      placement: json['placement'],
      lCarryPoint: json['l_carry_point'],
      rCarryPoint: json['r_carry_point'],
      lMember: json['l_member'],
      rMember: json['r_member'],
      user: User.fromJson(json['user']),
      downlinkLeft2nd: json['downlink_left2nd'] != null
          ? Downlink.fromJson(json['downlink_left2nd'])
          : null,
      downlinkRight2nd: json['downlink_right2nd'] != null
          ? Downlink.fromJson(json['downlink_right2nd'])
          : null,
    );
  }
}

class User {
  final int id;
  final String name;
  final String phone;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

class ReferBy {
  final int id;
  final String name;
  final String phone;
  final String email;

  ReferBy({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory ReferBy.fromJson(Map<String, dynamic> json) {
    return ReferBy(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
