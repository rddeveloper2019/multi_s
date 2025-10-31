import 'package:flutter/material.dart';
import 'package:multi_s/categories/men_category.dart';
import 'package:multi_s/widgets/fake_search_bar.dart';

List<ItemData> items = [
  ItemData(label: 'men'),
  ItemData(label: 'women'),
  ItemData(label: 'electronics'),
  ItemData(label: 'accessories'),
  ItemData(label: 'shoes'),
  ItemData(label: 'home & garden'),
  ItemData(label: 'beauty'),
  ItemData(label: 'kids'),
  ItemData(label: 'bags'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _activeIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const FakeSearchBar(),
      ),
      body: Stack(
        children: [
          SideNavigator(
            activeIdx: _activeIdx,
            onTapChange: (idx) {
              setState(() {
                _activeIdx = idx;
              });
            },
          ),
          CategoryView(
            activeIdx: _activeIdx,
            onPageChange: (idx) {
              setState(() {
                _activeIdx = idx;
              });
            },
          ),
        ],
      ),
    );
  }
}

class SideNavigator extends StatelessWidget {
  final int activeIdx;
  final void Function(int) onTapChange;

  const SideNavigator({
    super.key,
    required this.onTapChange,
    required this.activeIdx,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      child: SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.2,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, idx) {
            return GestureDetector(
              onTap: () => onTapChange(idx),
              child: Container(
                height: 100,
                color: idx == activeIdx ? Colors.white : Colors.grey.shade300,
                child: Center(child: Text(items[idx].label)),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryView extends StatefulWidget {
  final int activeIdx;
  final void Function(int) onPageChange;

  const CategoryView({
    super.key,
    required this.activeIdx,
    required this.onPageChange,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late PageController _pageCtrl;
  bool _isChangingPageProgrammatically = false;

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController(initialPage: widget.activeIdx);
  }

  @override
  void didUpdateWidget(covariant CategoryView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeIdx != widget.activeIdx) {
      _isChangingPageProgrammatically = true;
      _pageCtrl
          .animateToPage(
            widget.activeIdx,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
          .whenComplete(() {
            if (mounted) {
              setState(() {
                _isChangingPageProgrammatically = false;
              });
            }
          });
    }
  }

  void _handlePageChanged(int index) {
    if (!_isChangingPageProgrammatically) {
      widget.onPageChange(index);
    }
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: size.height * 0.8,
        width: size.width * 0.8,
        color: Colors.white,
        child: PageView(
          controller: _pageCtrl,
          scrollDirection: Axis.vertical,
          onPageChanged: _handlePageChanged,
          children: const [
            MenCategory(),
            Center(child: Text('women category')),
            Center(child: Text('electronics category')),
            Center(child: Text('accessories category')),
            Center(child: Text('shoes category')),
            Center(child: Text('home & garden category')),
            Center(child: Text('beauty category')),
            Center(child: Text('kids category')),
            Center(child: Text('bags category')),
          ],
        ),
      ),
    );
  }
}

class ItemData {
  final String label;
  bool selected;

  ItemData({required this.label, this.selected = false});
}
