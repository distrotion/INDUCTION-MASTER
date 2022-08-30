import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-1-INDcoil.dart';
import '../../bloc/BlocEvent/06-2-INDcoilDROPDOWN.dart';
import '../../bloc/Cubit/Rebuild.dart';
import '../../data/global.dart';
import '../../data/model.dart';
import '../../widget/common/Loading.dart';
import 'INDCOILCon.dart';
import 'INDCOILVar.dart';

String _searchResult = '';
late BuildContext INDcoilContexttable;

class INDcoilDataTable extends StatefulWidget {
  INDcoilDataTable({Key? key, this.data, this.dropdown}) : super(key: key);
  List<dataset>? data;
  List<MapEntry<String, String>>? dropdown;

  @override
  _INDcoilDataTableState createState() => _INDcoilDataTableState();
}

class _INDcoilDataTableState extends State<INDcoilDataTable> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();

    context.read<INDcoilDataSetBloc>().add(GetDataPressed());
    context.read<INDcoilDROPDOWNDataSetBloc>().add(GetDataDropdown());
    //INDcoilDROPDOWNDataSetBloc
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    INDcoilContexttable = context;
    final _MyData _data =
        _MyData(context, widget.data ?? [], widget.dropdown ?? []);

    void _sort<T>(Comparable<T> Function(dataset d) getField, int columnIndex,
        bool ascending) {
      _data._sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

    return SingleChildScrollView(
      child: SizedBox(
        width: 1200,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        _searchResult = value;
                      });
                    }),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      _searchResult = '';
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 1200,
                child: PaginatedDataTable(
                  source: _data,
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('INDcoil'),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // context
                              //     .read<INDcoilDataSetBloc>()
                              //     .add(GetDataPressed());

                              onLoadingType01(
                                  context,
                                  () {},
                                  context
                                      .read<INDcoilDataSetBloc>()
                                      .add(GetDataPressed()));
                              // BlocProvider.of<BlocPageRebuild>(context)
                              //     .rebuildPage();
                            },
                            child: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              INDcoil.nc = true;
                              INDcoil.iscon01 = true;
                              INDcoil.con01 = '';
                              INDcoil.con02 = '';
                              INDcoil.con03 = '';
                              INDcoil.con04 = '';
                              INDcoil.con05 = '';
                              INDcoil.con06 = '';
                              INDcoil.con07 = '';
                              INDcoil.dropdown = widget.dropdown ?? [];

                              INDcoilConsoleBox();
                            },
                            // style: ButtonStyle(
                            //   backgroundColor:
                            //       MaterialStateProperty.all(Colors.red),
                            // ),

                            child: const Text("NEW"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  columns: [
                    // DataColumn(
                    //     label: const Text('ID'),
                    //     onSort: (int columnIndex, bool ascending) => _sort<num>(
                    //         (dataset d) => d.id, columnIndex, ascending)),
                    DataColumn(
                        label: const Text('COIL NAME'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f02, columnIndex, ascending)),
                    DataColumn(
                        label: const Text('COIL NO'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f06, columnIndex, ascending)),
                    DataColumn(
                        label: const Text('PATTERN'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f03, columnIndex, ascending)),
                    DataColumn(
                        label: const Text('LIMIT'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f05, columnIndex, ascending)),
                    // DataColumn(
                    //     label: const Text('COUNT'),
                    //     onSort: (int columnIndex, bool ascending) =>
                    //         _sort<String>(
                    //             (dataset d) => d.f04, columnIndex, ascending)),
                    DataColumn(
                        label: const Text('STATUS'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f07, columnIndex, ascending)),

                    DataColumn(
                        label: const Text('ACTION'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f05, columnIndex, ascending)),
                  ],
                  columnSpacing: 100,
                  horizontalMargin: 10,
                  rowsPerPage: 5,
                  sortColumnIndex: _sortColumnIndex,
                  sortAscending: _sortAscending,
                  showCheckboxColumn: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// The "soruce" of the table
class _MyData extends DataTableSource {
  // Generate some made-up data
  final BuildContext context;
  late List<dataset> _data;
  late List<dataset> input;
  late List<MapEntry<String, String>>? dropdown;
  List<dataset> _data_exp = [];

  int _selectedCount = 0;
  _MyData.empty(this.context) {
    _data = [];
  }
  _MyData(this.context, this.input, this.dropdown) {
    _data = input;
    _data_exp = [];

    for (int i = 0; i < _data.length; i++) {
      if (_data[i].f02.toLowerCase().contains(_searchResult) ||
          _data[i].f03.toLowerCase().contains(_searchResult) ||
          _data[i].f04.toLowerCase().contains(_searchResult)) {
        _data_exp.add(_data[i]);
      }
    }
  }

  void _sort<T>(Comparable<T> Function(dataset d) getField, bool ascending) {
    _data_exp.sort((dataset a, dataset b) {
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data_exp.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final dataset data = _data_exp[index];

    return DataRow.byIndex(
        index: index,
        selected: data.selected,
        onSelectChanged: (value) {
          if (data.selected != value) {
            //function
          }
        },
        cells: [
          // DataCell(Text(data.id.toString())),
          DataCell(Text(data.f02)),
          DataCell(Text(data.f06)),
          DataCell(Text(data.f03)),
          DataCell(Text(data.f05)),
          // DataCell(Text(data.f04)),
          DataCell(Text(data.f07)),
          // DataCell(Text(data.f04)),
          DataCell(Row(
            children: [
              InkWell(
                onTap: () {
                  INDcoil.Snc = false;
                  INDcoil.Scon01 = data.f01;
                  // INDcoil.Scon02 = data.f02;
                  // INDcoil.Scon03 = data.f03;
                  // INDcoil.con04 = data.f04;
                  // INDcoil.Scon05 = data.f05;
                  // INDcoil.Scon06 = data.f06;
                  // INDcoil.Scon07 = data.f07;
                  INDcoilSEEConsoleBox();
                  // print(data.f01);
                },
                child: SizedBox(
                  child: Icon(Icons.assessment_rounded),
                ),
              ),
              InkWell(
                onTap: () {
                  INDcoil.nc = false;
                  INDcoil.con01 = data.f01;
                  INDcoil.con02 = data.f02;
                  INDcoil.con03 = data.f03;
                  // INDcoil.con04 = data.f04;
                  INDcoil.con05 = data.f05;
                  INDcoil.con06 = data.f06;
                  INDcoil.con07 = data.f07;
                  INDcoil.dropdown = dropdown ?? [];
                  INDcoilConsoleBox();
                  // print(data.f01);
                },
                child: const Icon(
                  Icons.edit,
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     print(data.f02);
              //   },
              //   child: const Icon(
              //     Icons.delete,
              //   ),
              // )
            ],
          )),
        ]);
  }
}
