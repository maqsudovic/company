// controllers/company_controller.dart
import 'package:json_annotation/json_annotation.dart';
import '../models/company_data.dart';

class CompanyController {
  late final CompanyData _companyData;

  void loadCompanyData(Map<String, dynamic> jsonData) {
    _companyData = CompanyData.fromJson(jsonData);
  }

  String get companyName => _companyData.company;
  String get companyLocation => _companyData.location;
  List<Employee> get employees => _companyData.employees;
  List<Product> get products => _companyData.products;

  void addEmployee(Employee employee) {
    _companyData.employees.add(employee);
    notifyListeners();
  }

  void updateEmployee(int index, Employee employee) {
    _companyData.employees[index] = employee;
    notifyListeners();
  }

  void removeEmployee(int index) {
    _companyData.employees.removeAt(index);
    notifyListeners();
  }

  void addProduct(Product product) {
    _companyData.products.add(product);
    notifyListeners();
  }

  void updateProduct(int index, Product product) {
    _companyData.products[index] = product;
    notifyListeners();
  }

  void removeProduct(int index) {
    _companyData.products.removeAt(index);
    notifyListeners();
  }

  void notifyListeners() {
    // Implement the logic to notify the view that the data has changed
  }
}