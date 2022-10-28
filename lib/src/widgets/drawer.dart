import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';


class MiDrawer extends StatelessWidget{
  //const MiDrawer({Key? key}) : super(key: key);
  final _estiloPuntos = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: _contenidoDrawer(context),
    );
  }

  List<Widget> _listaDrawer(context){
    //devuelve la lista de widgets para el listview
    List<Widget> lista = [];

    lista.add(InkWell(
      child: ListTile(
        title: Text("Mi Perfil"),
        trailing: Icon(Icons.person),
        onTap: ()=>_funcionNoImplementada(context),

      ),
    ));
    lista.add(ListTile(
        title: Text("Calendario"),
        trailing: Icon(Icons.calendar_view_month_sharp),
        onTap: ()=>_funcionNoImplementada(context)
    ));
    lista.add(ListTile(
      title: Text("Lista de tareas"),
      trailing: Icon(Icons.add),
      onTap: ()=>_funcionNoImplementada(context),
    ));

    lista.add(ListTile(
        title: Text("Recordatorios"),
        trailing: Icon(Icons.notifications),
        onTap: ()=>_funcionNoImplementada(context)
    ));

    lista.add(ListTile(
        title: Text("Ayuda"),
        trailing: Icon(Icons.help),
        onTap: ()=>_funcionNoImplementada(context)
    ));
    return lista;
  }

  Widget _contenidoDrawer(context){
    return Container(
      color: Colors.redAccent[200],
      child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                children:[
                  //foto
                  Container(
                    padding: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/bar.jpg"),
                      maxRadius: 50,
                    ),
                  ),
                  SizedBox(width: 20,),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.indigo[100],
                child: ListView(
                    children:
                    _listaDrawer(context)
                ),
              ),
            ),
          ]),
    );
  }

  //o declararlo como un Future : Future _funcionNoImplementada (context){}
  _funcionNoImplementada (context){
    return showDialog(
        context: context,
        builder: (_) =>AlertDialog(
          title: Text("Lo sentimos"),
          content: Text("La función elegida aun no se encuentra implementada"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')), // Cerramos el diálogo
            TextButton(onPressed: (){
              // Pondríamos el código que queramos
              Navigator.pop(context,'Valor de vuelta');     // Envío de vuelta a quien llamó la información que quiera. NO ES OBLIGATORIO
            },
                child: Text('Aceptar')),
          ],
        )
    );
  }


}