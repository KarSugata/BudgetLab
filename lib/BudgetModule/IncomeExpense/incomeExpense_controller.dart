import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_service.dart';

import 'incomeExpense_entity.dart';

class IncomeExpenseController {
  IncomeExpenseService incomeExpenseService = IncomeExpenseService();

  List<IncomeExpense> getAllIncomeExpenseList() {
    return incomeExpenseService.getAllIncomeExpenseList();
  }

  int addIncomeExpense(int id, bool isIncome, DateTime dateTime, int amount, String note, String category) {
    return incomeExpenseService.addIncomeExpense(id, isIncome, dateTime, amount, note, category);
  }

  updateIncomeExpense() {}

  Future<bool> deleteIncomeExpense(int id) {
    return incomeExpenseService.deleteIncomeExpense(id);
  }
}
