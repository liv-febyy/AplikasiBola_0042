import 'package:flutter/material.dart';
import 'package:project_aplikasi_bola/detail_pemain_page.dart';
import 'pemain.dart';

class TambahPemainPage extends StatefulWidget {
  const TambahPemainPage({super.key});

  @override
  State<TambahPemainPage> createState() => _TambahPemainPageState();
}

class _TambahPemainPageState extends State<TambahPemainPage> {
  final _formKey = GlobalKey<FormState>();
  final _nama = TextEditingController();
  final _posisi = TextEditingController();
  final _nomor = TextEditingController();
  final _kewarganegaraan = TextEditingController();
  final _usia = TextEditingController();
  final _tinggi = TextEditingController();
  String? _gender;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final pemain = Pemain(
        nama: _nama.text,
        posisi: _posisi.text,
        nomorPunggung: int.tryParse(_nomor.text) ?? 0,
        kewargaNegaraan: _kewarganegaraan.text,
        usia: int.tryParse(_usia.text) ?? 0,
        tingiBadan: double.parse(_tinggi.text),
        jenisKelamin: _gender ?? '',
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPemainPage(pemain: pemain),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Pemain')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nama,
                decoration: const InputDecoration(labelText: 'Nama Pemain'),
                validator: (v) => v!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              TextFormField(
                controller: _posisi,
                decoration: const InputDecoration(labelText: 'Posisi'),
                validator: (v) => v!.isEmpty ? 'Posisi wajib diisi' : null,
              ),
              TextFormField(
                controller: _nomor,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Nomor Punggung'),
                validator: (v) {
                  if (v!.isEmpty) return 'Nomor wajib diisi';
                  if (int.tryParse(v) == null) return 'Harus angka';
                  return null;
                },
              ),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Lanjut ke Detail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
