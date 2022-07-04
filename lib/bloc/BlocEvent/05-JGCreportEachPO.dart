import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/05JGCreportEachPO/JGCreportEachPOMAIN.dart';
import '../../page/05JGCreportEachPO/JGCreportEachPOVAR.dart';
import '../../widget/common/Loading copy.dart';
import '../../widget/common/popup.dart';

//-------------------------------------------------

String server = GserverNEW;

abstract class JGCreportEachPO_Event {}

class JGCreportEachPO_READ extends JGCreportEachPO_Event {}

class JGCreportEachPO_Pressed_02 extends JGCreportEachPO_Event {}

class JGCreportEachPO_Bloc extends Bloc<JGCreportEachPO_Event, datainEachPO> {
  JGCreportEachPO_Bloc() : super(datainEachPO()) {
    on<JGCreportEachPO_READ>((event, emit) {
      return _JGCreportEachPO_READ(datainEachPO(), emit);
    });
  }
  Future<void> _JGCreportEachPO_READ(
      datainEachPO toAdd, Emitter<datainEachPO> emit) async {
    datainEachPO output = datainEachPO();
    print(JGCreportEachPOVAR);
    FreeLoading(JGCreportEachPOMAINcontext);
    final response = await Dio().post(
      server + "getJCEdataBARCODE",
      data: {
        "BARCODE": JGCreportEachPOVAR.PO,
      },
    );

    if (response.statusCode == 200) {
      Navigator.pop(JGCreportEachPOMAINcontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      print(databuff);

      if (databuff['STATUS'].toString() == 'OK') {
        output.STATUS = databuff['STATUS'].toString();
        output.PO = databuff['PO'].toString();
        output.ALL_AUTO = double.parse(databuff['ALL_AUTO'].toString());
        output.OK = double.parse(databuff['OK'].toString());
        output.WNG = double.parse(databuff['WNG'].toString());
        output.NG = double.parse(databuff['NG'].toString());
        output.AENG = double.parse(databuff['AENG'].toString());
      } else {
        WORNINGpop(JGCreportEachPOMAINcontext, ["Date error"], 100, 300);
      }
    } else {
      Navigator.pop(JGCreportEachPOMAINcontext);
    }

    emit(output);
  }
}
