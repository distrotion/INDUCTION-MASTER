import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-1-INDcoil.dart';
import '../../bloc/BlocEvent/06-3-INDgetAc.dart';
import '../../data/global.dart';
import '../../data/model.dart';
import '../../styles/TextStyle.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Easydropdown.dart';
import '../../widget/common/Loading.dart';
import 'INDCOILTable.dart';
import 'INDCOILVar.dart';

void INDcoilConsoleBox() {
  showDialog(
    context: INDcoilContexttable,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return INDcoilconSTfull();
    },
  );
}

class INDcoilconSTfull extends StatefulWidget {
  const INDcoilconSTfull({Key? key}) : super(key: key);

  @override
  State<INDcoilconSTfull> createState() => _INDcoilconSTfullState();
}

class _INDcoilconSTfullState extends State<INDcoilconSTfull> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Dialog(
        child: Container(
          height: 600,
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Container(
                height: 600,
                width: 500,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 150,
                          height: 50,
                        ),
                        Column(
                          children: [
                            ComInputText(
                              nLimitedChar: 8,
                              // isEnabled: INDcoil.nc,
                              sLabel: "COIN NAME",
                              height: 40,
                              width: 300,
                              isContr: INDcoil.iscon01,
                              fnContr: (input) {
                                INDcoil.iscon01 = input;
                              },
                              sValue: INDcoil.con02,
                              returnfunc: (String s) {
                                INDcoil.con02 = s;
                              },
                            ),
                            ComInputText(
                              nLimitedChar: 8,
                              // isEnabled: INDcoil.nc,
                              sLabel: "COIN NAME",
                              height: 40,
                              width: 300,
                              isContr: INDcoil.iscon01,
                              fnContr: (input) {
                                INDcoil.iscon01 = input;
                              },
                              sValue: INDcoil.con09,
                              returnfunc: (String s) {
                                INDcoil.con09 = s;
                              },
                            ),
                            SizedBox(
                              height: 64,
                              width: 300,
                              child: AdvanceDropDown(
                                sLabel: "COIN NO",
                                borderCO: const Color(0xffe5e5e5),
                                listdropdown: const [
                                  MapEntry("C01", "C01"),
                                  MapEntry("C02", "C02"),
                                  MapEntry("C03", "C03"),
                                  MapEntry("C04", "C04"),
                                  MapEntry("C05", "C05"),
                                  MapEntry("C06", "C06"),
                                  MapEntry("C07", "C07"),
                                  MapEntry("C08", "C08"),
                                  MapEntry("C09", "C09"),
                                  MapEntry("C10", "C10"),
                                ],
                                onChangeinside: (d, k) {
                                  setState(() {
                                    INDcoil.con06 = d;
                                  });
                                },
                                hint: "",
                                value: INDcoil.con06,
                                height: 40,
                                width: 300,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // ComInputText(
                            //   sLabel: "PATTERN",
                            //   height: 40,
                            //   width: 300,
                            //   isContr: INDcoil.iscon01,
                            //   fnContr: (input) {
                            //     INDcoil.iscon01 = input;
                            //   },
                            //   sValue: INDcoil.con03,
                            //   returnfunc: (String s) {
                            //     INDcoil.con03 = s;
                            //   },
                            // ),
                            SizedBox(
                              height: 64,
                              width: 300,
                              child: AdvanceDropDown(
                                sLabel: "PATTERN",
                                borderCO: const Color(0xffe5e5e5),
                                listdropdown: INDcoil.dropdown,
                                onChangeinside: (d, k) {
                                  setState(() {
                                    INDcoil.con03 = d;
                                  });
                                },
                                hint: "",
                                value: INDcoil.con03,
                                height: 40,
                                width: 300,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ComInputText(
                              nLimitedChar: 10,
                              isNumberOnly: true,
                              sLabel: "LIMIT",
                              height: 40,
                              width: 300,
                              isContr: INDcoil.iscon01,
                              fnContr: (input) {
                                INDcoil.iscon01 = input;
                              },
                              sValue: INDcoil.con05,
                              returnfunc: (String s) {
                                INDcoil.con05 = s;
                              },
                            ),
                            SizedBox(
                              height: 64,
                              width: 300,
                              child: AdvanceDropDown(
                                isEnable: INDcoil.nc == true,
                                sLabel: "STATUS",
                                borderCO: const Color(0xffe5e5e5),
                                listdropdown: const [
                                  MapEntry("", ""),
                                  MapEntry("NO ACTIVE", "NO ACTIVE"),
                                  MapEntry("ACTIVE", "ACTIVE"),
                                ],
                                onChangeinside: (d, k) {
                                  setState(() {
                                    INDcoil.con07 = d;
                                  });
                                },
                                hint: "",
                                value: INDcoil.con07,
                                height: 40,
                                width: 300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  // if (INDcoil.iscon01.length == 18) {}

                                  INDcoilContexttable.read<INDcoilDataSetBloc>()
                                      .add(UpdateDataPressed());
                                  onLoadingType01(
                                      INDcoilContexttable, () {}, () {});
                                },
                                // style: ButtonStyle(
                                //   backgroundColor:
                                //       MaterialStateProperty.all(Colors.red),
                                // ),
                                child: const Text("UPDATE"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

void INDcoilSEEConsoleBox() {
  showDialog(
    context: INDcoilContexttable,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return INDcoilSEEconSTfullBody();
    },
  );
}

class INDcoilSEEconSTfullBody extends StatelessWidget {
  /// {@macro counter_page}
  const INDcoilSEEconSTfullBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INDgetACDataSetBloc(),
        child: BlocBuilder<INDgetACDataSetBloc, List<dataset>>(
          builder: (context, data) {
            return INDcoilSEEconSTfull(
              data: data,
            );
          },
        ));
  }
}

class INDcoilSEEconSTfull extends StatefulWidget {
  INDcoilSEEconSTfull({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  State<INDcoilSEEconSTfull> createState() => _INDcoilSEEconSTfullState();
}

class _INDcoilSEEconSTfullState extends State<INDcoilSEEconSTfull> {
  @override
  void initState() {
    super.initState();
    context.read<INDgetACDataSetBloc>().add(GetDataPressedX());
  }

  @override
  Widget build(BuildContext context) {
    List<dataset> _data = widget.data ?? [];
    print(_data);
    return SizedBox(
      // color: Colors.blue,
      child: Dialog(
        child: Container(
          height: 200,
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Container(
                height: 200,
                width: 400,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < _data.length; i++)
                      _BOXsow(
                        data1: _data[i].f02,
                        data2: _data[i].f06,
                        data3: _data[i].f03,
                        data4: _data[i].f05,
                        data5: _data[i].f04,
                        data6: _data[i].f07,
                      )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

// data1: _data[i].f02,
//                 data2: _data[i].f06,
//                 data3: _data[i].f03,
//                 data4: _data[i].f05,
//                 data5: _data[i].f04,

class _BOXsow extends StatelessWidget {
  _BOXsow({
    Key? key,
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
    this.data6,
  }) : super(key: key);

  String? data1;
  String? data2;
  String? data3;
  String? data4;
  String? data5;
  String? data6;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 40),
        child: Column(
          children: [
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // height: 40,
                  child: Text(
                    "COIL NAME-: ${data1 ?? ''}",
                    style: const TxtStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // height: 40,
                  child: Text(
                    "COIL NO------: ${data2 ?? ''}",
                    style: const TxtStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // height: 40,
                  child: Text(
                    "CONDITION-: ${data3 ?? ''}",
                    style: const TxtStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // height: 40,
                  child: Text(
                    "MAX CAP----: ${data4 ?? ''}",
                    style: const TxtStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  // height: 40,
                  child: Text(
                    "ACTUAL------: ${data5 ?? ''}",
                    style: const TxtStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // height: 40,
                  child: Text(
                    "STATUS-------: ${data6 ?? ''}",
                    style: const TxtStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//COIL NAME : 
//COIL NO   : 
//CONDITION : 
//MAX CAP   : 
//ACTUAL    : 
//STATUS    : 