import 'package:flutter/material.dart';
import 'main_shell.dart';
import 'tema.dart';

class Masuk extends StatefulWidget {
  const Masuk({super.key});

  @override
  State<Masuk> createState() => _MasukState();
}

class _MasukState extends State<Masuk> {
  final TextEditingController _nis = TextEditingController();
  final TextEditingController _sandi = TextEditingController();

  @override
  void dispose() {
    _nis.dispose();
    _sandi.dispose();
    super.dispose();
  }

  void _login() {
    if (_nis.text.trim().isEmpty || _sandi.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('NIS dan password harus diisi')),
      );
      return;
    }
    // TODO: cek ke server. Untuk sekarang langsung masuk.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }

  InputDecoration _gaya(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFEAEAEA),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFF6AA8F0)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/sister2.png', width: 260),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        TextField(
                            controller: _nis,
                            decoration: _gaya('Masukkan NIS atau Username')),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _sandi,
                          obscureText: true,
                          decoration: _gaya('Masukkan Password'),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: biru,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)),
                            ),
                            onPressed: _login,
                            child: const Text('Login',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
