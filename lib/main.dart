import 'package:flutter/material.dart';
import 'db/db_helper.dart';
import 'models/tarea.dart';
import 'widgets/entrada_tarea.dart';
import 'widgets/lista_tarea.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'SQLite demo', home: TareaScreen());
  }
}

class TareaScreen extends StatefulWidget {
  @override
  _TareaScreenState createState() => _TareaScreenState();
}

class _TareaScreenState extends State<TareaScreen> {
  List<Tarea> _tareas = [];
  final TextEditingController _controller = TextEditingController();

  void _cargarTareas() async {
    final tareas = await DbHelper.obtenerTareas();
    setState(() {
      _tareas = tareas;
    });
  }

  void _agregarTarea() async {
    if (_controller.text.isNotEmpty) {
      await DbHelper.insertarTarea(Tarea(nombre: _controller.text));
      _controller.clear();
      _cargarTareas();
    }
  }

  void _eliminarTarea(int id) async {
    await DbHelper.eliminarTarea(id);
    _cargarTareas();
  }

  @override
  void initState() {
    super.initState();
    _cargarTareas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis Tareas')),
      body: Column(
        children: [
          EntradaTarea(controller: _controller, onAgregar: _agregarTarea),
          Expanded(
            child: ListaTarea(tareas: _tareas, onEliminar: _eliminarTarea),
          )
        ],
      ),
    );
  }
}
