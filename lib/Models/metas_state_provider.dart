import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/metas.dart';

class MetaNotifier extends Notifier<List<Metas>> {
  @override
  List<Metas> build() {
    return [];
  }

  void addMeta(Metas meta) {
    state = [...state, meta];
  }

  void removeProject(int index) {
    final metas = [...state];
    metas.removeAt(index);
    state = metas;
  }

  void clearProjects() {
    state = [];
  }
}

final metatProvider =
    NotifierProvider<MetaNotifier, List<Metas>>(MetaNotifier.new);
