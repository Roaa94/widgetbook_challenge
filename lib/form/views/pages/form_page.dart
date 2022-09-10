import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/form/views/widgets/name_form.dart';

/// The Form Page
class FormPage extends StatelessWidget {
  /// Creates instance of the Form page
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Challenge'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: NameForm(),
      ),
    );
  }
}
