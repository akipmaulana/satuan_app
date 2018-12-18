import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryTime implements Category {
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
      index: 0,
      title: 'Abad',
      abbreviation: 'abad',
      value: 0.0,
    ),
    Unit(
      index: 1,
      title: 'Dasawarsa',
      abbreviation: 'dasawarsa',
      value: 0.0,
    ),
    Unit(
      index: 2,
      title: 'Windu',
      abbreviation: 'windu',
      value: 0.0,
    ),
    Unit(
      index: 3,
      title: 'Lustrum',
      abbreviation: 'lustrum',
      value: 0.0,
    ),
    Unit(
      index: 4,
      title: 'Tahun',
      abbreviation: 'tahun',
      value: 0.0,
    ),
    Unit(
      index: 5,
      title: 'Semester',
      abbreviation: 'semester',
      value: 0.0,
    ),
    Unit(
      index: 6,
      title: 'Bulan',
      abbreviation: 'bulan',
      value: 0.0,
    ),
    Unit(
      index: 7,
      title: 'Minggu',
      abbreviation: 'minggu',
      value: 0.0,
    ),
    Unit(
      index: 8,
      title: 'Hari',
      abbreviation: 'hari',
      value: 0.0,
    ),
    Unit(
      index: 9,
      title: 'Jam',
      abbreviation: 'jam',
      value: 0.0,
    ),
    Unit(
      index: 10,
      title: 'Menit',
      abbreviation: 'menit',
      value: 0.0,
    ),
    Unit(
      index: 11,
      title: 'Detik',
      abbreviation: 'detik',
      value: 0.0,
    ),
  ];
}
