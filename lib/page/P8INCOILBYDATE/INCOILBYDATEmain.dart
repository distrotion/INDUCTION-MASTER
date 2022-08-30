import 'dart:html';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/08-INCOILBYDATEb.dart';
import '../../bloc/BlocEvent/CsvExportEvent.dart';
import '../../data/global.dart';
import '../../data/model.dart';
import '../../widget/table/exportTable.dart';
import 'INCOILBYDATEvar.dart';

// DateTime selectedDate = DateTime.now();

class INCOILBYDATEmain extends StatefulWidget {
  INCOILBYDATEmain({Key? key, this.data}) : super(key: key);
  List<dataset>? data;

  @override
  State<INCOILBYDATEmain> createState() => _INCOILBYDATEmainState();
}

class _INCOILBYDATEmainState extends State<INCOILBYDATEmain> {
  @override
  Widget build(BuildContext context) {
    Pagememory = 2;
    Future<void> _selectDateSTART(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: INCOILBYDATEvar.selectedDateSTARTDT,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != INCOILBYDATEvar.selectedDateSTARTDT) {
        setState(() {
          INCOILBYDATEvar.selectedDateSTARTDT = picked;
          INCOILBYDATEvar.selectedDateSTART =
              "${INCOILBYDATEvar.selectedDateSTARTDT.toLocal()}".split(' ')[0];
        });
      }
    }

    Future<void> _selectDateEND(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: INCOILBYDATEvar.selectedDateENDDT,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != INCOILBYDATEvar.selectedDateENDDT) {
        setState(() {
          INCOILBYDATEvar.selectedDateENDDT = picked;
          INCOILBYDATEvar.selectedDateEND =
              "${INCOILBYDATEvar.selectedDateENDDT.toLocal()}".split(' ')[0];
        });
      }
    }

    List<dataset> _data = widget.data ??
        [
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset(),
          dataset()
        ];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Row(
              children: [
                Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Center(child: Text("START"))),
                InkWell(
                    onTap: () {
                      _selectDateSTART(context);
                    },
                    child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                            child: Text(INCOILBYDATEvar.selectedDateSTART)))),
                Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Center(child: Text("END"))),
                InkWell(
                    onTap: () {
                      _selectDateEND(context);
                    },
                    child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                            child: Text(INCOILBYDATEvar.selectedDateEND)))),
                Container(
                  color: Colors.green,
                  height: 50,
                  width: 100,
                  child: InkWell(
                    child: const Center(
                      child: Text(
                        "CHECH COIL",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      if (INCOILBYDATEvar.selectedDateSTART != '' &&
                          INCOILBYDATEvar.selectedDateEND != '') {
                        setState(() {
                          context
                              .read<INCOILBYDATEb_Bloc>()
                              .add(INCOILBYDATEbGetData());
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
            ],
          ),
          for (int i = 0; i < _data.length; i++)
            Row(
              children: [
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Center(child: Text("Condition ${i + 1}")),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2), //data
                  ),
                  child: Center(child: Text("${_data[i].f01}")),
                ),
              ],
            ),
          // TableCsvPreview(data: widget.datatable ?? [])
        ],
      ),
    );
  }
}
