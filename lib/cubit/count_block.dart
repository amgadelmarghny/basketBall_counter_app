import 'package:counter/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterAStateChange());

  int teamAPoints = 0;
  int teamBPoints = 0;

  void teamIncrease(String teamName, int teamPointInput) {
    if (teamName == 'A') {
      teamAPoints += teamPointInput;
      emit(CounterAStateChange());
    } else  {
      teamBPoints += teamPointInput;
      emit(CounterBStateChange());
    }
    emit(state);
  }
}
