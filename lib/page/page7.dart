import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/07-INDpattern.dart';
import '../data/model.dart';
import 'P7INDPATTERN/INDPATTERNMain.dart';
import 'page0.dart';
import '../data/global.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7BlocTableBody();
  }
}

class Page7BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page7BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INDpatternDataSetBloc(),
        child: BlocBuilder<INDpatternDataSetBloc, List<dataset>>(
          builder: (context, data) {
            return Page7Body(
              data: data,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({
    Key? key,
    this.data,
  }) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: INDpatternMain(
        data: data,
      ),
    );
  }
}
