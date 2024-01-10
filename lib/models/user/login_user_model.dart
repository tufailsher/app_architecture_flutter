class LoginUserModel {
  bool isError;
  String msg;
  int statuscode;
  Data? data;
  dynamic err;

  LoginUserModel({
   required this.isError,
   required this.msg,
   required this.statuscode,
   required this.data,
    this.err,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      isError: json['isError'] ?? false,
      msg: json['msg'] ?? '',
      statuscode: json['statuscode'] ?? 0,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      err: json['err'],
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'isError': isError,
      'msg': msg,
      'statuscode': statuscode,
      'data': data?.toJson(),
      'err': err,
    };
  }
}

class Data {
  UserData? userData;
  String token;

  Data({
    this.userData,
   required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    //Define default UserData
   
    return Data(
      userData: json['userData'] != null ? UserData.fromJson(json['userData']) : null,
      token: json['token'] ?? '',
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'userData': userData?.toJson(),
      'token': token,
    };
  }
}

class UserData {
  DateTime createdAt;
  DateTime updatedAt;
  String guid;
  bool isActive;
  String companyGuid;
  String systemRole;
  String username;
  String name;
  String email;
  String phone;
  dynamic avatar;
  String providerRole;
  String providerNumber;

  UserData({
   required this.createdAt,
  required  this.updatedAt,
   required this.guid,
   required this.isActive,
   required this.companyGuid,
   required this.systemRole,
   required this.username,
   required this.name,
   required this.email,
   required this.phone,
   required this.avatar,
   required this.providerRole,
   required this.providerNumber,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : DateTime.now(),
      guid: json['GUID'] ?? '',
      isActive: json['isActive'] ?? false,
      companyGuid: json['companyGuid'] ?? '',
      systemRole: json['systemRole'] ?? '',
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'],
      providerRole: json['providerRole'] ?? '',
      providerNumber: json['providerNumber'] ?? '',
    );
  }
    Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'GUID': guid,
      'isActive': isActive,
      'companyGuid': companyGuid,
      'systemRole': systemRole,
      'username': username,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'providerRole': providerRole,
      'providerNumber': providerNumber,
    };
  }

  //Define copyWith method for UserData
  UserData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? guid,
    bool? isActive,
    String? companyGuid,
    String? systemRole,
    String? username,
    String? name,
    String? email,
    String? phone,
    dynamic avatar,
    String? providerRole,
    String? providerNumber,
  }) {
    return UserData(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      guid: guid ?? this.guid,
      isActive: isActive ?? this.isActive,
      companyGuid: companyGuid ?? this.companyGuid,
      systemRole: systemRole ?? this.systemRole,
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      providerRole: providerRole ?? this.providerRole,
      providerNumber: providerNumber ?? this.providerNumber,
    );
  }
  // Define a tojson method for LoginUserModel
 

}
