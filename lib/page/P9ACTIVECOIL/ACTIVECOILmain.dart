import 'package:INDUCTION_MASTER/styles/TextStyle.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/09-1-INDgetallActual.dart';
import '../../data/model.dart';

late BuildContext ACTIVECOILmaincontext;

class ACTIVECOILmain extends StatefulWidget {
  ACTIVECOILmain({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  State<ACTIVECOILmain> createState() => _ACTIVECOILmainState();
}

class _ACTIVECOILmainState extends State<ACTIVECOILmain> {
  @override
  void initState() {
    super.initState();
    context.read<INDgetallActual_Bloc>().add(INDgetallActualGetData());
  }

  @override
  Widget build(BuildContext context) {
    ACTIVECOILmaincontext = context;
    List<dataset> _data = widget.data ?? [];
    return SizedBox(
      width: 550,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  context
                      .read<INDgetallActual_Bloc>()
                      .add(INDgetallActualGetData());
                },
                child: Container(
                  width: 100,
                  height: 30,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      "RELOAD",
                      style: TxtStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Center(
                    child: Text("COIL NAME"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Center(
                    child: Text("COIL NO"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Center(
                    child: Text("PATTERN"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Center(
                    child: Text("MAX SETUP"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      "ACTUAL",
                      style: TxtStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            for (int i = 0; i < _data.length; i++)
              _table(
                data1: _data[i].f02,
                data2: _data[i].f06,
                data3: _data[i].f03,
                data4: _data[i].f05,
                data5: _data[i].f04,
              )
          ],
        ),
      ),
    );
  }
}

class _table extends StatelessWidget {
  _table({
    Key? key,
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
  }) : super(key: key);
  String? data1;
  String? data2;
  String? data3;
  String? data4;
  String? data5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Text(data1 ?? ''),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Text(data2 ?? ''),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Text(data3 ?? ''),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Text(data4 ?? ''),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.red, width: 2),
          ),
          child: Center(
            child: Text(
              data5 ?? '',
              style: TxtStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
