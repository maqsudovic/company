// views/company_view.dart
import 'package:flutter/material.dart';
import 'package:profile/controllers/company_controller.dart';
import 'package:profile/models/company_data.dart';

class CompanyView extends StatefulWidget {
  @override
  _CompanyViewState createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  final CompanyController _companyController = CompanyController();

  @override
  void initState() {
    super.initState();
    _loadCompanyData();
  }

  void _loadCompanyData() {
    final jsonData = {
      "company": "Company APP",
      "location": "San Francisco",
      "employees": [
        {
          "name": "Alice",
          "age": 30,
          "position": "Developer",
          "skills": ["Dart", "Flutter", "Firebase"]
        },
        {
          "name": "Bob",
          "age": 25,
          "position": "Designer",
          "skills": ["Photoshop", "Illustrator"]
        }
      ],
      "products": [
        {"name": "Product A", "price": 29.99, "inStock": true},
        {"name": "Product B", "price": 49.99, "inStock": false}
      ]
    };

    _companyController.loadCompanyData(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(_companyController.companyName),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Location: ${_companyController.companyLocation}'),
          ),
          Expanded(
            child: ListView(
              children: [
                for (final employee in _companyController.employees)
                  _EmployeeCard(employee: employee),
                for (final product in _companyController.products)
                  _ProductCard(product: product),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEmployeeDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddEmployeeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Employee'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Position'),
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: 'Skills (comma-separated)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class _EmployeeCard extends StatelessWidget {
  final Employee employee;

  _EmployeeCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${employee.name}'),
            SizedBox(height: 8.0),
            Text('Age: ${employee.age}'),
            SizedBox(height: 8.0),
            Text('Position: ${employee.position}'),
            SizedBox(height: 8.0),
            Text('Skills: ${employee.skills.join(', ')}'),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${product.name}'),
            SizedBox(height: 8.0),
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            SizedBox(height: 8.0),
            Text('In Stock: ${product.inStock ? 'Yes' : 'No'}'),
          ],
        ),
      ),
    );
  }
}
