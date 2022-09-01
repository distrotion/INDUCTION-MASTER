import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../data/datadummy.dart';
import '../../data/model.dart';
import '../../page/02INDreport/INDreportMAIN.dart';
import '../../page/P8INCOILBYDATE/INCOILBYDATEvar.dart';
import '../../page/P9ACTIVECOIL/ACTIVECOILmain.dart';
import '../../page/page2.dart';
import '../../widget/common/Loading copy.dart';

//-------------------------------------------------

var csvdata = [];
// String server = 'http://172.23.10.40:14500/';
String server = 'http://127.0.0.1:14500/';

abstract class INDgetallActual_Event {}

class INDgetallActualGetData extends INDgetallActual_Event {}

class INDgetallActual_Bloc extends Bloc<INDgetallActual_Event, List<dataset>> {
  INDgetallActual_Bloc() : super([]) {
    on<INDgetallActualGetData>((event, emit) {
      return _INDgetallActualGet_Function([], emit);
    });
  }
  Future<void> _INDgetallActualGet_Function(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    FreeLoading(ACTIVECOILmaincontext);
    final response = await Dio().post(
      server + "getallACTUAL",
      data: {},
    );

    List<dataset> output = [];
    List<dataset> outputTA = [];

    if (response.statusCode == 200) {
      Navigator.pop(ACTIVECOILmaincontext);
      var databuff = response.data;
      if (databuff != null && databuff.length > 0) {
        //------------------------------

        for (int i = 0; i < databuff.length; i++) {
          output.add(dataset(
            id: i + 1,
            f01:
                databuff[i]['WID'] != null ? databuff[i]['WID'].toString() : '',
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
                : '',
            f06: databuff[i]['COIL_NO'] != null
                ? databuff[i]['COIL_NO'].toString()
                : '',
            f07: databuff[i]['STATUS'] != null
                ? databuff[i]['STATUS'].toString()
                : '',
            f08: databuff[i]['TOTAL'] != null
                ? databuff[i]['TOTAL'].toString()
                : '',
          ));
        }
        //------------------------------

        // for (int i = 0; i < output.length; i++) {
        //   output[i].f08 = output[i].f04;
        //   for (int j = 0; j < output.length; j++) {
        //     if (output[i].f01 != output[j].f01 &&
        //         output[i].f02 == output[j].f02 &&
        //         output[i].f06 == output[j].f06) {
        //       output[i].f08 =
        //           (int.parse(output[i].f08) + int.parse(output[j].f04))
        //               .toString();
        //       // print(output[i].f08);
        //     }
        //   }
        // }
        //------------------------------
      }
    } else {
      Navigator.pop(ACTIVECOILmaincontext);
      print("NO SERVICE");
    }

    emit(output);
  }
}
