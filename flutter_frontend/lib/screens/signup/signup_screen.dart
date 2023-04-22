import 'package:flutter/material.dart';

// Screens
import 'package:flutter_frontend/screens/login/login_screen.dart';

// Provider
import 'package:flutter_frontend/data/providers/node_provider.dart';
import 'package:provider/provider.dart';

// Validators
import 'package:flutter_frontend/utils/validators.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    final nodeProvider = Provider.of<NodeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: FlutterLogo(
                  size: 50,
                  textColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: Validators.validateName,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: Validators.validatePassword,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 325,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          final auth = await nodeProvider.createUser(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            confirmPasswordController.text.trim(),
                          );
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Account Created Successfully!'),
                            ),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid name, email or password.'),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: const Text(
//           'Sign Up',
//           style: TextStyle(
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Center(
//                 child: FlutterLogo(
//                   size: 50,
//                   textColor: Colors.blue,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 child: TextFormField(
//                   controller: nameController,
//                   keyboardType: TextInputType.name,
//                   validator: Validators.validateName,
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                     hintText: 'Enter your name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 child: TextFormField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: Validators.validateEmail,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     hintText: 'Enter your email address',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 child: TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   validator: Validators.validatePassword,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     hintText: 'Enter your password',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 child: TextFormField(
//                   controller: confirmPasswordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Confirm Password',
//                     hintText: 'Confirm your password',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: SizedBox(
//                   width: 325,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // _formKey.currentState!.save();
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Login Successful'),
//                           ),
//                         );
//                       }
//                     },
//                     child: const Text('Sign Up'),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Does not have account?'),
//                     TextButton(
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(fontSize: 15),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const LoginScreen(),
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
