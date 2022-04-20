import 'package:flutter/cupertino.dart';
import 'package:flutter_folder/services/base_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BaseView({required this.builder, required this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  @override
  void initState() {
    if (widget.onModelReady != null) {
      // widget.onModelReady(  );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
