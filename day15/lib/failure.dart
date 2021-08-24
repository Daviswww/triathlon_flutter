import 'package:equatable/equatable.dart';

abstract class ServiceFailure extends Equatable {
  const ServiceFailure();

  @override
  List<Object> get props => [];
}

class PostFailure extends ServiceFailure {
  final code;
  final message;

  PostFailure(this.code, this.message);

  @override
  List<Object> get props => [code, message];
}

class GetFailure extends ServiceFailure {
  final code;
  final message;

  GetFailure(this.code, this.message);

  @override
  List<Object> get props => [code, message];
}

class PullFailure extends ServiceFailure {
  final code;
  final message;

  PullFailure(this.code, this.message);

  @override
  List<Object> get props => [code, message];
}

class ServerException extends ServiceFailure {
  final message;

  ServerException(this.message);

  @override
  List<Object> get props => [message];
}
