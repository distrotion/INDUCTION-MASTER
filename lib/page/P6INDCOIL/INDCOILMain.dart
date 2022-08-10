import 'package:flutter/material.dart';

import '../../data/model.dart';
import 'INDCOILTable.dart';

class INDcoilMain extends StatelessWidget {
  INDcoilMain({Key? key, this.data, this.dropdown}) : super(key: key);
  List<dataset>? data;
  List<MapEntry<String, String>>? dropdown;
  @override
  Widget build(BuildContext context) {
    // print('INDcoilMain-->${data}');
    return Center(
      child: INDcoilDataTable(
        data: data,
        dropdown: dropdown,
      ),
    );
  }
}
