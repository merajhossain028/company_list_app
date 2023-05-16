import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/create_company_api.dart';
import '../../provider/home.provider.dart';

Future<void> showInformationDialog(BuildContext context) async {
  return await showDialog(
      context: context, builder: (_) => const MainPopupDialog());
}

class MainPopupDialog extends ConsumerWidget {
  const MainPopupDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      icon: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.close,
            color: Color(0xFF122333),
          ),
        ),
      ),
      iconPadding: EdgeInsets.zero,
      title: const Text(
        "Create a New Company",
        style: TextStyle(
          color: Color(0xFF122333),
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Form(
        key: ref.watch(formProvider),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            TextFormField(
              controller: ref.watch(textCntrlrPd('name')),
              validator: (value) =>
                  value!.isNotEmpty ? null : "Invalid Company Name",
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Company Name"),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: ref.watch(textCntrlrPd('email')),
              validator: (value) {
                return value!.isNotEmpty ? null : "Invalid Work Email";
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Work Email"),
            ),
            const SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              controller: ref.watch(textCntrlrPd('password')),
              validator: (value) {
                return value!.isNotEmpty ? null : "Invalid Password";
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: ref.watch(textCntrlrPd('phone')),
              validator: (value) {
                return value!.isNotEmpty ? null : "Invalid Phone Number";
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Phone Number"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(311, 45),
                backgroundColor: const Color(0xFF25A5A3),
              ),
              onPressed: () async {
                if (ref.watch(formProvider).currentState!.validate()) {
                  await createCompany(
                    context,
                    ref.read(textCntrlrPd('name')).text,
                    ref.read(textCntrlrPd('email')).text,
                    ref.read(textCntrlrPd('password')).text,
                    ref.read(textCntrlrPd('phone')).text,
                  ).then((_) => Navigator.of(context).pop());
                }
              },
              child: const Text(
                'Create a New Company',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
