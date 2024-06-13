import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/navbar/custom_bottom_navbar.dart';
import '../../riverpod/main_scaffold_riverpod.dart';

final mainScaffoldRiverpod =
    ChangeNotifierProvider((ref) => MainScaffoldRiverpod());

class MainScaffold extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomNavbar(),
      body: ref.watch(mainScaffoldRiverpod).body(),
    );
  }
}
