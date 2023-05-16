import 'package:company_list_app/src/modules/home/api/comapny_data_api.dart';
import 'package:company_list_app/src/modules/home/view/popup/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Company List',
          style: TextStyle(
            color: Color(0xFF122333),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ref.watch(getComapnyDataProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const Center(child: Text('Something went wrong')),
            data: (data) {
              return ListView.builder(
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          bottom: 20.0,
                          left: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?[index].companyName ?? '',
                              style: const TextStyle(
                                color: Color(0xFF122333),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data?[index].email ?? '',
                              style: const TextStyle(
                                color: Color(0xFF122333),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data?[index].phone ?? '',
                              style: const TextStyle(
                                color: Color(0xFF122333),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              );
            },
          ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF25A5A3),
        onPressed: () async => await showInformationDialog(context),
        label: const Text('Create Company'),
      ),
    );
  }
}
