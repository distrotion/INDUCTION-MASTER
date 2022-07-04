import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/03JGC-DASHBOARD/JGC-DASHBOARDvar.dart';

//-------------------------------------------------

String server = GserverJGC;

abstract class JGCdashboardGET_Event {}

class JGCdashboardGET_READ extends JGCdashboardGET_Event {}

class JGCdashboardGET_Bloc
    extends Bloc<JGCdashboardGET_Event, JGCDASHBOARDclass> {
  JGCdashboardGET_Bloc() : super(JGCDASHBOARDclass()) {
    on<JGCdashboardGET_READ>((event, emit) {
      return _JGCdashboardGET_READ(JGCDASHBOARDclass(), emit);
    });
  }
  Future<void> _JGCdashboardGET_READ(
      JGCDASHBOARDclass toAdd, Emitter<JGCDASHBOARDclass> emit) async {
    JGCDASHBOARDclass output = JGCDASHBOARDclass();
    final response = await Dio().post(
      server + "JGCdh",
      data: {},
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
      //statusin
      output.statusin = 'OK';
      output.currentPIC = databuff['currentPIC'] != null
          ? databuff['currentPIC'].toString()
          : '';
      output.datedataMEM = databuff['datedataMEM'] != null
          ? databuff['datedataMEM'].toString()
          : '';
      output.datedataMEM2 = databuff['datedataMEM2'] != null
          ? databuff['datedataMEM2'].toString()
          : '';
      output.ALL_AUTO =
          databuff['ALL_AUTO'] != null ? databuff['ALL_AUTO'].toString() : '';

      output.OK = databuff['OK'] != null ? databuff['OK'].toString() : '';

      output.WNG = databuff['WNG'] != null ? databuff['WNG'].toString() : '';

      output.NG = databuff['NG'] != null ? databuff['NG'].toString() : '';

      output.AENG = databuff['AENG'] != null ? databuff['AENG'].toString() : '';
    }

    emit(output);
  }
}
