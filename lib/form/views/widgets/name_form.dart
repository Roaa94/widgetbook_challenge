import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/core/enums/request_status.dart';
import 'package:widgetbook_challenge/core/exceptions/custom_exception.dart';
import 'package:widgetbook_challenge/form/services/name_form_service.dart';

/// The Name Form Widget
class NameForm extends ConsumerStatefulWidget {
  /// Creates instance of the Name Form Widget
  const NameForm({Key? key}) : super(key: key);

  @override
  ConsumerState<NameForm> createState() => _NameFormState();
}

class _NameFormState extends ConsumerState<NameForm> {
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
      await ref.read(nameFormServiceProvider).submit(name!);
      setState(() {
        requestStatus = RequestStatus.success;
        message = 'Submitted successfully!';
      });
    } catch (e) {
      setState(() {
        requestStatus = RequestStatus.error;
        message = e is CustomException ? e.message : e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                return 'Name field is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: requestStatus == RequestStatus.loading ? null : submit,
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
    );
  }
}
