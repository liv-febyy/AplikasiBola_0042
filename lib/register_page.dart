import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nama = TextEditingController();
  final _domisili = TextEditingController();
  final _telepon = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? _gender;

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registrasi Berhasil')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrasi Akun')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nama,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator: (v) => v!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _domisili,
                decoration: const InputDecoration(labelText: 'Domisili'),
                validator: (v) => v!.isEmpty ? 'Domisili wajib diisi' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _telepon,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                validator: (v) {
                  if (v!.isEmpty) return 'Nomor telepon wajib diisi';
                  if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                    return 'Hanya boleh angka';
                  }
                  if (v.length < 10) return 'Minimal 10 angka';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                initialValue: _gender,
                items: const [
                  DropdownMenuItem(
                    value: 'Laki-laki',
                    child: Text('Laki-laki'),
                  ),
                  DropdownMenuItem(
                    value: 'Perempuan',
                    child: Text('Perempuan'),
                  ),
                ],
                onChanged: (v) => setState(() => _gender = v),
                decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
                validator: (v) => v == null ? 'Pilih jenis kelamin' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Email wajib diisi';
                  if (!v.contains('@') || !v.endsWith('.com')) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Kata Sandi'),
                validator: (v) => v!.length < 6 ? 'Minimal 6 karakter' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _register, child: const Text('Daftar')),
            ],
          ),
        ),
      ),
    );
  }
}
