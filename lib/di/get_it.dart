import 'package:get_it/get_it.dart';

import '../firebase/auth.dart';

final locator = GetIt.instance;

void initializeDependencyInjection(){
  locator.registerSingleton(Auth());
}