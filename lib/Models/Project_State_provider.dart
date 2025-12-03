import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';

class ProjectNotifier extends Notifier<List<Project>> {
  @override
  List<Project> build() {
    return [];
  }

  void addProject(Project project) {
    state = [...state, project];
  }

  void removeProject(int index) {
    final projetos = [...state];
    projetos.removeAt(index);
    state = projetos;
  }

  void clearProjects() {
    state = [];
  }
}

final projectProvider =
    NotifierProvider<ProjectNotifier, List<Project>>(ProjectNotifier.new);
