import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dailoz_page/dailoz_home/dailoz_home.dart';
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;
  DatabaseHelper._internal();
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'yatogami11.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE yatosm (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        thu TEXT,
        ngay TEXT,
        cd_sang INTEGER,
        cd_toi INTEGER,
        don_thuong INTEGER,
        tong_chuyen INTEGER,
        tong_diem NUMERIC,
        doanh_thungay TEXT,
        vuot_chuyen TEXT,
        db_thunhap TEXT,
        diem_tuan INTEGER,
        du_gio INTEGER,
        ca_dangki TEXT,
        gio_themdulieu TEXT,
        thoigian_hd TEXT,
        solansac_pin TEXT,
        thoigian_sac TEXT,
        tilenhanchuyen TEXT,
        tilehuychuyen TEXT,
        tilehoanthanhchuyen TEXT,
        yatagami7 TEXT,
        yatagami8 TEXT,
        yatagami9 TEXT,
        yatagami10 TEXT,
        yatagami11 TEXT,
        yatagami12 TEXT,
        yatagami13 TEXT,
        yatagami14 TEXT,
        yatagami15 TEXT,
        yatagami16 TEXT
      )
    ''');










    // Tạo bảng hanoi
    await db.execute('''
    CREATE TABLE hanoi (

      h5hvuotmoc1 INTEGER,
      h5hvuotmoc2 INTEGER,
      h5hvuotmoc3 INTEGER,      
      h5hvuotmoc4 INTEGER,   


      h8hvuotmoc1 INTEGER,
      h8hvuotmoc2 INTEGER,
      h8hvuotmoc3 INTEGER,      
      h8hvuotmoc4 INTEGER,   
      
      h10hvuotmoc1 INTEGER,
      h10hvuotmoc2 INTEGER,
      h10hvuotmoc3 INTEGER, 
      h10hvuotmoc4 INTEGER,   
           
      thuongdiemtuan5h1 INTEGER,
      thuongdiemtuan5h2 INTEGER,
      thuongdiemtuan5h3 INTEGER,
      thuongdiemtuan5h4 INTEGER,
      thuongdiemtuan5h5 INTEGER,
      thuongdiemtuan5h6 INTEGER,    
      
      thuongdiemtuan8h1 INTEGER,
      thuongdiemtuan8h2 INTEGER,
      thuongdiemtuan8h3 INTEGER,
      thuongdiemtuan8h4 INTEGER,
      thuongdiemtuan8h5 INTEGER,
      thuongdiemtuan8h6 INTEGER,    
      
      thuongdiemtuan10h1 INTEGER,
      thuongdiemtuan10h2 INTEGER,
      thuongdiemtuan10h3 INTEGER,
      thuongdiemtuan10h4 INTEGER,
      thuongdiemtuan10h5 INTEGER,
      thuongdiemtuan10h6 INTEGER,    

      giocaodiem1 INTEGER,
      giocaodiem2 INTEGER,
      giocaodiem3 INTEGER,
      giocaodiem4 INTEGER,
      giocaodiem5 INTEGER,
      giocaodiem6 INTEGER,  
      testt INTEGER
    )
  ''');


// Tạo bảng miennam
    await db.execute('''
    CREATE TABLE miennam (
      h5hvuotmoc1 INTEGER,
      h5hvuotmoc2 INTEGER,
      h5hvuotmoc3 INTEGER,      
      h5hvuotmoc4 INTEGER,   
      
      h8hvuotmoc1 INTEGER,
      h8hvuotmoc2 INTEGER,
      h8hvuotmoc3 INTEGER,      
      h8hvuotmoc4 INTEGER, 
      
      h10hvuotmoc1 INTEGER,
      h10hvuotmoc2 INTEGER,
      h10hvuotmoc3 INTEGER, 
       h10hvuotmoc4 INTEGER, 
           
      thuongdiemtuan5h1 INTEGER,
      thuongdiemtuan5h2 INTEGER,
      thuongdiemtuan5h3 INTEGER,
      thuongdiemtuan5h4 INTEGER,
      thuongdiemtuan5h5 INTEGER,
      thuongdiemtuan5h6 INTEGER,    
      
      thuongdiemtuan8h1 INTEGER,
      thuongdiemtuan8h2 INTEGER,
      thuongdiemtuan8h3 INTEGER,
      thuongdiemtuan8h4 INTEGER,
      thuongdiemtuan8h5 INTEGER,
      thuongdiemtuan8h6 INTEGER,    
      
      thuongdiemtuan10h1 INTEGER,
      thuongdiemtuan10h2 INTEGER,
      thuongdiemtuan10h3 INTEGER,
      thuongdiemtuan10h4 INTEGER,
      thuongdiemtuan10h5 INTEGER,
      thuongdiemtuan10h6 INTEGER,    

      giocaodiem1 INTEGER,
      giocaodiem2 INTEGER,
      giocaodiem3 INTEGER,
      giocaodiem4 INTEGER,
      giocaodiem5 INTEGER,
      giocaodiem6 INTEGER,  
      testt INTEGER
    )
  ''');


    // Tạo bảng danang
    await db.execute('''
    CREATE TABLE danang (
      h5hvuotmoc1 INTEGER,
      h5hvuotmoc2 INTEGER,
      h5hvuotmoc3 INTEGER,      
      h5hvuotmoc4 INTEGER,   

     h8hvuotmoc1 INTEGER,
      h8hvuotmoc2 INTEGER,
      h8hvuotmoc3 INTEGER,      
       h8hvuotmoc4 INTEGER,  
      h10hvuotmoc1 INTEGER,
      h10hvuotmoc2 INTEGER,
      h10hvuotmoc3 INTEGER, 
           h10hvuotmoc4 INTEGER, 
           
      thuongdiemtuan5h1 INTEGER,
      thuongdiemtuan5h2 INTEGER,
      thuongdiemtuan5h3 INTEGER,
      thuongdiemtuan5h4 INTEGER,
      thuongdiemtuan5h5 INTEGER,
      thuongdiemtuan5h6 INTEGER,    
      
      thuongdiemtuan8h1 INTEGER,
      thuongdiemtuan8h2 INTEGER,
      thuongdiemtuan8h3 INTEGER,
      thuongdiemtuan8h4 INTEGER,
      thuongdiemtuan8h5 INTEGER,
      thuongdiemtuan8h6 INTEGER,    
      
      thuongdiemtuan10h1 INTEGER,
      thuongdiemtuan10h2 INTEGER,
      thuongdiemtuan10h3 INTEGER,
      thuongdiemtuan10h4 INTEGER,
      thuongdiemtuan10h5 INTEGER,
      thuongdiemtuan10h6 INTEGER,    

      giocaodiem1 INTEGER,
      giocaodiem2 INTEGER,
      giocaodiem3 INTEGER,
      giocaodiem4 INTEGER,
      giocaodiem5 INTEGER,
      giocaodiem6 INTEGER,  
      testt INTEGER
    )
  ''');



    await db.insert(
      'hanoi',
      {
        'h5hvuotmoc1': '14',
        'h5hvuotmoc2': '10',
        'h5hvuotmoc3': '3000',
        'h5hvuotmoc4': '5000',


        'h8hvuotmoc1': '18',
        'h8hvuotmoc2': '14',
        'h8hvuotmoc3': '5000',
        'h8hvuotmoc4': '6000',
        'h10hvuotmoc1': '22',
        'h10hvuotmoc2': '18',
        'h10hvuotmoc3': '6000',
        'h10hvuotmoc4': '8000',

      },
    );

    await db.insert(
      'hanoi',
      {
        'h5hvuotmoc1': '14',
        'h5hvuotmoc2': '10',
        'h5hvuotmoc3': '3000',
        'h5hvuotmoc4': '5000',
      },
    );


    await db.insert(
      'miennam',
      {
        'h5hvuotmoc1': '14',
        'h5hvuotmoc2': '10',
        'h5hvuotmoc3': '3000',
        'h5hvuotmoc4': '5000',


        'h8hvuotmoc1': '16',
        'h8hvuotmoc2': '14',
        'h8hvuotmoc3': '5000',
        'h8hvuotmoc4': '6000',
        'h10hvuotmoc1': '18',
        'h10hvuotmoc2': '16',
        'h10hvuotmoc3': '6000',
        'h10hvuotmoc4': '8000',

      },
    );



    await db.insert(
      'danang',
      {
        'h5hvuotmoc1': '12',
        'h5hvuotmoc2': '8',
        'h5hvuotmoc3': '3000',
        'h5hvuotmoc4': '5000',

        'h8hvuotmoc1': '14',
        'h8hvuotmoc2': '12',
        'h8hvuotmoc3': '5000',
        'h8hvuotmoc4': '6000',
        'h10hvuotmoc1': '16',
        'h10hvuotmoc2': '14',
        'h10hvuotmoc3': '6000',
        'h10hvuotmoc4': '8000',

      },
    );








    // Tạo bảng nhiemvuhn
    await db.execute('''
    CREATE TABLE nhiemvuhn (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
        ca_dangki TEXT,
        muc TEXT,
        diemthuong TEXT,
        muocthuongvnd TEXT,
        diemtrungbinh TEXT,
        yato_1 TEXT,
        yato_2 TEXT,
        yato_3 TEXT,
        yato_4 TEXT,
        yato_5 TEXT
    
    )
  ''');








    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 100 điểm tới 114 điểm',
        'muocthuongvnd': '200.000 VNĐ',
        'diemtrungbinh': '15 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );

    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 115 điểm tới 134 điểm',
        'muocthuongvnd': '250.000 VNĐ',
        'diemtrungbinh': '17 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );

    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 135 điểm trở lên',
        'muocthuongvnd': '350.000 VNĐ',
        'diemtrungbinh': '20 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 140 điểm tới 164 điểm',
        'muocthuongvnd': '450.000 VNĐ',
        'diemtrungbinh': '20 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 165 điểm tới 194 điểm',
        'muocthuongvnd': '600.000 VNĐ',
        'diemtrungbinh': '24 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 195 điểm tới 229 điểm',
        'muocthuongvnd': '800.000 VNĐ',
        'diemtrungbinh': '28 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 4',
        'diemthuong': 'Từ 230 điểm trở lên',
        'muocthuongvnd': '1.200.000 VNĐ',
        'diemtrungbinh': '33 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h4',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 150 điểm tới 179 điểm',
        'muocthuongvnd': '500.000 VNĐ',
        'diemtrungbinh': '22 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 180 điểm tới 214 điểm',
        'muocthuongvnd': '700.000 VNĐ',
        'diemtrungbinh': '26 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 215 điểm tới 259 điểm',
        'muocthuongvnd': '1.000.000 VNĐ',
        'diemtrungbinh': '31 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhn',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 4 - Idol ~',
        'diemthuong': 'Từ 260 điểm trở lên',
        'muocthuongvnd': '1.500.000 VNĐ',
        'diemtrungbinh': '38 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h4',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );











    // Tạo bảng nhiemvuhn
    await db.execute('''
    CREATE TABLE nhiemvuhcm (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
        ca_dangki TEXT,
        muc TEXT,
        diemthuong TEXT,
        muocthuongvnd TEXT,
        diemtrungbinh TEXT,
        yato_1 TEXT,
        yato_2 TEXT,
        yato_3 TEXT,
        yato_4 TEXT,
        yato_5 TEXT
    
    )
  ''');


    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 100 điểm tới 114 điểm',
        'muocthuongvnd': '200.000 VNĐ',
        'diemtrungbinh': '15 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );

    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 115 điểm tới 134 điểm',
        'muocthuongvnd': '250.000 VNĐ',
        'diemtrungbinh': '17 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );

    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 135 điểm trở lên',
        'muocthuongvnd': '350.000 VNĐ',
        'diemtrungbinh': '20 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 140 điểm tới 164 điểm',
        'muocthuongvnd': '450.000 VNĐ',
        'diemtrungbinh': '20 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 165 điểm tới 194 điểm',
        'muocthuongvnd': '600.000 VNĐ',
        'diemtrungbinh': '24 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 195 điểm trở lên',
        'muocthuongvnd': '800.000 VNĐ',
        'diemtrungbinh': '28 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );

    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 150 điểm tới 179 điểm',
        'muocthuongvnd': '500.000 VNĐ',
        'diemtrungbinh': '22 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 180 điểm tới 214 điểm',
        'muocthuongvnd': '700.000 VNĐ',
        'diemtrungbinh': '26 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvuhcm',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 215 điểm trở lên',
        'muocthuongvnd': '1.000.000 VNĐ',
        'diemtrungbinh': '31 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );






    // Tạo bảng nhiemvuhn
    await db.execute('''
    CREATE TABLE nhiemvudanang (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
        ca_dangki TEXT,
        muc TEXT,
        diemthuong TEXT,
        muocthuongvnd TEXT,
        diemtrungbinh TEXT,
        yato_1 TEXT,
        yato_2 TEXT,
        yato_3 TEXT,
        yato_4 TEXT,
        yato_5 TEXT
    
    )
  ''');

    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 100 điểm tới 114 điểm',
        'muocthuongvnd': '200.000 VNĐ',
        'diemtrungbinh': '15 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );

    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 115 điểm tới 134 điểm',
        'muocthuongvnd': '250.000 VNĐ',
        'diemtrungbinh': '17 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );

    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '5h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 135 điểm trở lên',
        'muocthuongvnd': '350.000 VNĐ',
        'diemtrungbinh': '20 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu5h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 135 điểm tới 144 điểm',
        'muocthuongvnd': '350.000 VNĐ',
        'diemtrungbinh': '20 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 145 điểm tới 159 điểm',
        'muocthuongvnd': '400.000 VNĐ',
        'diemtrungbinh': '21 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '8h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 160 điểm trở lên',
        'muocthuongvnd': '500.000 VNĐ',
        'diemtrungbinh': '23 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );

    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 1',
        'diemthuong': 'Từ 135 điểm tới 144 điểm',
        'muocthuongvnd': '350.000 VNĐ',
        'diemtrungbinh': '20 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h1',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 2',
        'diemthuong': 'Từ 145 điểm tới 159 điểm',
        'muocthuongvnd': '400.000 VNĐ',
        'diemtrungbinh': '21 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h2',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );
    await db.insert(
      'nhiemvudanang',
      {
        'ca_dangki': '10h',
        'muc': 'Mức 3',
        'diemthuong': 'Từ 160 điểm trở lên',
        'muocthuongvnd': '500.000 VNĐ',
        'diemtrungbinh': '23 điểm',
        'yato_1': 'tuan',
        'yato_2': 'nhiemvu8h3',
        'yato_3': 'chuadangki',
        'yato_4': 'test3',
        'yato_5': 'test4',
      },
    );











    // Tạo bảng yatoadmin
    await db.execute('''
    CREATE TABLE yatoadmin (
      ca_dangkiadmin TEXT,
      khuvuc TEXT,
      nhiemvutuan TEXT,
      yatogami1 TEXT,
      yatogami2 TEXT,
      yatogami3 TEXT,
      yatogami4 TEXT,
      yatogami5 TEXT,
      yatogami6 TEXT,
      yatogami7 TEXT,
      yatogami8 TEXT,
      keykichhoat TEXT
    
    )
  ''');
    await db.insert(
      'yatoadmin',
      {
        'ca_dangkiadmin': '10h',
        'keykichhoat': 'xanhsm',
        'nhiemvutuan': 'xanhsm',
        'khuvuc': 'hanoi',
      },
    );




  }


  Future<int> countNhiemVuData(String caDangKiAdmin) async {
    final db = await database;
    return Sqflite.firstIntValue(await db.rawQuery(
      'SELECT COUNT(*) FROM nhiemvuhn WHERE ca_dangki = ?',
      [caDangKiAdmin],
    )) ?? 0;
  }
  Future<void> deleteLichSuItem(int id) async {
    final db = await database;
    await db.delete(
      'yatosm',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getAllLichSu() async {
    Database db = await database;
    return await db.query('yatosm', orderBy: 'ngay DESC');
  }


    Future<Map<String, dynamic>> laydulieunhiemvuhanoi(int index) async {
      final db = await database;

      // Lấy giá trị ca_dangkiadmin từ bảng yatoadmin
      String? caDangKiAdmin = await DatabaseHelper().getCaDangKiAdmin();
      String? getCalkhuvuc = await DatabaseHelper().getCalkhuvuc();


      String tableName = '';
      if (getCalkhuvuc == 'hanoi') {
        tableName = 'nhiemvuhn'; // Tên bảng tương ứng với Hà Nội
      } else if (getCalkhuvuc == 'miennam') {
        tableName = 'nhiemvuhcm'; // Tên bảng tương ứng với Miền Nam
      } else if (getCalkhuvuc == 'danang') {
        tableName = 'nhiemvudanang'; // Tên bảng tương ứng với Đà Nẵng
      }


      List<Map<String, dynamic>> result = await db.query(
        tableName,
        where: 'ca_dangki = ?', // Lọc dữ liệu theo trường ca_dangki
        whereArgs: [caDangKiAdmin], // Giá trị ca_dangkiadmin từ bảng yatoadmin
        orderBy: 'id ASC', // Sắp xếp theo id tăng dần
        limit: 4, // Lấy 4 bản ghi gần đây nhất
        offset: index, // Bắt đầu từ vị trí chỉ định
      );

      if (result.isNotEmpty) {
        return result[0];
      } else {
        return {}; // Trả về một Map rỗng nếu không có dữ liệu
      }
    }






  Future<void> capNhatYato3(int id, String newValue) async {
    final db = await database;
    await db.update(
      'nhiemvuhn',
      {'yato_3': newValue},
      where: 'id = ?',
      whereArgs: [id],
    );
  }






  void _sortDataByDate() {
    lichSuItems.sort((a, b) => b.ngay.compareTo(a.ngay));
  }


  Future<List<Map<String, dynamic>>> getAllDataFromHanoiTable() async {
    // Mở kết nối tới cơ sở dữ liệu
    Database db = await DatabaseHelper().database;

    // Sử dụng phương thức query để lấy tất cả dữ liệu từ bảng "hanoi"
    List<Map<String, dynamic>> result = await db.query('hanoi');

    // Trả về danh sách các bản ghi từ bảng "hanoi"
    return result;
  }


  Future<List<Map<String, dynamic>>> getAllDataFromMiennamTable() async {
    // Mở kết nối tới cơ sở dữ liệu
    Database db = await DatabaseHelper().database;

    // Sử dụng phương thức query để lấy tất cả dữ liệu từ bảng "hanoi"
    List<Map<String, dynamic>> result = await db.query('miennam');

    // Trả về danh sách các bản ghi từ bảng "hanoi"
    return result;
  }


  Future<List<Map<String, dynamic>>> getAllDataFromdanangTable() async {
    // Mở kết nối tới cơ sở dữ liệu
    Database db = await DatabaseHelper().database;

    // Sử dụng phương thức query để lấy tất cả dữ liệu từ bảng "hanoi"
    List<Map<String, dynamic>> result = await db.query('danag');

    // Trả về danh sách các bản ghi từ bảng "hanoi"
    return result;
  }




  Future<Map<String, dynamic>> getRecentData(int index) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'yatosm',
      orderBy: 'gio_themdulieu DESC', // Sắp xếp theo thời gian giảm dần
      limit: 4, // Lấy 4 bản ghi gần đây nhất
      offset: index, // Bắt đầu từ vị trí chỉ định
    );

    if (result.isNotEmpty) {
      return result[0];
    } else {
      return {}; // Trả về một Map rỗng nếu không có dữ liệu
    }
  }


  Future<bool> checkDataExists(String tableName, String columnName, String value) async {
    final db = await database;
    var result = await db.query(tableName, where: '$columnName = ?', whereArgs: [value]);

    return result.isNotEmpty;
  }
  Future<int> insert(String tableName, Map<String, dynamic> data) async {
    Database db = await database;
    return await db.insert(tableName, data);
  }
  Future<String?> getCaDangKiAdmin() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('yatoadmin');
    if (result.isNotEmpty) {
      return result[0]['ca_dangkiadmin'].toString();
    }
    return null;
  }


  Future<String?> getCalkhuvuc() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('yatoadmin');
    if (result.isNotEmpty) {
      return result[0]['khuvuc'].toString();
    }
    return null;
  }

  Future<void> updateCaDangKiAdmin(String caDangKi) async {
    Database db = await database;
    await db.update(
      'yatoadmin',
      {'ca_dangkiadmin': caDangKi},
    );
  }

  Future<void> capnhapkhuvuc(String caDangKi) async {
    Database db = await database;
    await db.update(
      'yatoadmin',
      {'khuvuc': caDangKi},
    );
  }



  Future<Map<String, dynamic>> fetchCaDangKiAdmin() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('yatoadmin');
    return result.isNotEmpty ? result.first : {};
  }

  Future<int> fetchCaDangKiAdminIndex() async {
    Map<String, dynamic> result = await fetchCaDangKiAdmin();
    String caDangKiAdmin = result['ca_dangkiadmin'] ?? '5h';

    if (caDangKiAdmin == '5h') {
      return 0;
    } else if (caDangKiAdmin == '8h') {
      return 1;
    } else if (caDangKiAdmin == '10h') {
      return 2;
    } else {
      // Handle other cases if needed
      return 0; // Giá trị mặc định nếu không khớp
    }
  }

  Future<void> saveBoardInfo(String khuvuc, String caDangKi) async {
    final Database db = await database;
    await db.update(
      'yatoadmin',
      {'khuvuc': khuvuc, 'ca_dangkiadmin': caDangKi},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }





  Future<void> restoreFromBackup(String backupFilePath, Database db) async {
    try {
      // Kiểm tra xem tệp sao lưu có tồn tại không
      File backupFile = File(backupFilePath);
      if (!(await backupFile.exists())) {
        print('Không tìm thấy tệp sao lưu.');
        return;
      }

      // Đọc dữ liệu từ tệp sao lưu
      List<String> lines = await backupFile.readAsLines();

      // Xóa dữ liệu hiện có trong bảng yatosm
      await db.delete('yatosm');

      // Bắt đầu batch để chèn dữ liệu một cách hiệu quả
      var batch = db.batch();

      // Chèn dữ liệu từ tệp sao lưu vào batch
      for (String line in lines) {
        List<String> parts = line.split(':');
        if (parts.length == 2) {
          String columnName = parts[0].trim();
          String columnValue = parts[1].trim();

          // Kiểm tra giá trị null
          dynamic value = columnValue.isNotEmpty ? columnValue : null;

          // Chèn truy vấn vào batch
          batch.rawInsert(
              'INSERT INTO yatosm ($columnName) VALUES (?)', [value]);
        }
      }

      // Thực thi batch để chèn dữ liệu vào cơ sở dữ liệu
      await batch.commit();

      print('Dữ liệu đã được khôi phục từ: $backupFilePath');
    } catch (e) {
      print('Lỗi khi khôi phục dữ liệu từ backup: $e');
    }
  }










  Future<void> backupYatosmData(Database db) async {
    // Đường dẫn tuyệt đối đến thư mục yatogami
    String yatogamiPath = '/storage/emulated/0/yatogami';

    // Tạo thư mục yatogami nếu chưa tồn tại
    Directory yatogamiDirectory = Directory(yatogamiPath);
    if (!await yatogamiDirectory.exists()) {
      await yatogamiDirectory.create(recursive: true);
    }

    // Tạo tên tệp dựa trên ngày tháng năm hiện tại
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String backupFileName = '$yatogamiPath/$currentDate.db';

    // Truy vấn dữ liệu từ bảng yatosm
    List<Map<String, dynamic>> yatosmData = await db.query('yatosm');

    // Ghi dữ liệu vào tệp sao lưu
    File backupFile = File(backupFileName);
    String contents = '';
    yatosmData.forEach((row) {
      row.forEach((key, value) {
        contents += '$key: $value\n';
      });
      contents += '\n'; // Thêm dòng trống giữa các dòng dữ liệu
    });
    await backupFile.writeAsString(contents);

    print('Dữ liệu đã được sao lưu vào: $backupFileName');
  }


  Future<Map<String, dynamic>> fetchDataForWeek(DateTime startDate, DateTime endDate) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery('''
    SELECT 
      COALESCE(SUM(cd_sang), 0) as total_cd_sang,
      COALESCE(SUM(cd_toi), 0) as total_cd_toi,
      
      CASE 
       WHEN COALESCE(SUM(cd_sang) + SUM(cd_toi), 0) BETWEEN 0 AND 25 THEN 0
        WHEN COALESCE(SUM(cd_sang) + SUM(cd_toi), 0) BETWEEN 25 AND 39 THEN 60000
        WHEN COALESCE(SUM(cd_sang) + SUM(cd_toi), 0) BETWEEN 40 AND 59 THEN 120000
        ELSE 250000
      END as total_cd_sang_toi_sum,

      
      COALESCE(SUM(don_thuong), 0) as total_don_thuong,
      COALESCE(SUM(tong_chuyen), 0) as total_tong_chuyen,

