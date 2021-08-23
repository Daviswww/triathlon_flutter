part of 'mybloc_bloc.dart';

abstract class MyblocEvent extends Equatable {
  const MyblocEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends MyblocEvent {
  final int count;

  const IncrementEvent(this.count);

  @override
  String toString() => 'IncrementEvent(count: $count)';
}

class DecrementEvent extends MyblocEvent {
  final int count;

  const DecrementEvent(this.count);

  @override
  String toString() => 'DecrementEvent(count: $count)';
}
