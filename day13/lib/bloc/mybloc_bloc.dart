import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:day13/count_repository.dart';
import 'package:equatable/equatable.dart';

part 'mybloc_event.dart';
part 'mybloc_state.dart';

class MyblocBloc extends Bloc<MyblocEvent, MyblocState> {
  CountRepository _countRepository;

  // 初始化
  MyblocBloc({required CountRepository countRepository})
      : _countRepository = countRepository,
        super(MyblocInitial());

  // 觸發事件
  @override
  Stream<MyblocState> mapEventToState(
    MyblocEvent event,
  ) async* {
    // 當使用者處發加一的事件時
    if (event is IncrementEvent) {
      // 調用加一的狀態
      yield* _mapIncrementToState(event.count);
    }
    // 當使用者處發減一的事件時
    if (event is DecrementEvent) {
      // 調用減一的狀態
      yield* _mapDecrementToState(event.count);
    }
  }

  // 狀態
  Stream<MyblocState> _mapIncrementToState(int count) async* {
    // 成功加一的話回傳Success否則Failure
    try {
      final _count = await _countRepository.add(count);
      yield Success(_count);
    } catch (_) {
      yield Failure();
    }
  }

  // 狀態
  Stream<MyblocState> _mapDecrementToState(int count) async* {
    // 成功減一的話回傳Success否則Failure
    try {
      final _count = await _countRepository.dec(count);
      yield Success(_count);
    } catch (_) {
      yield Failure();
    }
  }
}
