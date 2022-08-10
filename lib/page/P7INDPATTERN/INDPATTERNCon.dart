import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/07-INDpattern.dart';
import '../../data/global.dart';
import '../../styles/TextStyle.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Easydropdown.dart';
import '../../widget/common/Loading.dart';
import 'INDPATTERNTable.dart';
import 'INDPATTERNVar.dart';

void INDpatternConsoleBox() {
  showDialog(
    context: INDpatternContexttable,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return INDpatternconSTfull();
    },
  );
}

class INDpatternconSTfull extends StatefulWidget {
  const INDpatternconSTfull({Key? key}) : super(key: key);

  @override
  State<INDpatternconSTfull> createState() => _INDpatternconSTfullState();
}

class _INDpatternconSTfullState extends State<INDpatternconSTfull> {
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
                              isEnabled: INDpattern.nc,
                              sLabel: "PATTERN",
                              height: 40,
                              width: 300,
                              isContr: INDpattern.iscon01,
                              fnContr: (input) {
                                INDpattern.iscon01 = input;
                              },
                              sValue: INDpattern.con02,
                              returnfunc: (String s) {
                                INDpattern.con02 = s;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ComInputText(
                              sLabel: "VOLT",
                              height: 40,
                              width: 300,
                              isContr: INDpattern.iscon01,
                              fnContr: (input) {
                                INDpattern.iscon01 = input;
                              },
                              sValue: INDpattern.con03,
                              returnfunc: (String s) {
                                INDpattern.con03 = s;
                              },
                            ),
                            ComInputText(
                              sLabel: "POWER",
                              height: 40,
                              width: 300,
                              isContr: INDpattern.iscon01,
                              fnContr: (input) {
                                INDpattern.iscon01 = input;
                              },
                              sValue: INDpattern.con04,
                              returnfunc: (String s) {
                                INDpattern.con04 = s;
                              },
                            ),
                            ComInputText(
                              sLabel: "TIME",
                              height: 40,
                              width: 300,
                              isContr: INDpattern.iscon01,
                              fnContr: (input) {
                                INDpattern.iscon01 = input;
                              },
                              sValue: INDpattern.con05,
                              returnfunc: (String s) {
                                INDpattern.con05 = s;
                              },
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
                                  // if (INDpattern.iscon01.length == 18) {}

                                  INDpatternContexttable.read<
                                          INDpatternDataSetBloc>()
                                      .add(UpdateDataPressed());
                                  onLoadingType01(
                                      INDpatternContexttable, () {}, () {});
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
