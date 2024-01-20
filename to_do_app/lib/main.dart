import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/application/app/basic-app.dart';
import 'package:to_do_app/data/repositories/to_do_repository_mock.dart';
import 'package:to_do_app/domain/repositories/to_do_repository.dart';

void main() {
  runApp(RepositoryProvider<ToDoRepository>(
    create: (context) => ToDoRepositoryMock(),
    child: const BasicApp(),
  ));
}
