import 'dart:convert';

import 'package:final_year_project_mobile_app/models/gender.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final DateTime dob;
  final String? otherName;
  final Gender gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String accessToken;
  final String refreshToken;
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.dob,
    this.otherName,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
    required this.refreshToken,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    DateTime? dob,
    String? otherName,
    Gender? gender,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? accessToken,
    String? refreshToken,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      dob: dob ?? this.dob,
      otherName: otherName ?? this.otherName,
      gender: gender ?? this.gender,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    final user = <String, dynamic>{};
    final tokens = <String, String>{};
    user.addAll({'first_name': firstName});
    user.addAll({'last_name': lastName});
    user.addAll({'email': email});
    user.addAll({'password': password});
    user.addAll({'dob': dob.toIso8601String()});
    if (otherName != null) {
      user.addAll({'other_name': otherName});
    }
    user.addAll({'gender': gender.getValue});
    user.addAll({'created_at': createdAt.toIso8601String()});
    user.addAll({'updated_at': updatedAt.toIso8601String()});
    tokens.addAll({'access': accessToken});
    tokens.addAll({'refresh': refreshToken});
    final map = <String, dynamic>{};
    map.addAll({'user': user});
    map.addAll({'tokens': tokens});
    return map;
  }

  Map<String, dynamic> toMapForResgistration() {
    final map = <String, dynamic>{};
    map.addAll({'first_name': firstName});
    map.addAll({'last_name': lastName});
    map.addAll({'email': email});
    map.addAll({'password': password});
    map.addAll({'dob': dob.toIso8601String()});
    if (otherName != null) {
      map.addAll({'other_name': otherName});
    }
    map.addAll({'gender': gender.getValue});
    map.addAll({'created_at': createdAt.toIso8601String()});
    map.addAll({'updated_at': updatedAt.toIso8601String()});
    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> user = map['user'];
    Map<String, String> tokens = map['tokens'] ?? {} as Map<String, String>;
    return User(
      firstName: user['firstName'] ?? '',
      lastName: user['lastName'] ?? '',
      email: user['email'] ?? '',
      password: user['password'] ?? '',
      dob: DateTime.parse(user['dob']),
      otherName: user['otherName'],
      gender: user['gender'] == 'MALE' ? Gender.MALE : Gender.FEMALE,
      createdAt: DateTime.parse(user['created_at']),
      updatedAt: DateTime.parse(user['updated_at']),
      accessToken: tokens['access'] ?? '',
      refreshToken: tokens['refresh'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, email: $email, dob: $dob, otherName: $otherName, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.dob == dob &&
        other.otherName == otherName &&
        other.gender == gender &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        dob.hashCode ^
        otherName.hashCode ^
        gender.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        accessToken.hashCode ^
        refreshToken.hashCode;
  }
}

extension GenderExtension on Gender {
  String get getValue => this == Gender.MALE ? 'MALE' : 'FEMALE';
}
