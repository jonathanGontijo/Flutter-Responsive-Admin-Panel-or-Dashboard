import 'package:admin/data/dummy_cadastro.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../CustomSearchDelegate.dart';
import '../../constants.dart';
import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    const Chamados = {...DUMMY_CADASTRO};

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),

            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiels(),
                      SizedBox(height: defaultPadding),
                    ],
                ),
                ),
              ],
            )
          ],
        )

      ),
    );
  }
}
