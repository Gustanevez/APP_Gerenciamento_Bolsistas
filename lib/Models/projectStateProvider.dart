import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';


class ProjectNotifier extends StreamNotifier<List<Project>> {
  
  
  final CollectionReference projectsCollection = 
      FirebaseFirestore.instance.collection('projects');

  @override
  Stream<List<Project>> build() {
    return projectsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Project.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  
  Future<void> addProject(Project project) async {
    
    await projectsCollection.add(project.toMap());
  }

  Future<void> removeProject(String projectId) async {
    await projectsCollection.doc(projectId).delete();
  }

  
}


final projectProvider =
    StreamNotifierProvider<ProjectNotifier, List<Project>>(ProjectNotifier.new);