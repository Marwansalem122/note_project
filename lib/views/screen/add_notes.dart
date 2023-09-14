import 'package:flutter/material.dart';
import 'package:note_app/controller/DB.dart';
import 'package:note_app/views/screen/homepage.dart';
import 'package:note_app/views/widget/textformfield.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  GlobalKey<FormState>formkey= GlobalKey<FormState>();
  TextEditingController note=TextEditingController();
  TextEditingController title=TextEditingController();
  TextEditingController color=TextEditingController();
  SqlDB sqldb=SqlDB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Add Note"),
        centerTitle:true
      ),
      
      body: Container(
         child: ListView(
          children: [
            Form(
              key:formkey,
                 child: Column(
                  children: [
                    textFormField(
                      controller: title,
                       labeltext: "Title",
                       hinttext: "Enter Title",
                        icon: Icon(Icons.title)),
                        textFormField(
                      controller: note,
                       labeltext: "Subject",
                       hinttext: "Enter Subject",
                        icon: Icon(Icons.subject)),
                        textFormField(
                      controller: color,
                       labeltext: "Color",
                       hinttext: "Enter Color",
                        icon: Icon(Icons.color_lens)),
                        MaterialButton(onPressed: ()async{
                          // int response=await sqldb.insert("notes", {
                          //   "note":"${note.text}",
                          //   "text":"${title.text}",
                          //   "color": "${color.text}"
                          // });
                          int response=await sqldb.insertData('''
                              INSERT INTO notes (`note`,`text`,`color`) VALUES ("${note.text}","${title.text}","${color.text}")
                              ''');
                         if(response>0){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context)=>HomePage()),(route)=>false);
                         }
                         setState(() {
                           
                         });
                              }
                        ,color: Colors.blue,child: Text("Save"),)
                  ],
                 ),
               )
          ],
         ),
      ),
    );
  }
}