import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todolist/models/category.dart';
import 'package:todolist/providers/radio_provider.dart';

class CategoryController {
  final WidgetRef ref;

  CategoryController(this.ref);

  Category get selectedCategory => ref.watch(radioProvider);

  void selectCategory(Category category) {
    ref.read(radioProvider.notifier).state = category;
  }
}
