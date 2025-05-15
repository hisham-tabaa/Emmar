import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<bool> verifyOTP(String email, String otp);
  Future<bool> createAccount(String name, String email, String phoneNumber, String password);
  Future<bool> forgotPassword(String email);
  Future<UserModel> validateToken(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final String baseUrl = 'http://192.168.137.1';

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(String phoneNumber, String password) async {
    final response = await client.post(
      Uri.parse('$baseUrl/api/mobile/auth/abp-login-url'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> verifyOTP(String email, String otp) async {
    final response = await client.post(
      Uri.parse('$baseUrl/verify-otp'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'otp': otp,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> createAccount(String name, String email, String phoneNumber, String password) async {
    final response = await client.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> forgotPassword(String phoneNumber) async {
    final response = await client.post(
      Uri.parse('$baseUrl/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'phoneNumber': phoneNumber,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> validateToken(String token) async {
    final response = await client.get(
      Uri.parse('$baseUrl/api/mobile/auth/validate-token'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}