import 'package:admin/controllers/MenuController.dart';
import 'package:admin/data/dummy_cadastro.dart';
import 'package:admin/provider/chamados_provider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/chamados_tile.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ChamadosProviders Chamados = Provider.of(context);

    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            //if (Responsive.isDesktop(context))
              Expanded(
                flex: 3,
                // and it takes 1/6 part of the screen
                child: DashboardScreen(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex:2,
              child: ListView.builder(
                itemCount: Chamados.count,
                itemBuilder: (context, i) => ChamadosTile(Chamados.byIndex(i)),
              )
            ),
          ],
        ),
      ),
    );
  }
}
