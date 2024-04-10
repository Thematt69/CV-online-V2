import 'package:flutter/material.dart';

abstract class BlocBase {
  void initState();

  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {

  BlocProvider({
    required Key key,
    required this.child,
    this.blocs = const [],
  }) : super(key: key) {
    _masterKey = key as GlobalKey;
  }
  final Widget child;
  final List<T> blocs;

  static late GlobalKey _masterKey;

  @override
  BlocProviderState createState() => BlocProviderState();

  static T of<T extends BlocBase>(BuildContext context) {
    final _BlocProviderInherited provider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited>()!
        .widget as _BlocProviderInherited;
    return provider.blocs.firstWhere((x) => x is T) as T;
  }

  static T master<T extends BlocBase>() =>
      (_masterKey.currentWidget! as BlocProvider)
          .blocs
          .firstWhere((x) => x is T) as T;
}

class BlocProviderState extends State<BlocProvider> {
  @override
  void initState() {
    super.initState();
    for (final bloc in widget.blocs) {
      bloc.initState();
    }
  }

  @override
  void dispose() {
    for (final bloc in widget.blocs) {
      bloc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited(
      blocs: widget.blocs,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited extends InheritedWidget {

  const _BlocProviderInherited({
    required super.child,
    required this.blocs,
  });
  final List<BlocBase> blocs;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
