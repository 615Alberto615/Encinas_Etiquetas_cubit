import 'package:flutter/material.dart';

class AddEditLabelScreen extends StatefulWidget {
  final String? initialLabel;

  AddEditLabelScreen({this.initialLabel});

  @override
  _AddEditLabelScreenState createState() => _AddEditLabelScreenState();
}

class _AddEditLabelScreenState extends State<AddEditLabelScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialLabel);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.initialLabel == null
            ? 'Agregar etiqueta'
            : 'Editar etiqueta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Etiqueta'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
              child: Text(widget.initialLabel == null ? 'Agregar' : 'Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
