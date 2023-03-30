import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'add_edit_label_screen.dart';
import 'label_cubit.dart';
import 'label_list_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Etiquetas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LabelDropdown(),
          ),
          Expanded(child: LabelList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newLabel = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditLabelScreen()),
          );

          if (newLabel != null) {
            BlocProvider.of<LabelCubit>(context).addLabel(newLabel);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class LabelDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LabelCubit, LabelState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: state.labels.isEmpty ? null : state.labels.first,
          onChanged: (String? newValue) {
            // Aquí puedes manejar la selección de una etiqueta si es necesario
          },
          items: state.labels.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}

class LabelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LabelCubit, LabelState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.labels.length,
          itemBuilder: (context, index) {
            return LabelListItem(
              label: state.labels[index],
            );
          },
        );
      },
    );
  }
}
