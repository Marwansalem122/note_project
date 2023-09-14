import 'package:flutter/material.dart';
import 'package:note_app/controller/DB.dart';
import 'package:note_app/views/screen/homepage.dart';
import 'package:note_app/views/widget/textformfield.dart';

class EditNote extends StatefulWidget {
  final note;
  final title;
  final color;
  final id;

  const EditNote({super.key, this.note, this.title, this.color, this.id});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  GlobalKey<FormState>formkey= GlobalKey<FormState>();
  TextEditingController note=TextEditingController();
  TextEditingController title=TextEditingController();
  TextEditingController color=TextEditingController();
  SqlDB sqldb=SqlDB();
  @override
 void initState() {
    note.text = widget.note ?? '';
    color.text = widget.color ?? '';
    title.text = widget.title ?? '';
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit note"),
        centerTitle: true,
        
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
                          // int response=await sqldb.update("notes", {
                          //        'note':"${note.text}",
                          //     "text":"${title.text}",
                          //     "color":"${color.text}"
                          // }, "id=${widget.id}");
                          int response=await sqldb.updateData('''
                              UPDATE notes SET 
                              note="${note.text}",
                              text="${title.text}",
                              color="${color.text}"
                              WHERE id=${widget.id}
                              ''');
                         if(response>0){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context)=>HomePage()),(route)=>false);
                         }
                              }    
                        ,color: Colors.blue,child: Text("Edit"),)
                  ],
                 ),
               )
          ],
         ),
      ),
    );
  }
}
    