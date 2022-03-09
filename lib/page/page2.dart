import 'dart:html';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/CsvExportEvent.dart';
import '../data/datadummy.dart';
import '../data/global.dart';
import '../data/model.dart';
import '../widget/table/exportTable.dart';
import 'page0.dart';
import '../data/global.dart';

DateTime selectedDate = DateTime.now();

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2Body();
    ;
  }
}

class Page2Body extends StatelessWidget {
  const Page2Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CsvExport_Bloc(),
        child: BlocBuilder<CsvExport_Bloc, List<dataset>>(
          builder: (context, datatable) {
            return CsvPicker(
              datatable: datatable,
            );
          },
        ));

    ;
  }
}

class CsvPicker extends StatefulWidget {
  CsvPicker({Key? key, this.datatable}) : super(key: key);
  List<dataset>? datatable;

  @override
  State<CsvPicker> createState() => _CsvPickerState();
}

class _CsvPickerState extends State<CsvPicker> {
  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          // print(selectedDate);
        });
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Center(
                            child: Text(
                                "${selectedDate.toLocal()}".split(' ')[0])))),
                Container(
                  color: Colors.green,
                  height: 50,
                  width: 100,
                  child: InkWell(
                      child: const Center(
                        child: Text(
                          "Query Data",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          context
                              .read<CsvExport_Bloc>()
                              .add(CsvExportGetData());
                        });
                      }),
                ),
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: 100,
                  child: InkWell(
                      child: const Center(
                        child: Text(
                          "Export to CSV",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          final List data = csvdata;
                          ExpCSV(data);
                        });
                      }),
                ),
              ],
            ),
          ),
          TableCsvPreview(data: widget.datatable ?? [])
        ],
      ),
    );
  }
}

