import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:seccion10_fluttercourse/models/models.dart';
import 'package:seccion10_fluttercourse/providers/db_provider.dart';
import 'package:seccion10_fluttercourse/providers/scan_list_provider.dart';

import 'package:seccion10_fluttercourse/providers/ui_provider.dart';
import 'package:seccion10_fluttercourse/ui/pages/direcciones_page.dart';
import 'package:seccion10_fluttercourse/ui/pages/historial_mapas_page.dart';
import 'package:seccion10_fluttercourse/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteAllScans();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.getScansByTipo('geo');
        return HistorialMapasPage();
      case 1:
        scanListProvider.getScansByTipo('http');
        return DireccionesPage();
      default:
        return HistorialMapasPage();
    }
  }
}
