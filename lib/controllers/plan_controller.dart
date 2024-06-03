import 'package:flutter/foundation.dart';
import '../models/plan.dart';
import '../services/api_service.dart';

class PlanController with ChangeNotifier {
  List<Plan> _plans = [];

  List<Plan> get plans => _plans;

  PlanController() {
    fetchPlans();
  }

  void fetchPlans() async {
    _plans = await ApiService.fetchPlans();
    notifyListeners();
  }

  void addPlan(String title, String description) async {
    final newPlan = Plan(id: DateTime.now().toString(), title: title, description: description);
    _plans.add(newPlan);
    notifyListeners();
    await ApiService.savePlan(newPlan);
  }

  void deletePlan(String id) async {
    _plans.removeWhere((plan) => plan.id == id);
    notifyListeners();
    await ApiService.deletePlan(id);
  }
}
