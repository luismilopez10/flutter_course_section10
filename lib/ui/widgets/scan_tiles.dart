import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:seccion10_fluttercourse/providers/scan_list_provider.dart';

import '../../utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (BuildContext _, int index) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScanById(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(
              this.tipo == 'http' ? Icons.home_outlined : Icons.map_outlined),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => launchURL(context, scans[index]),
        ),
      ),
    );
  }
}
