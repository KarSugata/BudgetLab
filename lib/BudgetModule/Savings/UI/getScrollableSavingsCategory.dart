import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';

/// Public Method //////////////////////////////////////////////////////////////

getScrollableSavingsCategory() {
  return const ScrollableSavingsCategory();
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableSavingsCategory extends StatefulWidget {
  const ScrollableSavingsCategory({Key? key}) : super(key: key);

  @override
  State<ScrollableSavingsCategory> createState() =>
      _ScrollableSavingsCategoryState();
}

class _ScrollableSavingsCategoryState extends State<ScrollableSavingsCategory> {
  int allCategoryListLength = 0;
  late ValueNotifier<List<Category>> allCategoryList;

  CategoryController categoryController = CategoryController();

  @override
  void initState() {
    super.initState();
    allCategoryList = ValueNotifier<List<Category>>([]);
    fetchData();
  }

  void fetchData() async {
    List<Category> fetchedData = await categoryController.getAllCategoryList();
    allCategoryList.value = fetchedData;
    allCategoryListLength = fetchedData.length;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Category>>(
      valueListenable: allCategoryList,
      builder: (context, categoryList, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categoryList.length,
                  (index) {
                final category = categoryList[index];
                return Container(
                  margin: const EdgeInsets.all(6), // Adjust the padding between buttons
                  child: getIconButtons(category.icon, category.name),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
