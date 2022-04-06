import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting/provider/provider_notifer.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var userNameController = TextEditingController();
  var passwordNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  // widget build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'login now to our amazing app',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 20,
                      ),
                ),
                const Divider(
                  indent: 8,
                  endIndent: 8,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: userNameController,
                  validator: (value) {
                    return value!.isNotEmpty
                        ? null
                        : 'user name can not be empty';
                  },
                  decoration: InputDecoration(
                    labelText: 'UserName',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: passwordNameController,
                  validator: (value) {
                    return value!.length >= 6
                        ? null
                        : 'password can not be less than 6 characters';
                  },
                  obscureText: context.read<LoginProvider>().visibility,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: context.read<LoginProvider>().visibility
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: Provider.of<LoginProvider>(
                        context,
                      ).changeVisibility,
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            Provider.of<LoginProvider>(context, listen: false)
                .allowAccess(userNameController.text, context);
          }
        },
        label: const Text('Login'),
        icon: const Icon(Icons.login_outlined),
      ),
    );
  }
}
