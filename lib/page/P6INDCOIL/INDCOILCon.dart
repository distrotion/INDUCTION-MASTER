import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-INDcoil.dart';
import '../../data/global.dart';
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
          height: 500,
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Container(
                height: 500,
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
