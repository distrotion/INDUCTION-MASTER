import 'package:flutter/material.dart';

import '../../data/model.dart';
import 'INDPATTERNTable.dart';

class INDpatternMain extends StatelessWidget {
  INDpatternMain({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    // print('INDpatternMain-->${data}');
    return Center(
      child: INDpatternDataTable(
        data: data,
      ),
    );
  }
}
