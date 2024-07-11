import 'package:riverpod/riverpod.dart';
import 'package:todolist/models/category.dart';

final radioProvider = StateProvider<Category>((ref) => Category.learn);
