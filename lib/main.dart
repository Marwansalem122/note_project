import 'package:flutter/material.dart';
import 'package:note_app/views/screen/add_notes.dart';
import 'package:note_app/views/screen/homepage.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "add_notes":(context)=>  AddNotes()},
    )
     );
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   SqlDB sqldb=SqlDB();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//              MaterialButton(color: Colors.blue,onPressed: ()async{
//               int response=await sqldb.insertData("INSERT INTO 'notes'('note') VALUES ('note 1')");
//               print(response);
//             }, child: Text("insert Data")),
//             MaterialButton(color: Colors.blue,onPressed: ()async{
//                List<Map> response=await sqldb.readData("SELECT * FROM `notes`");
//               print(response);
//             }, child: Text("Read Data")),
//               MaterialButton(color: Colors.blue,onPressed: ()async{
//                int response=await sqldb.deleteData("DELETE FROM `notes` WHERE note='note 2'");
//               print(response);
//             }, child: Text("Delete Data")),
//              MaterialButton(color: Colors.blue,onPressed: ()async{
//               int response=await sqldb.updateData("UPDATE `notes` SET 'note'='note 8' WHERE id=8");
//               print(response);
//             }, child: Text("Update Data")),
//           ],
//         ),
//       ),
//     );
//   }
// }