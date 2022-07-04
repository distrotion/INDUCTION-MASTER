import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-JGCreport.dart';
import '../../bloc/cubit/Rebuild.dart';
import '../../data/global.dart';
import '../../styles/TextStyle.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/popup.dart';
import 'JGCreportVAR.dart';
import 'piechart2.dart';

late BuildContext JGCreportMAINcontext;

class JGCreportMAIN extends StatelessWidget {
  JGCreportMAIN({Key? key, this.data}) : super(key: key);
  datain? data;

  @override
  Widget build(BuildContext context) {
    Pagememory = 2;
    // print(data!.STATUS);
    JGCreportMAINcontext = context;
    if (data!.STATUS == 'OK') {
      JGCreportVAR.DATEsum = data!.DATE;
      JGCreportVAR.ALL_AUTOsum = data!.ALL_AUTO;
      JGCreportVAR.OKsum = data!.OK;
      JGCreportVAR.WNGsum = data!.WNG;
      JGCreportVAR.NGsum = data!.NG;
      JGCreportVAR.AENGsum = data!.AENG;
      data!.STATUS = '';
      print("------>");
      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              width: 1000,
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 40,
            child: SizedBox(
              width: 1000,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 500,
                      width: 500,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 45,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Column(
                                      children: [
                                        _selectBUTTON(
                                          //
                                          text: "OK",
                                          select: JGCreportVAR.GOODbutton,
                                          selectfn: (b) {
                                            JGCreportVAR.GOODbutton = b;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage();
                                          },
                                          tabCOLOR: Colors.green,
                                        ),
                                        _selectBUTTON(
                                          //
                                          text: "WNG",
                                          select: JGCreportVAR.WNGbutton,
                                          selectfn: (b) {
                                            JGCreportVAR.WNGbutton = b;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage();
                                          },
                                          tabCOLOR: Colors.red.shade200,
                                        ),
                                        _selectBUTTON(
                                          //
                                          text: "NG",
                                          select: JGCreportVAR.NGbutton,
                                          selectfn: (b) {
                                            JGCreportVAR.NGbutton = b;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage();
                                          },
                                          tabCOLOR: Colors.red.shade500,
                                        ),
                                        _selectBUTTON(
                                          //
                                          text: "AENG",
                                          select: JGCreportVAR.AENGbutton,
                                          selectfn: (b) {
                                            JGCreportVAR.AENGbutton = b;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage();
                                          },
                                          tabCOLOR: Colors.red.shade800,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 35,
                                  child: PieChart2(
                                    datainput1: JGCreportVAR.GOODbutton
                                        ? JGCreportVAR.OKsum
                                        : 0,
                                    datainput2: JGCreportVAR.WNGbutton
                                        ? JGCreportVAR.WNGsum
                                        : 0,
                                    datainput3: JGCreportVAR.NGbutton
                                        ? JGCreportVAR.NGsum
                                        : 0,
                                    datainput4: JGCreportVAR.AENGbutton
                                        ? JGCreportVAR.AENGsum
                                        : 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 100,
                              width: 1000,
                              // color: Colors.blue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Expanded(
                                    flex: 5,
                                    child: Center(
                                      child: Text(
                                        "START",
                                        style: TxtStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 20,
                                    child: SizedBox(
                                      height: 40,
                                      // width: 91,
                                      child: InkWell(
                                          onTap: () {
                                            CalendaSelectDate(
                                                context, DateTime.now(), (v) {
                                              JGCreportVAR.startDATE = v;
                                              JGCreportVAR.startDATElist =
                                                  v.split('-');

                                              if (JGCreportVAR
                                                  .startDATElist.isNotEmpty) {
                                                JGCreportVAR.startDATEout.year =
                                                    JGCreportVAR
                                                        .startDATElist[0];
                                                JGCreportVAR
                                                        .startDATEout.month =
                                                    JGCreportVAR
                                                        .startDATElist[1];
                                                JGCreportVAR.startDATEout.day =
                                                    JGCreportVAR
                                                        .startDATElist[2];
                                              }

                                              BlocProvider.of<BlocPageRebuild>(
                                                      context)
                                                  .rebuildPage();
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              // color: Color(0x00b23127),
                                              // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                                              // image: DecorationImage(
                                              //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                                              //   fit: BoxFit.fitWidth,
                                              // ),
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                              ),
                                            ),
                                            height: 40,
                                            width: 500,
                                            child: Center(
                                              child:
                                                  Text(JGCreportVAR.startDATE),
                                            ),
                                          )),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 5,
                                    child: Center(
                                      child: Text(
                                        "END",
                                        style: TxtStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 20,
                                    child: SizedBox(
                                      height: 40,
                                      width: 91,
                                      child: InkWell(
                                          onTap: () {
                                            CalendaSelectDate(
                                                context, DateTime.now(), (v) {
                                              JGCreportVAR.endDATE = v;

                                              JGCreportVAR.endDATElist =
                                                  v.split('-');
                                              if (JGCreportVAR
                                                  .endDATElist.isNotEmpty) {
                                                JGCreportVAR.endDATEout.year =
                                                    JGCreportVAR.endDATElist[0];
                                                JGCreportVAR.endDATEout.month =
                                                    JGCreportVAR.endDATElist[1];
                                                JGCreportVAR.endDATEout.day =
                                                    JGCreportVAR.endDATElist[2];
                                              }

                                              BlocProvider.of<BlocPageRebuild>(
                                                      context)
                                                  .rebuildPage();
                                              // .split(' ')
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              // color: Color(0x00b23127),
                                              // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                                              // image: DecorationImage(
                                              //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                                              //   fit: BoxFit.fitWidth,
                                              // ),
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                              ),
                                            ),
                                            height: 40,
                                            width: 500,
                                            child: Center(
                                              child: Text(JGCreportVAR.endDATE),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: InkWell(
                                      onTap: () {
                                        if (JGCreportVAR
                                                .startDATElist.isNotEmpty &&
                                            JGCreportVAR
                                                .endDATElist.isNotEmpty) {
                                          context
                                              .read<JGCreportGET_Bloc>()
                                              .add(JGCreportGET_BTWdate());
                                        } else {
                                          WORNINGpop(context,
                                              ["Please select date"], 100, 300);
                                        }
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 5, end: 2),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 35, 10, 56),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: BoxDecoration(
                        // color: Color(0x00b23127),
                        // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                        // image: DecorationImage(
                        //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                        //   fit: BoxFit.fitWidth,
                        // ),
                        border: Border.all(color: Colors.black),
                        // borderRadius:
                        //     const BorderRadius.only(
                        //   topLeft: Radius.circular(8.0),
                        //   topRight: Radius.circular(8.0),
                        //   bottomLeft:
                        //       Radius.circular(8.0),
                        //   bottomRight:
                        //       Radius.circular(8.0),
                        // ),
                      ),
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 500,
                              color: const Color.fromARGB(255, 4, 71, 126),
                              child: const Center(
                                child: Text(
                                  "DATA ",
                                  style: TxtStyle(
                                      color: Colors.white, fontSize: 35),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 500,
                              color: const Color.fromARGB(255, 4, 71, 126),
                              child: Center(
                                child: Text(
                                  JGCreportVAR.DATEsum,
                                  style: const TxtStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 500,
                              color: Colors.blue,
                              child: _datainside(
                                  text: "ALL",
                                  data: JGCreportVAR.ALL_AUTOsum.toString()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 500,
                              color: Colors.green,
                              child: _datainside(
                                  text: "OK",
                                  data: JGCreportVAR.OKsum.toString()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 500,
                              color: Colors.red.shade200,
                              child: _datainside(
                                  text: "WNG",
                                  data: JGCreportVAR.WNGsum.toString()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 500,
                              color: Colors.red.shade500,
                              child: _datainside(
                                  text: "NG",
                                  data: JGCreportVAR.NGsum.toString()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 500,
                              color: Colors.red.shade800,
                              child: _datainside(
                                  text: "AENG",
                                  data: JGCreportVAR.AENGsum.toString()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _selectBUTTON extends StatelessWidget {
  _selectBUTTON({
    Key? key,
    this.select,
    this.selectfn,
    this.tabCOLOR,
    this.text,
  }) : super(key: key);
  bool? select;
  Function(bool)? selectfn;
  Color? tabCOLOR;
  String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bool dataout = false;
        if (select ?? false) {
          select = false;
          dataout = false;
        } else {
          select = true;
          dataout = true;
        }
        selectfn!(dataout);
      },
      child: Container(
        decoration: BoxDecoration(
          // color: Color(0x00b23127),
          color: select ?? false ? tabCOLOR ?? Colors.black : Colors.white,

          // image: DecorationImage(
          //   image: AssetImage("assets/icons/groupNEW@3x.png"),
          //   fit: BoxFit.fitWidth,
          // ),
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
        ),
        height: 40,
        width: 500,
        child: Center(
          child: Text(text ?? "",
              style: TxtStyle(
                  color: select ?? false ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}

class _datainside extends StatelessWidget {
  _datainside({
    Key? key,
    this.text,
    this.data,
  }) : super(key: key);
  String? text;
  String? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 30,
          child: Center(
            child: Text(
              text ?? "",
              style: TxtStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // color: Colors.white,
            child: const Text(
              ":",
              style: TxtStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        Expanded(
          flex: 60,
          child: Center(
            child: Text(
              data ?? "",
              style: const TxtStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }
}
