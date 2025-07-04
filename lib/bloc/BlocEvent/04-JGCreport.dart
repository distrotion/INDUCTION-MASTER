import 'package:INDUCTION_MASTER/widget/common/Loading%20copy.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/04JGCreport/JGCreportMAIN.dart';
import '../../page/04JGCreport/JGCreportVAR.dart';
import '../../widget/common/popup.dart';

//-------------------------------------------------

String server = GserverNEW;

abstract class JGCreportGET_Event {}

class JGCreportGET_BTWdate extends JGCreportGET_Event {}

class JGCreportGET_Bloc extends Bloc<JGCreportGET_Event, datain> {
  JGCreportGET_Bloc() : super(datain()) {
    on<JGCreportGET_BTWdate>((event, emit) {
      return _JGCreportGET_BTWdate(datain(), emit);
    });
  }
  Future<void> _JGCreportGET_BTWdate(datain toAdd, Emitter<datain> emit) async {
    FreeLoading(JGCreportMAINcontext);
    datain output = datain();
    final response = await Dio().post(
      server + "getJCEreport",
      data: {
        "STARTyear": JGCreportVAR.startDATEout.year.toString(),
        "STARTmonth": JGCreportVAR.startDATEout.month.toString(),
        "STARTday": JGCreportVAR.startDATEout.day.toString(),
        "ENDyear": JGCreportVAR.endDATEout.year.toString(),
        "ENDmonth": JGCreportVAR.endDATEout.month.toString(),
        "ENDday": JGCreportVAR.endDATEout.day.toString(),
      },
    );

    if (response.statusCode == 200) {
      Navigator.pop(JGCreportMAINcontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      if (databuff['STATUS'].toString() == 'OK') {
        output.STATUS = databuff['STATUS'].toString();
        output.DATE = databuff['DATE'].toString();
        output.ALL_AUTO = double.parse(databuff['ALL_AUTO'].toString());
        output.OK = double.parse(databuff['OK'].toString());
        output.WNG = double.parse(databuff['WNG'].toString());
        output.NG = double.parse(databuff['NG'].toString());
        output.AENG = double.parse(databuff['AENG'].toString());
        output.QASSNG = double.parse(databuff['QASSNG'].toString());
      } else {
        WORNINGpop(JGCreportMAINcontext, ["Date error"], 100, 300);
      }
    } else {
      Navigator.pop(JGCreportMAINcontext);
    }
    emit(output);
  }
}
