import 'package:rxdart/rxdart.dart';

class SunsetsBloc {
  final _numberSunset = BehaviorSubject<int>();

  ///getter
  Stream<int> get numberSunsets => _numberSunset.stream;

  ///setter
  Function(int) get changeNumberSunset => _numberSunset.sink.add;

  void setNumber (int number) async {
    changeNumberSunset(number);
  }
}