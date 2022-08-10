import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../data/model.dart';
import '../../page/P7INDPATTERN/INDPATTERNVar.dart';

abstract class INDpatternDataSetEvent {}

// String server = 'http://127.0.0.1:15000/';
String server = GserverNEWTEST;

class GetDataPressed extends INDpatternDataSetEvent {}

class UpdateDataPressed extends INDpatternDataSetEvent {}

class CounterValue extends INDpatternDataSetBloc {
  final int value;
  CounterValue(this.value);
}

class INDpatternDataSetBloc
    extends Bloc<INDpatternDataSetEvent, List<dataset>> {
  /// {@macro counter_bloc}
  INDpatternDataSetBloc() : super(<dataset>[]) {
    on<GetDataPressed>((event, emit) {
      return _getdata([], emit);
    });
    on<UpdateDataPressed>((event, emit) {
      return _updata([], emit);
    });
  }
  Future<void> _getdata(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      server + "getINDpattern",
      data: {},
    );
    List<dataset> output = [];

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        output.add(dataset(
          id: i + 1,
          f01: databuff[i]['PID'],
          f02: databuff[i]['PATTERN'],
          f03: databuff[i]['VOLT'],
          f04: databuff[i]['POWER'],
          f05: databuff[i]['TIME'],
        ));
      }
    } else {}

    emit(output);
  }

  Future<void> _updata(List<dataset> toAdd, Emitter<List<dataset>> emit) async {
//--------------------------- return
    final responseW = await Dio().post(
      server + "INDpatternUPDATE",
      data: {
        "PID": INDpattern.con01,
        "PATTERN": INDpattern.con02,
        "VOLT": INDpattern.con03,
        "POWER": INDpattern.con04,
        "TIME": INDpattern.con05,
      },
    );

    if (responseW.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = responseW.data;
      // print(databuff);

    } else {}

    //----------------------------------

    final response = await Dio().post(
      server + "getINDpattern",
      data: {},
    );
    List<dataset> output = [];

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        output.add(dataset(
          id: i + 1,
          f01: databuff[i]['PID'],
          f02: databuff[i]['PATTERN'],
          f03: databuff[i]['VOLT'],
          f04: databuff[i]['POWER'],
          f05: databuff[i]['TIME'],
        ));
      }
    } else {}

    emit(output);
  }
}
