import 'package:flutter/material.dart';
import 'homepage.dart';
import 'presensi_wajah.dart';
import 'profil.dart';
import 'tema.dart';

// Kerangka utama: Beranda & Profil + navigasi bawah
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _tab = 0; // 0 = beranda, 1 = profil

  Widget _ikon(IconData ikon, bool aktif, VoidCallback aksi) => IconButton(
        onPressed: aksi,
        iconSize: 30,
        icon: Icon(ikon, color: aktif ? biru : biru.withOpacity(0.5)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: biruMuda,
      body: IndexedStack(
        index: _tab,
        children: const [Homepage(), Profil()],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          decoration: kartu(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ikon(Icons.home_outlined, _tab == 0,
                  () => setState(() => _tab = 0)),
              _ikon(Icons.face, false, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PresensiWajah()),
                );
              }),
              _ikon(Icons.account_circle_outlined, _tab == 1,
                  () => setState(() => _tab = 1)),
            ],
          ),
        ),
      ),
    );
  }
}
