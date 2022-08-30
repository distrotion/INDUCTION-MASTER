import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../data/model.dart';
import '../../page/P6INDCOIL/INDCOILVar.dart';

abstract class INDgetACDataSetEvent {}

// String server = 'http://127.0.0.1:14500/';
String server = 'http://172.23.10.40:14500/';
// String server = GserverNEW;

class GetDataPressedX extends INDgetACDataSetEvent {}

class CounterValue extends INDgetACDataSetBloc {
  final int value;
  CounterValue(this.value);
}

class INDgetACDataSetBloc extends Bloc<INDgetACDataSetEvent, List<dataset>> {
  /// {@macro counter_bloc}
  INDgetACDataSetBloc() : super(<dataset>[]) {
    on<GetDataPressedX>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      server + "getSingleACTUAL",
      data: {"WID": INDcoil.Scon01},
    );
    List<dataset> output = [];

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      for (int i = 0; i < databuff.length; i++) {
        output.add(dataset(
          id: i + 1,
          f01: databuff[i]['WID'] != null ? databuff[i]['WID'].toString() : '',
          f02: databuff[i]['COIL_NAME'] != null
              ? databuff[i]['COIL_NAME'].toString()
              : '',
          f03: databuff[i]['PATTERN'] != null
              ? databuff[i]['PATTERN'].toString()
              : '',
          f04: databuff[i]['COUNTER'] != null
              ? databuff[i]['COUNTER'].toString()
              : '',
          f05: databuff[i]['LIMIT'] != null
              ? databuff[i]['LIMIT'].toString()
              : '',
          f06: databuff[i]['COIL_NO'] != null
              ? databuff[i]['COIL_NO'].toString()
              : '',
          f07: databuff[i]['STATUS'] != null
              ? databuff[i]['STATUS'].toString()
              : '',
        ));
      }
    } else {}

    emit(output);
  }
}
