import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formProvider = Provider((_) => GlobalKey<FormState>());


final textCntrlrPd = Provider.family((ref, String _) {
  final cntrlr = TextEditingController();
  ref.onDispose(() => cntrlr.dispose());
  return cntrlr;
});