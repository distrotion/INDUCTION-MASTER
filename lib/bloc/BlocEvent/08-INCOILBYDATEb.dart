import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../data/datadummy.dart';
import '../../data/model.dart';
import '../../page/02INDreport/INDreportMAIN.dart';
import '../../page/P8INCOILBYDATE/INCOILBYDATEMAIN.dart';
import '../../page/P8INCOILBYDATE/INCOILBYDATEvar.dart';
import '../../page/page2.dart';
import '../../widget/common/Loading copy.dart';

//-------------------------------------------------
//
var csvdata = [];
String server = 'http://172.23.10.40:14500/';
// String server = 'http://127.0.0.1:14500/';

abstract class INCOILBYDATEb_Event {}

class INCOILBYDATEbGetData extends INCOILBYDATEb_Event {}

class INCOILBYDATEb_Bloc extends Bloc<INCOILBYDATEb_Event, List<dataset>> {
  INCOILBYDATEb_Bloc() : super([]) {
    on<INCOILBYDATEbGetData>((event, emit) {
      return _INCOILBYDATEbGet_Function([], emit);
    });
  }
  Future<void> _INCOILBYDATEbGet_Function(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      server + "COILcheckdate",
      data: {
        "START": INCOILBYDATEvar.selectedDateSTART,
        "END": INCOILBYDATEvar.selectedDateEND,
      },
    );

    List<dataset> output = [];

    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff != null && databuff.length > 0) {
        //------------------------------
        // print(databuff);
        for (int i = 0; i < 20; i++) {
          output.add(dataset(
            id: i + 1,
            f01: databuff[i].toString(),
          ));
        }
        //------------------------------
      }
    } else {
      print("NO SERVICE");
    }

    emit(output);
  }
}
