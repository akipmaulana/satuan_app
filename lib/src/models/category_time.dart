import 'package:flutter/material.dart';
import 'package:satuan_app/src/constant.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryTime extends Category {
  @override
  Color color = DefaultColor.orange;

  @override
  String imageLocation = 'assets/images/time.png';

  @override
  int index = 4;

  @override
  String title = 'Time';

  @override
  CategoryType type = CategoryType.time;

  @override
  List<Unit> units = [
    Unit(
      index: 1,
      title: Time.Abad,
      abbreviation: 'abad',
      value: 0.0,
    ),
    Unit(
      index: 2,
      title: Time.Dasawarsa,
      abbreviation: 'dasawarsa',
      value: 0.0,
    ),
    Unit(
      index: 3,
      title: Time.Windu,
      abbreviation: 'windu',
      value: 0.0,
    ),
    Unit(
      index: 4,
      title: Time.Lustrum,
      abbreviation: 'lustrum',
      value: 0.0,
    ),
    Unit(
      index: 5,
      title: Time.Tahun,
      abbreviation: 'tahun',
      value: 0.0,
    ),
    Unit(
      index: 6,
      title: Time.Semester,
      abbreviation: 'semester',
      value: 0.0,
    ),
    Unit(
      index: 7,
      title: Time.Bulan,
      abbreviation: 'bulan',
      value: 0.0,
    ),
    Unit(
      index: 8,
      title: Time.Minggu,
      abbreviation: 'minggu',
      value: 0.0,
    ),
    Unit(
      index: 9,
      title: Time.Hari,
      abbreviation: 'hari',
      value: 0.0,
    ),
    Unit(
      index: 10,
      title: Time.Jam,
      abbreviation: 'jam',
      value: 0.0,
    ),
    Unit(
      index: 11,
      title: Time.Menit,
      abbreviation: 'menit',
      value: 0.0,
    ),
    Unit(
      index: 12,
      title: Time.Detik,
      abbreviation: 'detik',
      value: 0.0,
    ),
  ];

  @override
  List<Unit> calculate({@required String from, @required double value}) {
    double hari = 1;
    if (from == Time.Abad) {
      hari = 365 * 100 * value;
    } else if (from == Time.Dasawarsa) {
      hari = 365 * 10 * value;
    } else if (from == Time.Windu) {
      hari = 365 * 8 * value;
    } else if (from == Time.Lustrum) {
      hari = 365 * 5 * value;
    } else if (from == Time.Tahun) {
      hari = 365 * value;
    } else if (from == Time.Semester) {
      hari = 365 * value / 2;
    } else if (from == Time.Bulan) {
      hari = 365 * value / 12;
    } else if (from == Time.Minggu) {
      hari = 7 * value;
    } else if (from == Time.Hari) {
      hari = value;
    } else if (from == Time.Jam) {
      hari = value;
    } else if (from == Time.Menit) {
      hari = value;
    } else if (from == Time.Detik) {
      hari = value;
    }
    final tahun = hari / 365;
    units[0].value = tahun / 100; // ABAD
    units[1].value = tahun / 10; // DASAWARSA
    units[2].value = tahun / 8; // WINDU
    units[3].value = tahun / 5; // LUSTRUM
    units[4].value = tahun; // TAHUN
    units[5].value = 2 * tahun; // SEMESTER
    units[6].value = 12 * tahun; // BULAN
    units[7].value = hari / 7; // MINGGU
    units[8].value = hari; // HARI
    units[9].value = 24 * hari; // JAM
    units[10].value = 60 * 24 * hari; // MENIT
    units[11].value = 60 * 60 * 24 * hari; // DETIK
    return units;
  }

  @override
  double calculator(double value, {String from, String to}) {
    // TODO: implement calculator
    return 0.0;
  }
}
