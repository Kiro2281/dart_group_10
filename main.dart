import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_4/ui/car_image/my_cat_page.dart';
import 'package:flutter_project_4/ui/image/my_dog_page.dart';
import 'package:flutter_project_4/ui/my_app/my_app_page.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

void main() {
  Bloc.observer = TalkerBlocObserver();
  runApp(MaterialApp(home: MyCatPage()));
}


