import 'package:day15/api_model.dart';
import 'package:day15/failure.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:developer';

/// Android calls the http://10.0.2.2:3000/auth endpoint.
///
/// IOS calls the http://localhost:3000/auth endpoint.
abstract class ApiDataSource {
  /// Create new user.
  Future<Either<ServiceFailure, User>> createUser(User body);

  /// Get user info id, username, passowrd
  Future<Either<ServiceFailure, User>> getUser(int id);

  /// Update user data
  Future<Either<ServiceFailure, User>> updateUser(int id, User body);
}

class UserRepository implements ApiDataSource {
  final client = http.Client();
  final String domain = "http://localhost:3000";

  @override
  Future<Either<ServiceFailure, User>> createUser(User body) {
    return _createUser(
      Uri.parse('$domain/auth'),
      body,
    );
  }

  Future<Either<ServiceFailure, User>> _createUser(
    Uri url,
    User body,
  ) async {
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body.toJson(),
      );
      if (response.statusCode == 201) {
        log(
          "${response.body}",
          name: response.statusCode.toString(),
        );
        return right(User.fromJson(response.body));
      } else {
        return left(PostFailure(
          response.statusCode,
          response.body,
        ));
      }
    } catch (e) {
      return left(ServerException(e));
    }
  }

  @override
  Future<Either<ServiceFailure, User>> getUser(id) {
    return _getUser(
      Uri.parse('$domain/auth/$id'),
    );
  }

  Future<Either<ServiceFailure, User>> _getUser(
    Uri url,
  ) async {
    try {
      final response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        log(
          "${response.body}",
          name: response.statusCode.toString(),
        );
        return right(User.fromJson(response.body));
      } else {
        return left(PostFailure(
          response.statusCode,
          response.body,
        ));
      }
    } catch (e) {
      return left(ServerException(e));
    }
  }

  @override
  Future<Either<ServiceFailure, User>> updateUser(int id, User body) {
    return _updateUser(
      Uri.parse('$domain/auth/$id'),
      body,
    );
  }

  Future<Either<ServiceFailure, User>> _updateUser(
    Uri url,
    User body,
  ) async {
    try {
      final response = await client.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body.toJson(),
      );
      if (response.statusCode == 200) {
        log(
          "${response.body}",
          name: response.statusCode.toString(),
        );
        return right(User.fromJson(response.body));
      } else {
        return left(PostFailure(
          response.statusCode,
          response.body,
        ));
      }
    } catch (e) {
      return left(ServerException(e));
    }
  }
}
