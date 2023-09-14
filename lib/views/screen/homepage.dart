import 'package:flutter/material.dart';
import 'package:note_app/controller/DB.dart';
import 'package:note_app/views/screen/editnote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SqlDB sqldb=SqlDB();
  List notes=[];
  bool isloading=true;
  Future readData()async{
    //List<Map>response=await sqldb.read("notes");
    List<Map>response=await sqldb.readData("SELECT * FROM 'notes'");
    notes.addAll(response);
    isloading=false;
    if(this.mounted){
      setState(() {
        
      });
    }
  }
  @override
  void initState() {
    readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).pushNamed('add_notes'),
        child: Icon(Icons.add),
        ),
      body:isloading==true?Text("Loading..."): Container(
        child: ListView(
            children: [
               MaterialButton(onPressed: (){
                setState(()async {
                  int response =await sqldb.deleteDB();
                print(response);
                });
              },child: const Text("Delete DB"),),
              
                     ListView.builder(
                      itemCount: notes.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,i){
                             return Container(
                              alignment: Alignment.center,
                             color: Colors.blue,
                              margin: EdgeInsets.all(10),
                               child: ListTile(
                                title:  Text("${notes[i]['text']}") ,
                                subtitle:Text("${notes[i]['note']}"),
                                trailing:Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(onPressed: ()async{
                                      int response=await sqldb.delete("notes", "id=${notes[i]['id']}");
                                  // int response=await sqldb.deleteData("DELETE FROM notes WHERE id=${notes[i]['id']}");
                                  if(response>0){
                                    notes.removeWhere((element) => element['id']==notes[i]['id']);
                                  }
                                  setState(() {
                                    
                                  });
                                }, icon: Icon(Icons.delete,color: Colors.red,)),

                                IconButton(onPressed: (){
                                  
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditNote(
                                    color: notes[i]['color'],
                                    title: notes[i]['text'],
                                    note: notes[i]['note'],
                                     id: notes[i]['id'],
                                  )));
                                }, icon: Icon(Icons.edit,color: Colors.white,))
                                  ],
                                )
                                
                                ),
                             );
                      }
                      )
         
            ],
        ),
      ),
    );
  }
}