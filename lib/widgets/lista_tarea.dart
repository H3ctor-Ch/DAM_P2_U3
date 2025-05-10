import 'package:flutter/material.dart';
import '../models/tarea.dart';

class ListaTarea extends StatelessWidget {
  final List<Tarea> tareas;
  final Function(int) onEliminar;

  ListaTarea({
    required this.tareas,
    required this.onEliminar
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tareas.length,
      itemBuilder: (context, index) {
        final tarea = tareas[index];
        return ListTile(
          title: Text(tarea.nombre),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => onEliminar(tarea.id!),
          ),
        );
      },
    );
  }
}