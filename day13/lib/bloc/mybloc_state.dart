part of 'mybloc_bloc.dart';

abstract class MyblocState extends Equatable {
  const MyblocState();

  @override
  List<Object> get props => [];
}

class MyblocInitial extends MyblocState {
  final int count = 0;

  @override
  String toString() => 'Count (count: $count)';
}

class Success extends MyblocState {
  final int count;

  const Success(this.count);

  @override
  List<Object> get props => [count];
}

class Failure extends MyblocState {}
