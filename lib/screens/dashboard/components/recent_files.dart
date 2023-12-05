import 'package:admin/models/RecentFile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  DataTableSource dataTableSource = DataTableUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: PaginatedDataTable(
              showFirstLastButtons: true,
              headingRowColor: MaterialStateProperty.all(kPrimaryColor),
              arrowHeadColor: Colors.white,
              columnSpacing: defaultPadding,
              paginationInfoTextStyle: TextStyle(color: Colors.white),
              // minWidth: 600,
              columns: [
                DataColumn(label: Text("#"),),
                DataColumn(label: Text("Name"),),
                DataColumn(label: Text("Login"),),
                DataColumn(label: Text("Email"),),
                DataColumn(label: Text("Matricule"),),
                DataColumn(label: Text("Validé"),),
                DataColumn(label: Text("Verifié"),),
                DataColumn(label: Text("Type"),),
                DataColumn(label: Text("Active"),),
                DataColumn(label: Text("Anonyme"),),
                DataColumn(label: Text("Appareil"),),
                DataColumn(label: Text("Date de creation"),),
              ],
              source: dataTableSource,
            ),
          )
        ],
      ),
    );
  }
}


class DataTableUser extends DataTableSource {

  final List<Map<String, dynamic>> _data = List.generate(200,
          (index) => {
            "#": index,
            "name": "Name $index",
            "login": "Login $index",
            "email": "Email $index",
            "matricule": "Matricule $index",
            "valid": index % 2 == 0,
            "verified": index % 2 == 0,
            "type": (index % 2 == 0)? "Association": "ONG",
            "active": index % 2 == 0,
            "anonymous": index % 2 != 0,
            "deviceType": (index % 2 == 0)? "Android":  "iOS",
            "creationDate": (index % 2 == 0)? "2009-12-09":"1998-01-23"
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['#'].toString())),
      DataCell(Text(_data[index]['name'].toString())),
      DataCell(Text(_data[index]['login'].toString())),
      DataCell(Text(_data[index]['email'].toString())),
      DataCell(Text(_data[index]['matricule'].toString())),
      DataCell(Text(_data[index]['valid'].toString())),
      DataCell(Text(_data[index]['verified'].toString())),
      DataCell(Text(_data[index]['type'].toString())),
      DataCell(Text(_data[index]['active'].toString())),
      DataCell(Text(_data[index]['anonymous'].toString())),
      DataCell(Text(_data[index]['deviceType'].toString())),
      DataCell(Text(_data[index]['creationDate'].toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}


/*
SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("File Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Size"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index]),
              ),
            ),
          ),
 */