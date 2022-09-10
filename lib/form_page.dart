import 'package:flutter/material.dart';

/// The Form Page
class FormPage extends StatefulWidget {
  /// Creates instance of the Form page
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Challenge'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) {
                //...
              },
            ),
          ],
        ),
      ),
    );
  }
}
