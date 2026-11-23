import 'package:flutter/material.dart';
import 'tema.dart';

class Izin extends StatefulWidget {
  const Izin({super.key});

  @override
  State<Izin> createState() => _IzinState();
}

class _IzinState extends State<Izin> {
  String? _jenis;
  DateTime? _mulai;
  DateTime? _selesai;
  String? _surat;
  final TextEditingController _alasan = TextEditingController();

  @override
  void dispose() {
    _alasan.dispose();
    super.dispose();
  }

  String _fmt(DateTime? d) =>
      d == null ? 'Pilih Tanggal' : '${d.day}/${d.month}/${d.year}';

  Future<void> _pilihTanggal(bool mulai) async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (hasil == null) return;
    setState(() => mulai ? _mulai = hasil : _selesai = hasil);
  }

  Future<void> _pilihSurat() async {
    setState(() => _surat = 'surat_izin.pdf'); 
  }

  void _kirim() {
    if (_jenis == null || _mulai == null || _selesai == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lengkapi jenis dan tanggal izin')),
      );
      return;
    }
    // TODO: kirim ke server
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengajuan izin terkirim')),
    );
    Navigator.pop(context);
  }

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 6),
        child: Text(t,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      );

  Widget _kotakTanggal(DateTime? nilai, bool mulai) => InkWell(
        onTap: () => _pilihTanggal(mulai),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: biruMuda,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_fmt(nilai),
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarBiru('Pengajuan Izin'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label('Jenis Izin'),
            DropdownButtonFormField<String>(
              value: _jenis,
              hint: const Text('Pilih Jenis Izin',
                  style: TextStyle(fontSize: 12)),
              items: const ['Sakit', 'Izin', 'Dispensasi']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => setState(() => _jenis = v),
              decoration: InputDecoration(
                filled: true,
                fillColor: biruMuda,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            _label('Mulai Izin'),
            _kotakTanggal(_mulai, true),
            _label('Selesai Izin'),
            _kotakTanggal(_selesai, false),
            _label('Alasan Izin'),
            TextField(
              controller: _alasan,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Tuliskan Alasan Izin...',
                hintStyle: const TextStyle(fontSize: 12),
                filled: true,
                fillColor: biruMuda,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            _label('Unggah Surat'),
            InkWell(
              onTap: _pilihSurat,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: biru),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.upload, color: biru),
                    const SizedBox(height: 6),
                    Text(_surat == null ? 'Unggah Surat' : _surat!,
                        style: const TextStyle(color: biru, fontSize: 12)),
                    const SizedBox(height: 4),
                    const Text('Tambahkan Foto Atau Dokumen',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                onPressed: _kirim,
                child: const Text('Kirim Pengajuan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
