import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader(),
                const SizedBox(height: 40),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 30),
                _buildLoginButton(context),
                const SizedBox(height: 20),
                _buildSignupLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

Widget _buildHeader() {
  return const Column(
    children: [
      Text(
        'Welcome Back!',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4C53A5),
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Login to continue',
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFF4C53A5),
        )
      )
    ],
  );
}

Widget _buildEmailField() {
  return TextFormField(
    controller: _emailController,
    decoration: InputDecoration(
      labelText: 'Email',
      prefixIcon: const Icon(Icons.email, color: Color(0xFF4C53A5)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Email tidak boleh kosong';
      }
      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        return 'Silakan masukkan alamat email yang valid';
      }
      return null;
    },
  );
}

Widget _buildPasswordField() {
  return TextFormField(
    controller: _passwordController,
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Password',
      prefixIcon: const Icon(Icons.lock, color: Color(0xFF4C53A5)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Password tidak boleh kosong';
      }
      if (value.length < 6) {
        return 'Password harus memiliki minimal 6 karakter';
      }
      return null;
    },
  );
}

Widget _buildLoginButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        Navigator.pushReplacementNamed(context, 'HomePage');
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4C53A5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
    ),
    child: const Text(
      'Login',
      style: TextStyle(fontSize: 18, color: Colors.white),
    )
  );
}

Widget _buildSignupLink(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pushNamed(context, '/');
    },
    child: const Text(
      'Don\'t have an account? Sign up',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF4C53A5),
      ),
    ),
  );
}

