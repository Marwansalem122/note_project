import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import"package:flutter/material.dart";
class SqlDB{

    static Database? _db;

    Future<Database?> get db async{
            if(_db!=null) {
              return _db;
            } else{
              _db=await initialDb();
              return _db;
            }
    }

   initialDb()async{
    String DBpath=await getDatabasesPath();
    String path=join(DBpath,"notes.db");
    Database myDB=await openDatabase(
      path
      ,onCreate:_oncreate,
      version:7,
      onUpgrade:_onupgrade
      );
      return myDB;
   }
   _onupgrade(Database db,int oldversion,int newversion){
            // db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
            // db.execute("ALTER TABLE notes ADD COLUMN text TEXT");
            print("Upgrade...............................");
   }
  _oncreate(Database db,int version)async{
      Batch batch=db.batch();
      batch.execute('''
          CREATE TABLE "notes"(
            "id" INTEGER PRIMARY KEY AUTOINCREMENT,
            "note" TEXT NOT NULL,
             "text" TEXT NOT NULL,
             "color" TEXT NOT NULL
          )
      ''');
      await batch.commit();
        print("Created Database..............................");
  }

  Future<List<Map>>readData(String sql)async{
     Database? mydb=await db;
     List<Map>response=await mydb!.rawQuery(sql);
     return response;
  }

   Future<int>insertData(String sql)async{
     Database? mydb=await db;
     int response=await mydb!.rawInsert(sql);
     return response;
  }
   Future<int>updateData(String sql)async{
     Database? mydb=await db;
     int response=await mydb!.rawUpdate(sql);
     return response;
  }
   Future<int>deleteData(String sql)async{
     Database? mydb=await db;
     int response=await mydb!.rawDelete(sql);
     return response;
  }
  deleteDB()async{
    String DBpath=await getDatabasesPath();
    String path=join(DBpath,"notes.db");
    return deleteDatabase(path);
  }
//   Future<Color> getColorFromDatabase() async {
//      Database? mydb=await db;
//   // Execute the query to fetch the color value from SQLite
//   final List<Map<String, dynamic>> result = await mydb!.rawQuery('SELECT color FROM notes');

//   // Check if the result contains any rows
//   if (result.isNotEmpty) {
//     // Extract the color value from the first row
//     final String colorText = result[0]['color'];

//     // Convert the color text to a Color object
//     return Color(int.parse(colorText.replaceAll("#", "0xFF")));
//   }

//   // Return a default color if no color value was found
//   return Colors.black;
// }

  Future<List<Map>>read(String table)async{
     Database? mydb=await db;
     List<Map>response=await mydb!.query(table);
     return response;
  }

   Future<int>insert(String table,Map<String,Object?>value)async{
     Database? mydb=await db;
     int response=await mydb!.insert(table,value);
     return response;
  }
   Future<int>update(String table,Map<String,Object?>value,String where)async{
     Database? mydb=await db;
     int response=await mydb!.update(table,value,where:where);
     return response;
  }
   Future<int>delete(String table,String where)async{
     Database? mydb=await db;
     int response=await mydb!.delete(table,where:where);
     return response;
  }
}