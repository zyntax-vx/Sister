import 'package:flutter/material.dart';

class Data {
  final String nama;
  final String nis;
  final String kelas;
  final String password;
  
Data({
    required this.nis,
    required this.password,
    required this.nama,
    required this.kelas,
  });
}
final List<Data> daftarSiswa = [
  Data(
    nis: '2221',
    password: '20100615',
    nama: 'Aqidatul Aziizah',
    kelas: 'XI RPL ', 
  ),
  Data(
    nis: '2222',        
    password: '20100619',
    nama: 'Syafa Yuliana', 
    kelas: 'XI RPL',  
  ),
];
Data? siswaAktif;