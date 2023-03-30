class LabelRepository {
  List<String> _labels = [];

  Future<List<String>> getLabels() async {
    return _labels;
  }

  Future<void> addLabel(String label) async {
    _labels.add(label);
  }

  Future<void> updateLabel(String oldLabel, String newLabel) async {
    int index = _labels.indexOf(oldLabel);
    if (index != -1) {
      _labels[index] = newLabel;
    }
  }

  Future<void> deleteLabel(String label) async {
    _labels.remove(label);
  }
}
