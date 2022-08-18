import 'package:flutter/material.dart';

import 'package:seccion10_fluttercourse/models/models.dart';
import 'package:seccion10_fluttercourse/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> createScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.createScan(nuevoScan);
    // Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  getAllScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  getScansByTipo(String tipo) async {
    final scans = await DBProvider.db.getScanByTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScanById(id);
  }
}
