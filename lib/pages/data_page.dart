import 'package:flutter/cupertino.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("data page"),
      ),
    );
  }
}
