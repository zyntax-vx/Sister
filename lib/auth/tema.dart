import 'package:flutter/material.dart';

const Color biru = Color(0xFF1E73E8);
const Color biruMuda = Color(0xFFE8F3FC);

BoxDecoration kartu() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    );

AppBar appBarBiru(String judul) => AppBar(
      title: Text(judul,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8FD0F5), Color(0xFF5BA3F0)],
          ),
        ),
      ),
    );
    final ValueNotifier<String> statusMasuk = ValueNotifier('Belum Presensi');
    final ValueNotifier<String> statusPulang = ValueNotifier('Belum Presensi');
    
