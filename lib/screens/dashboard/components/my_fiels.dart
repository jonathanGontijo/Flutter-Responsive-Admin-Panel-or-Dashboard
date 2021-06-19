import 'package:admin/models/MyFiles.dart';
import 'package:admin/provider/chamados_provider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:admin/screens/dashboard/components/chamados_formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/screens/dashboard/components/chamados.dart';
import '../../../constants.dart';
import 'file_info_card.dart';



class MyFiels extends StatelessWidget {
  const MyFiels({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ChamadosProviders Chamados = Provider.of(context);

    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Meus Arquivos",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM
                );
              },
              icon: Icon(Icons.add),
              label: Text("Novo Chamado"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiels[index]),
    );
  }
}