COALESCE(CAST(SUM(tong_diem) AS DOUBLE), 0.0) AS total_tong_diem,


      

        COALESCE(AVG(CAST(REPLACE(thoigian_hd, '%', '') AS INTEGER)), 0) as total_thoigian_hd,
      
       COALESCE(SUM(CAST(REPLACE(doanh_thungay, '.', '') AS INTEGER)), 0) as total_doanh_thungay,
       
       
            COALESCE(SUM(CAST(REPLACE(db_thunhap, '.', '') AS INTEGER)), 0) as total_db_thunhap,
            COALESCE(SUM(CAST(REPLACE(vuot_chuyen, '.', '') AS INTEGER)), 0) as total_vuot_chuyen,
    COALESCE(SUM(CAST(REPLACE(db_thunhap, '.', '') AS INTEGER)), 0) + COALESCE(SUM(CAST(REPLACE(vuot_chuyen, '.', '') AS INTEGER)), 0) as total_sum,

 
      COALESCE(AVG(CAST(REPLACE(tilenhanchuyen, '%', '') AS INTEGER)), 0) as average_tilenhanchuyen,
      COALESCE(AVG(CAST(REPLACE(tilehoanthanhchuyen, '%', '') AS INTEGER)), 0) as average_tilehoanthanhchuyen,
      COALESCE(AVG(CAST(REPLACE(tilehuychuyen, '%', '') AS INTEGER)), 0) as average_tilehuychuyen,
      COALESCE(yatoadmin.ca_dangkiadmin, '') as ca_dangkiadmin
    FROM yatosm
    LEFT JOIN yatoadmin ON 1=1  
    WHERE 
      DATE(ngay) >= DATE('${_formatDate(startDate)}')
      AND DATE(ngay) <= DATE('${_formatDate(endDate)}')
      AND tilenhanchuyen IS NOT NULL
      AND tilehoanthanhchuyen IS NOT NULL
      AND tilehuychuyen IS NOT NULL;
  ''');

    // Format result for display



    return result.isNotEmpty ? result.first : {};
  }




  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }


  Future<int> laySoluongNhiemvu(String caDangKi) async {
    Database db = await database;
    List<Map<String, dynamic>> nhiemvu = await db.query(
      'nhiemvuhn',
      where: 'ca_dangki = ?',
      whereArgs: [caDangKi],
    );
    return nhiemvu.length;
  }

}

