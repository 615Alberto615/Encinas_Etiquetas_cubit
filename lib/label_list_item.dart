import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_edit_label_screen.dart';
import 'label_cubit.dart';

class LabelListItem extends StatelessWidget {
  final String label;

  LabelListItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () async {
              final updatedLabel = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditLabelScreen(initialLabel: label),
                ),
              );

              if (updatedLabel != null) {
                context.read<LabelCubit>().updateLabel(label, updatedLabel);
              }
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              context.read<LabelCubit>().deleteLabel(label);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
