import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "text")
  String? text;
  @JsonKey(name: "data")
  List<Datum>? data;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "method")
  String? method;
  @JsonKey(name: "endpoint")
  String? endpoint;
  @JsonKey(name: "error")
  List<dynamic>? error;

  UserModel({
    this.status,
    this.text,
    this.data,
    this.time,
    this.method,
    this.endpoint,
    this.error,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "access_token")
  String? accessToken;
  @JsonKey(name: "email_verified")
  int? emailVerified;
  @JsonKey(name: "phone_no_verified")
  int? phoneNoVerified;
  @JsonKey(name: "username_added")
  int? usernameAdded;
  @JsonKey(name: "phone_no_added")
  int? phoneNoAdded;
  @JsonKey(name: "kyclevel")
  int? kyclevel;
  @JsonKey(name: "pin_added")
  int? pinAdded;
  @JsonKey(name: "is_login_2fa_active")
  int? isLogin2FaActive;
  @JsonKey(name: "the_2fa_type")
  int? the2FaType;

  Datum({
    this.accessToken,
    this.emailVerified,
    this.phoneNoVerified,
    this.usernameAdded,
    this.phoneNoAdded,
    this.kyclevel,
    this.pinAdded,
    this.isLogin2FaActive,
    this.the2FaType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
