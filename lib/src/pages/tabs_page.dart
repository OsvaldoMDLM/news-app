import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabsPage'),
        ),
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegarionModel = Provider.of<_NavegationModel>(context);
    return BottomNavigationBar(
      currentIndex: navegarionModel.CurrentPage,
      onTap: (i) => navegarionModel.CurrentPage = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados')
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);
    return PageView(
      controller: navegationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Container(color: Colors.green)
      ],
    );
  }
}

class _NavegationModel with ChangeNotifier {
  int _CurrentPage = 0;
  PageController _pageController = PageController();

  int get CurrentPage => _CurrentPage;
  PageController get pageController => _pageController;

  set CurrentPage(int val) {
    this._CurrentPage = val;
    _pageController.animateToPage(val,
        duration: Duration(milliseconds: 350), curve: Curves.easeInOut);
    notifyListeners();
  }
}
