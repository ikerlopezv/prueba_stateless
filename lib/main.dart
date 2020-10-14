import 'package:flutter/material.dart';

var tareas = [
  { "nombre": "Tarea uno", "done": false},
  { "nombre": "Tarea dos", "done": false},
  { "nombre": "Tarea tres", "done": false},
  { "nombre": "Tarea cuatro", "done": false},
];
var tarea = {"nombre": "Esto es una tarea", "done": false};
void main() => runApp(Tarea(tarea));

//------------------------------------------------------------
class Tarea extends StatefulWidget {
  var laTarea;
  //constructor
  Tarea( t ){ this.laTarea=t;}

  @override
  State<Tarea> createState() {
    print("Create una tarea state -> " + laTarea.toString());
    return new TareaState(laTarea);
  }

}


class TareaState extends State<Tarea> {
  var tst;
  TareaState(ts){ this.tst = ts;}

  void _click(){
    print("Click");
    setState( () {
      tst['done'] = !tst['done'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de Tareas',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Gestion de Tareas'),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
                children: <Widget>[
                  if(tst['done']) Icon(Icons.done)
                  else Icon(Icons.clear),
                  FlatButton(
                      onPressed: (){_click();},
                      child:Text(tst['nombre'])
                  )
                ]
            ),
          )
      ),
    );
  }


}




//----------------------------------------------------------




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TAREAS'),
        ),
          body: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
                children: <Widget>[
                  if(tarea['done']) Icon(Icons.done)
                  else Icon(Icons.clear),
                  Text(" "+tarea['nombre']),
                ]
            ),
          )

        /*body: ListView(
            padding: EdgeInsets.all(20),

            children: <Widget>[
                  for(var t in tareas) new Tarea(t),
                  if(tareas[]['done']) Icon(Icons.done)
                  else Icon(Icons.clear),
                  Text(" "+tareas[]['nombre']),
                  Text(tareas[]['nombre'])
              ]
            )*/

          )

      );
  }
}