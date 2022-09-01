import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../data/model.dart';
import '../../page/P6INDCOIL/INDCOILVar.dart';
import '../../page/P6INDCOIL/datatest.dart';

abstract class INDcoilDataSetEvent {}

// String server = 'http://127.0.0.1:14500/';
String server = GserverNEW;

class GetDataPressed extends INDcoilDataSetEvent {}

class UpdateDataPressed extends INDcoilDataSetEvent {}

class CounterValue extends INDcoilDataSetBloc {
  final int value;
  CounterValue(this.value);
}

class INDcoilDataSetBloc extends Bloc<INDcoilDataSetEvent, List<dataset>> {
  /// {@macro counter_bloc}
  INDcoilDataSetBloc() : super(<dataset>[]) {
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
      server + "getINDCOIL",
      data: {},
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
              : '0',
          f05: databuff[i]['LIMIT'] != null
              ? databuff[i]['LIMIT'].toString()
              : '0',
          f06: databuff[i]['COIL_NO'] != null
              ? databuff[i]['COIL_NO'].toString()
              : '',
          f07: databuff[i]['STATUS'] != null
              ? databuff[i]['STATUS'].toString()
              : '',
          f09: databuff[i]['MODEL'] != null
              ? databuff[i]['MODEL'].toString()
              : '',
        ));
      }
    } else {}
    print(output);
    emit(output);
  }

  Future<void> _updata(List<dataset> toAdd, Emitter<List<dataset>> emit) async {
//--------------------------- return
    final responseW = await Dio().post(
      server + "INDcoilUPDATE",
      data: {
        "WID": INDcoil.con01,
        "COIL_NAME": INDcoil.con02,
        "PATTERN": INDcoil.con03,
        "LIMIT": INDcoil.con05,
        "COIL_NO": INDcoil.con06,
        "STATUS": INDcoil.con07,
        "MODEL": INDcoil.con09,
      },
    );

    if (responseW.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = responseW.data;
      // print(databuff);
    } else {}

    //----------------------------------

    final response = await Dio().post(
      server + "getINDCOIL",
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
          f01: databuff[i]['WID'] != null ? databuff[i]['WID'].toString() : '',
          f02: databuff[i]['COIL_NAME'] != null
              ? databuff[i]['COIL_NAME'].toString()
              : '',
          f03: databuff[i]['PATTERN'] != null
              ? databuff[i]['PATTERN'].toString()
              : '',
          f04: databuff[i]['COUNTER'] != null
              ? databuff[i]['COUNTER'].toString()
              : '0',
          f05: databuff[i]['LIMIT'] != null
              ? databuff[i]['LIMIT'].toString()
              : '0',
          f06: databuff[i]['COIL_NO'] != null
              ? databuff[i]['COIL_NO'].toString()
              : '',
          f07: databuff[i]['STATUS'] != null
              ? databuff[i]['STATUS'].toString()
              : '',
          f09: databuff[i]['MODEL'] != null
              ? databuff[i]['MODEL'].toString()
              : '',
        ));
      }
    } else {}

    emit(output);
  }
}