ExpCSV(List data) {
  List<List<dynamic>> rows = [];

  for (int i = -1; i < data.length; i++) {
    List<dynamic> row = [];
    if (i == -1) {
      row.add('date');
      row.add('Condition No');
      row.add('G');
      row.add('NG');
      row.add(' ');
      row.add('1st output VOLT set');
      row.add('1st output VOLT MEAS CURRENT');
      row.add('1st output VOLT MEAS MIN');
      row.add('1st output VOLT MEAS MAX');
      row.add('1st output POWER MEAS CURRENT');
      row.add('1st output POWER MEAS MIN');
      row.add('1st output POWER MEAS MAX');
      row.add('1st HEATING TEMP MEAS CURRENT');
      row.add('1st HEATING TEMP MEAS MIN');
      row.add('1st HEATING TEMP MEAS MAX');
      row.add('1st HEATING SET TIME');
      row.add('1st HEATING MEAS TIME');
      row.add(' ');
      row.add('2nd output VOLT set');
      row.add('2nd output VOLT MEAS CURRENT');
      row.add('2nd output VOLT MEAS MIN');
      row.add('2nd output VOLT MEAS MAX');
      row.add('2nd output POWER MEAS CURRENT');
      row.add('2nd output POWER MEAS MIN');
      row.add('2nd output POWER MEAS MAX');
      row.add('2nd HEATING TEMP MEAS CURRENT');
      row.add('2nd HEATING TEMP MEAS MIN');
      row.add('2nd HEATING TEMP MEAS MAX');
      row.add('2nd HEATING WAIT SET TIME');
      row.add('2nd HEATING WAIT MEAS TIME');
      row.add('2nd HEATING SET TIME');
      row.add('2nd HEATING MEAS TIME');
      row.add(' ');
      row.add('3th output VOLT set');
      row.add('3th output VOLT MEAS CURRENT');
      row.add('3th output VOLT MEAS MIN');
      row.add('3th output VOLT MEAS MAX');
      row.add('3th output POWER MEAS CURRENT');
      row.add('3th output POWER MEAS MIN');
      row.add('3th output POWER MEAS MAX');
      row.add('3th HEATING TEMP MEAS CURRENT');
      row.add('3th HEATING TEMP MEAS MIN');
      row.add('3th HEATING TEMP MEAS MAX');
      row.add('3th HEATING WAIT SET TIME');
      row.add('3th HEATING WAIT MEAS TIME');
      row.add('3th HEATING SET TIME');
      row.add('3th HEATING MEAS TIME');
      row.add(' ');
      row.add('4th output VOLT set');
      row.add('4th output VOLT MEAS CURRENT');
      row.add('4th output VOLT MEAS MIN');
      row.add('4th output VOLT MEAS MAX');
      row.add('4th output POWER MEAS CURRENT');
      row.add('4th output POWER MEAS MIN');
      row.add('4th output POWER MEAS MAX');
      row.add('4th HEATING TEMP MEAS CURRENT');
      row.add('4th HEATING TEMP MEAS MIN');
      row.add('4th HEATING TEMP MEAS MAX');
      row.add('4th HEATING WAIT SET TIME');
      row.add('4th HEATING WAIT MEAS TIME');
      row.add('4th HEATING SET TIME');
      row.add('4th HEATING MEAS TIME');
      row.add(' ');
      row.add('AIR COOLING TIME SET');
      row.add('AIR COOLING TIME MEAS');
      row.add('HEAD CENTER REV');
      row.add('TAIL CENTER REV');
      row.add('CYCLE TIME');
    } else {
      row.add(data[i]['date']);
      row.add(data[i]['Condition No']);
      row.add(data[i]['G']);
      row.add(data[i]['NG']);
      row.add(' ');
      row.add(data[i]['1st output VOLT set']);
      row.add(data[i]['1st output VOLT MEAS CURRENT']);
      row.add(data[i]['1st output VOLT MEAS MIN']);
      row.add(data[i]['1st output VOLT MEAS MAX']);
      row.add(data[i]['1st output POWER MEAS CURRENT']);
      row.add(data[i]['1st output POWER MEAS MIN']);
      row.add(data[i]['1st output POWER MEAS MAX']);
      row.add(data[i]['1st HEATING TEMP MEAS CURRENT']);
      row.add(data[i]['1st HEATING TEMP MEAS MIN']);
      row.add(data[i]['1st HEATING TEMP MEAS MAX']);
      row.add(data[i]['1st HEATING SET TIME']);
      row.add(data[i]['1st HEATING MEAS TIME']);
      row.add(' ');
      row.add(data[i]['2nd output VOLT set']);
      row.add(data[i]['2nd output VOLT MEAS CURRENT']);
      row.add(data[i]['2nd output VOLT MEAS MIN']);
      row.add(data[i]['2nd output VOLT MEAS MAX']);
      row.add(data[i]['2nd output POWER MEAS CURRENT']);
      row.add(data[i]['2nd output POWER MEAS MIN']);
      row.add(data[i]['2nd output POWER MEAS MAX']);
      row.add(data[i]['2nd HEATING TEMP MEAS CURRENT']);
      row.add(data[i]['2nd HEATING TEMP MEAS MIN']);
      row.add(data[i]['2nd HEATING TEMP MEAS MAX']);
      row.add(data[i]['2nd HEATING WAIT SET TIME']);
      row.add(data[i]['2nd HEATING WAIT MEAS TIME']);
      row.add(data[i]['2nd HEATING SET TIME']);
      row.add(data[i]['2nd HEATING MEAS TIME']);
      row.add(' ');
      row.add(data[i]['3th output VOLT set']);
      row.add(data[i]['3th output VOLT MEAS CURRENT']);
      row.add(data[i]['3th output VOLT MEAS MIN']);
      row.add(data[i]['3th output VOLT MEAS MAX']);
      row.add(data[i]['3th output POWER MEAS CURRENT']);
      row.add(data[i]['3th output POWER MEAS MIN']);
      row.add(data[i]['3th output POWER MEAS MAX']);
      row.add(data[i]['3th HEATING TEMP MEAS CURRENT']);
      row.add(data[i]['3th HEATING TEMP MEAS MIN']);
      row.add(data[i]['3th HEATING TEMP MEAS MAX']);
      row.add(data[i]['3th HEATING WAIT SET TIME']);
      row.add(data[i]['3th HEATING WAIT MEAS TIME']);
      row.add(data[i]['3th HEATING SET TIME']);
      row.add(data[i]['3th HEATING MEAS TIME']);
      row.add(' ');
      row.add(data[i]['4th output VOLT set']);
      row.add(data[i]['4th output VOLT MEAS CURRENT']);
      row.add(data[i]['4th output VOLT MEAS MIN']);
      row.add(data[i]['4th output VOLT MEAS MAX']);
      row.add(data[i]['4th output POWER MEAS CURRENT']);
      row.add(data[i]['4th output POWER MEAS MIN']);
      row.add(data[i]['4th output POWER MEAS MAX']);
      row.add(data[i]['4th HEATING TEMP MEAS CURRENT']);
      row.add(data[i]['4th HEATING TEMP MEAS MIN']);
      row.add(data[i]['4th HEATING TEMP MEAS MAX']);
      row.add(data[i]['4th HEATING WAIT SET TIME']);
      row.add(data[i]['4th HEATING WAIT MEAS TIME']);
      row.add(data[i]['4th HEATING SET TIME']);
      row.add(data[i]['4th HEATING MEAS TIME']);
      row.add(' ');
      row.add(data[i]['AIR COOLING TIME SET']);
      row.add(data[i]['AIR COOLING TIME MEAS']);
      row.add(data[i]['HEAD CENTER REV']);
      row.add(data[i]['TAIL CENTER REV']);
      row.add(data[i]['CYCLE TIME']);
    }

    rows.add(row);
  }
  String datetada = "${selectedDate.toLocal()}".split(' ')[0];
  String csv = const ListToCsvConverter().convert(rows);
  AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
    ..setAttribute("download", "INDUCTION DATA ${datetada}.csv")
    ..click();
}
