import 'package:flutter/material.dart';

class EntradaTarea extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAgregar;

  EntradaTarea({required this.controller, required this.onAgregar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Nueva Tarea'),
            ),
          ),
          IconButton(icon: Icon(Icons.add), onPressed: onAgregar),
        ],
      ),
    );
  }
}