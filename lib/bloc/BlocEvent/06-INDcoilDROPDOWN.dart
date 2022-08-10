import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../data/model.dart';

abstract class INDcoilDROPDOWNDataSetEvent {}

// String server = 'http://127.0.0.1:15000/';
String server = GserverNEWTEST;

class GetDataDropdown extends INDcoilDROPDOWNDataSetEvent {}

class CounterValue extends INDcoilDROPDOWNDataSetBloc {
  final int value;
  CounterValue(this.value);
}

class INDcoilDROPDOWNDataSetBloc
    extends Bloc<INDcoilDROPDOWNDataSetEvent, List<MapEntry<String, String>>> {
  /// {@macro counter_bloc}
  INDcoilDROPDOWNDataSetBloc() : super([]) {
    on<GetDataDropdown>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(List<MapEntry<String, String>> toAdd,
      Emitter<List<MapEntry<String, String>>> emit) async {
    final response = await Dio().post(
      server + "getINDpattern",
      data: {},
    );
    List<MapEntry<String, String>> output = [];

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      output.add(const MapEntry('-', '-'));
      for (int i = 0; i < databuff.length; i++) {
        output.add(MapEntry(databuff[i]['PATTERN'].toString(),
            databuff[i]['PATTERN'].toString()));
      }
    } else {}
    print(output);
    emit(output);
  }
}
