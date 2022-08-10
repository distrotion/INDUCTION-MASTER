import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/06-INDcoil.dart';
import '../bloc/BlocEvent/06-INDcoilDROPDOWN.dart';
import '../data/model.dart';
import 'P6INDCOIL/INDCOILMain.dart';
import 'page0.dart';
import '../data/global.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6BlocTableBody();
  }
}

class Page6BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page6BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INDcoilDataSetBloc(),
        child: BlocBuilder<INDcoilDataSetBloc, List<dataset>>(
          builder: (context, data) {
            return Page6BlocDROPDOWNBody(data: data);
          },
        ));
  }
}

//INDcoilDROPDOWNDataSetBloc

class Page6BlocDROPDOWNBody extends StatelessWidget {
  /// {@macro counter_page}
  Page6BlocDROPDOWNBody({
    Key? key,
    this.data,
  }) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INDcoilDROPDOWNDataSetBloc(),
        child: BlocBuilder<INDcoilDROPDOWNDataSetBloc,
            List<MapEntry<String, String>>>(
          builder: (context, dropdown) {
            return Page6Body(
              data: data,
              dropdown: dropdown,
            );
          },
        ));
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({
    Key? key,
    this.data,
    this.dropdown,
  }) : super(key: key);
  List<dataset>? data;
  List<MapEntry<String, String>>? dropdown;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: INDcoilMain(
        data: data,
        dropdown: dropdown,
      ),
    );
  }
}
