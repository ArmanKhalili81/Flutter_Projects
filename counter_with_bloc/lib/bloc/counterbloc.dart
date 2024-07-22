import 'package:flutter_bloc/flutter_bloc.dart';

// abstract class CounterEvent {}

// class Increament extends CounterEvent {}

// class Decreament extends CounterEvent {}

// class Reset extends CounterEvent {}

// class Refresh extends CounterEvent {
//   final int _newnumber;
//   Refresh(this._newnumber);
// }

class Counterbloc extends Cubit<int> {
  Counterbloc() : super(0) {
    // on<Decreament>((event, emit) => emit(state - 1));
    // on<Reset>((event, emit) => emit(0));
    // on<Refresh>((event, emit) => emit(event._newnumber));
  }
  increament() {
    emit(state + 1);
  }

  decreament() {
    emit(state - 1);
  }

  reset() {
    emit(0);
  }

  refresh(int newnumber) {
    emit(newnumber);
  }
}
