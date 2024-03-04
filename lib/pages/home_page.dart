import 'package:flutter/material.dart';
import 'package:memory_usage/provider/data_provider.dart';
import 'package:memory_usage/resurs/app_color.dart';
import 'package:memory_usage/resurs/app_style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerData = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackColor,
        title: Text('Home Page', style: AppStyles.appBarStyle()),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Consumer<DataProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: value.dataInformation.values.length,
            itemBuilder: (context, index) {
              return ListTile(
                onLongPress: () {
                  controllerData.text = value.dataInformation.values.toList()[index];
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.read<DataProvider>().getUpdateData(index, controllerData.value.text);
                              Navigator.pop(context);
                            },
                            child: const Text('Save'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                        title: const Text('Update'),
                        content: TextField(
                          controller: controllerData,
                          decoration: const InputDecoration(border: OutlineInputBorder()),
                        ),
                      );
                    },
                  );
                },
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(value.dataInformation.values.toList()[index]),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<DataProvider>().getRemoveUserData(index);
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            )
                          ],
                          title: const Text('Remove'),
                          content: Text('${value.dataInformation.values.toList()[index]} ushbu ma\'lumot o\'chirilsinmi'),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
