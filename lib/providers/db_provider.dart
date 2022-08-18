import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seccion10_fluttercourse/models/models.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    // Path donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    /**
     * El path en el pc es:
     * C:\Users\luis.lopez\AppData\Local\Google\AndroidStudio2021.2\device-explorer\Pixel_3_API_30 [emulator-5554]\data\data\com.example.seccion10_fluttercourse\app_flutter
     */
    final path = join(documentsDirectory.path, 'ScansDB.db');

    //Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
        ''');
      },
    );
  }

  Future<int> createScanRaw(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id,tipo,valor)
      VALUES (${nuevoScan.id},'${nuevoScan.tipo}','${nuevoScan.valor}')      
      ''');

    return res;
  }

  Future<int> createScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());

    return res;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<List<ScanModel>> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id=?', whereArgs: [id]);

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<List<ScanModel>> getScanByTipo(String tipo) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipo=?', whereArgs: [tipo]);
    // Otra forma:
    // final res = await db.rawQuery('''
    //   SELECT * FROM Scans WHERE tipo = '$tipo'
    // ''');

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel scanUpdated) async {
    final db = await database;
    final res = await db.update('Scans', scanUpdated.toJson(),
        where: 'id=?', whereArgs: [scanUpdated.id]);

    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');
    // Otra forma:
    // final res = await db.rawQuery('''
    //   DELETE FROM Scans
    // ''');

    return res;
  }

  Future<int> deleteScanById(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?', whereArgs: [id]);

    return res;
  }
}
