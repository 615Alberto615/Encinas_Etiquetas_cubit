import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'label_state.dart';

class LabelCubit extends Cubit<LabelState> {
  LabelCubit() : super(LabelState(labels: []));

  void addLabel(String newLabel) {
    final labels = List<String>.from(state.labels)..add(newLabel);
    emit(LabelState(labels: labels));
  }

  void updateLabel(String oldLabel, String newLabel) {
    final labels = List<String>.from(state.labels);
    final index = labels.indexOf(oldLabel);
    if (index != -1) {
      labels[index] = newLabel;
      emit(LabelState(labels: labels));
    }
  }

  void deleteLabel(String label) {
    final labels = List<String>.from(state.labels)..remove(label);
    emit(LabelState(labels: labels));
  }
}

class LabelState extends Equatable {
  final List<String> labels;

  const LabelState({required this.labels});

  @override
  List<Object?> get props => [labels];
}
