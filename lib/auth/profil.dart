import 'package:flutter/material.dart';
import 'data_diri.dart';
import 'login.dart';
import 'tema.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  Widget _stat(String angka, String label) => Column(
        children: [
          Text(angka, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: biruMuda,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xFFE0E0E0),
                child: Icon(Icons.person, size: 70, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              const Text('Nama Siswa',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Kelas   |   SMK Negeri 1 Bukateja',
                  style: TextStyle(fontSize: 12)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: kartu(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _stat('0', 'Hadir'),
                    _stat('0', 'Sakit'),
                    _stat('0', 'Izin'),
                    _stat('0', 'Alpha'),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Container(
                decoration: kartu(),
                child: ListTile(
                  title: const Text('Data Diri'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DataDiri()),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Container(
                decoration: kartu(),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Log Out',
                      style: TextStyle(color: Colors.red)),
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const Masuk()),
                    (route) => false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
