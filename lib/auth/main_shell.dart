import 'package:flutter/material.dart';
import 'homepage.dart';
import 'presensi_wajah.dart';
import 'profil.dart';
import 'tema.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _tab = 0;
  Widget _ikon(Widget gambarIkon, VoidCallback aksi) => IconButton(
        onPressed: aksi,
        iconSize: 30,
        icon: gambarIkon,
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
              _ikon(
                Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: _tab == 0 ? biru : biru.withValues(alpha: 0.5),
                ),
                () => setState(() => _tab = 0),
              ),
              _ikon(
                Image.asset(
                  'assets/images/scan_wajah.png',
                  width: 50,
                  height: 50,
                  color: biru,
                ),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PresensiWajah(),
                    ),
                  );
                },
              ),
              _ikon(
                Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                  color: _tab == 1 ? biru : biru.withValues(alpha: 0.5),
                ),
                () => setState(() => _tab = 1),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
