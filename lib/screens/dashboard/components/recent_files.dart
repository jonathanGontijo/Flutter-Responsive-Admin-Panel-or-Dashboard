import 'package:admin/data/dummy_cadastro.dart';
import 'package:admin/models/RecentFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const Chamados = {...DUMMY_CADASTRO};

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),

     /*child: ListView.builder(
        itemCount: Chamados.length,
        itemBuilder: (context, i) => Text(Chamados.values.elementAt(i).nome),
        children: [
          Text(
            "Arquivos recentes",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          /*SizedBox(
            width: double.infinity,
              child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text("Nome"),
                ),
                DataColumn(
                  label: Text("Data"),
                ),
                DataColumn(
                  label: Text("Status"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index]),
              ),
            ),
          ),*/
        ],
      ),*/
    );
  }
}

/*DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date)),
      DataCell(Text(fileInfo.size)),
    ],
  );
}*/
