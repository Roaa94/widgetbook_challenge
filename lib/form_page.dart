import 'package:flutter/material.dart';

/// Helper enum for status of the request
enum RequestStatus {
  /// The request is loading
  loading,

  /// The request returned an error
  error,

  /// The request was successful
  success,

  /// The request has not been sent yet
  idle,
}

/// The Form Page
class FormPage extends StatefulWidget {
  /// Creates instance of the Form page
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? name;
  RequestStatus requestStatus = RequestStatus.success;
  String message = '';

  Future<void> submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      requestStatus = RequestStatus.loading;
      message = '';
    });
    try {
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      setState(() {
        requestStatus = RequestStatus.success;
        message = 'Submitted successfully!';
      });
    } catch (e) {
      setState(() {
        requestStatus = RequestStatus.error;
        message = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Challenge'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onSaved: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Name Field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    requestStatus == RequestStatus.loading ? null : submit,
                child: requestStatus == RequestStatus.loading
                    ? const CircularProgressIndicator.adaptive()
                    : const Text('Submit'),
              ),
              const SizedBox(height: 10),
              Text(
                message,
                style: TextStyle(
                  color: requestStatus == RequestStatus.error
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
