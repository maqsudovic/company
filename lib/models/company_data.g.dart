// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) => CompanyData(
      company: json['company'] as String,
      location: json['location'] as String,
      employees: (json['employees'] as List<dynamic>)
          .map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'company': instance.company,
      'location': instance.location,
      'employees': instance.employees,
      'products': instance.products,
    };
