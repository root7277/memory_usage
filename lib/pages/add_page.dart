import 'package:flutter/material.dart';
import 'package:memory_usage/provider/data_provider.dart';
import 'package:memory_usage/resurs/app_color.dart';
import 'package:memory_usage/resurs/app_style.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackColor,
        title: Text('Add Page', style: AppStyles.appBarStyle()),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: TextField(
          controller: data,
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DataProvider>().getDataAdd(data.text);
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
