// models/company_data.dart
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'company_data.g.dart';
@JsonSerializable()
class CompanyData {
  final String company;
  final String location;
  final List<Employee> employees;
  final List<Product> products;

  CompanyData({
    required this.company,
    required this.location,
    required this.employees,
    required this.products,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    return CompanyData(
      company: json['company'] as String,
      location: json['location'] as String,
      employees: (json['employees'] as List)
          .map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List)
          .map((p) => Product.fromJson(p as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'location': location,
      'employees': employees.map((e) => e.toJson()).toList(),
      'products': products.map((p) => p.toJson()).toList(),
    };
  }
}

class Employee {
  final String name;
  final int age;
  final String position;
  final List<String> skills;

  Employee({
    required this.name,
    required this.age,
    required this.position,
    required this.skills,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'] as String,
      age: json['age'] as int,
      position: json['position'] as String,
      skills: (json['skills'] as List).map((s) => s as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'position': position,
      'skills': skills,
    };
  }
}

class Product {
  final String name;
  final double price;
  final bool inStock;

  Product({
    required this.name,
    required this.price,
    required this.inStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      inStock: json['inStock'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'inStock': inStock,
    };
  }
}