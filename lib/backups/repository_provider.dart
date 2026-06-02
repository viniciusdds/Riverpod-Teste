
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskRepository {
  String getGreentig() => 'Olá do Repository';
}

@riverpod
TaskRepository repository(Ref ref){
  return TaskRepository();
}
