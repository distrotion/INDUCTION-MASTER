import 'package:INDUCTION_MASTER/widget/common/ComInputText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-JGCreportEachPO.dart';
import '../../bloc/cubit/Rebuild.dart';
import '../../data/global.dart';
import '../../styles/TextStyle.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/popup.dart';
import 'JGCreportEachPOVAR.dart';
import 'piechart2_E.dart';

late BuildContext JGCreportEachPOMAINcontext;

class JGCreportEachPOMAIN extends StatelessWidget {
  JGCreportEachPOMAIN({Key? key, this.data}) : super(key: key);
  datainEachPO? data;

  @override
  Widget build(BuildContext context) {
    Pagememory = 5;

    JGCreportEachPOMAINcontext = context;
    if (data!.STATUS == 'OK') {
      JGCreportEachPOVAR.POsum = data!.PO;
      JGCreportEachPOVAR.ALL_AUTOsum = data!.ALL_AUTO;
      JGCreportEachPOVAR.OKsum = data!.OK;
      JGCreportEachPOVAR.WNGsum = data!.WNG;
      JGCreportEachPOVAR.NGsum = data!.NG;
      JGCreportEachPOVAR.AENGsum = data!.AENG;
      data!.STATUS = '';
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
                                          select: JGCreportEachPOVAR.GOODbutton,
                                          selectfn: (b) {
                                            JGCreportEachPOVAR.GOODbutton = b;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage();
                                          },
                                          tabCOLOR: Colors.green,
                                        ),
                                        _selectBUTTON(
                                          //
                                          text: "WNG",
                                          select: JGCreportEachPOVAR.WNGbutton,
                                          selectfn: (b) {
                                            JGCreportEachPOVAR.WNGbutton = b;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage();
                                          },
                                          tabCOLOR: Colors.red.shade200,
                                        ),
                                        _selectBUTTON(
                                          //
                                          text: "NG",
                                          select: JGCreportEachPOVAR.NGbutton,
                                          selectfn: (b) {
                                            JGCreportEachPOVAR.NGbutton = b;
                                            BlocProvider.of<BlocPageRebuild>(
                                                    context)
                                                .rebuildPage();
                                          },
                                          tabCOLOR: Colors.red.shade500,
                                        ),
                                        _selectBUTTON(
                                          //
                                          text: "AENG",
                                          select: JGCreportEachPOVAR.AENGbutton,
                                          selectfn: (b) {
                                            JGCreportEachPOVAR.AENGbutton = b;
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
                                    datainput1: JGCreportEachPOVAR.GOODbutton
                                        ? JGCreportEachPOVAR.OKsum
                                        : 0,
                                    datainput2: JGCreportEachPOVAR.WNGbutton
                                        ? JGCreportEachPOVAR.WNGsum
                                        : 0,
                                    datainput3: JGCreportEachPOVAR.NGbutton
                                        ? JGCreportEachPOVAR.NGsum
                                        : 0,
                                    datainput4: JGCreportEachPOVAR.AENGbutton
                                        ? JGCreportEachPOVAR.AENGsum
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
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 85,
                                      child: SizedBox(
                                        height: 40,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  top: 2),
                                          child: ComInputText(
                                            nLimitedChar: 24,
                                            returnfunc: (v) {
                                              JGCreportEachPOVAR.PO = v;
                                              // print(JGCreportEachPOVAR.PO);
                                            },
                                            sValue: JGCreportEachPOVAR.PO,
                                            isContr:
                                                JGCreportEachPOVAR.isControl,
                                            fnContr: (v) {
                                              JGCreportEachPOVAR.isControl = v;
                                            },
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 15,
                                    child: InkWell(
                                      onTap: () {
                                        if (JGCreportEachPOVAR.PO != '') {
                                          context
                                              .read<JGCreportEachPO_Bloc>()
                                              .add(JGCreportEachPO_READ());
                                        } else {}
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 5, end: 2),
                                        child: Container(
                                          height: 34,
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
                              // color: Colors.blue,
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
                                  JGCreportEachPOVAR.POsum,
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
                                  data: JGCreportEachPOVAR.ALL_AUTOsum
                                      .toString()),
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
                                  data: JGCreportEachPOVAR.OKsum.toString()),
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
                                  data: JGCreportEachPOVAR.WNGsum.toString()),
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
                                  data: JGCreportEachPOVAR.NGsum.toString()),
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
                                  data: JGCreportEachPOVAR.AENGsum.toString()),
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
