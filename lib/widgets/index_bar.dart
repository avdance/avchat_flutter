import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Default Index data
const List<String> INDEX_OF_LETTERS = const [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];

///IndexItem
class IndexItem {
  String text;
  int position;
  bool isSelected;

  IndexItem({this.text, this.position, this.isSelected});
}

/// IndexView
class IndexBarLayout extends StatefulWidget {
  /// index data.
  final List<String> dataSet;

  /// Index width
  final double itemWidth;

  /// Index item height
  final double itemHeight;

  /// Background color
  final Color color;

  /// IndexBar text style.
  final TextStyle textStyle;
  final TextStyle textStyleSelected;

  ///回调函数
  final OnItemSelectedListener onSelected;

  ///需要的参数
  IndexBarLayout({
    Key key,
    this.dataSet = INDEX_OF_LETTERS,
    this.onSelected,
    this.itemWidth = 16.0,
    this.itemHeight = 16.0,
    this.color = Colors.transparent,
    this.textStyle = const TextStyle(fontSize: 11.0, color: Colors.black45),
    this.textStyleSelected =
        const TextStyle(fontSize: 11.0, color: Colors.white),
  });

  @override
  State<StatefulWidget> createState() {
    return _IndexItemLayoutState();
  }
}

///整个Layout.
class _IndexItemLayoutState extends State<IndexBarLayout> {
  List<Widget> _children = new List<Widget>();

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double layoutHeight = (widget.dataSet.length * widget.itemHeight);
    for (int index = 0; index < widget.dataSet.length; index++) {
      String strKey = widget.dataSet[index];
      _children.add(_ItemView(
        itemData: IndexItem(text: strKey, position: index, isSelected: false),
        itemHeight: widget.itemHeight,
        itemWidth: widget.itemWidth,
        textStyle: widget.textStyle,
        textStyleSelected: widget.textStyleSelected,
        color: widget.color,
        colorSelected: Colors.blueAccent,
        onSelected: widget.onSelected,
      ));
    }

    ///加入回调
    void OnSelectChanged(int localy) {
      //获取到在这个View中按下的位置.
      int offsetY = (localy / (widget.itemHeight)).toInt();

      if (offsetY != _selectedIndex && offsetY < _children.length) {
        //获取到这个被按下的位置
        (_children[offsetY] as _ItemView).selectedChange(true);
        if (_selectedIndex >= 0 && _children.length > _selectedIndex) {
          (_children[_selectedIndex] as _ItemView).selectedChange(false);
        }
        _selectedIndex = offsetY;
      }
      if (widget.onSelected != null) {
        widget.onSelected((_children[_selectedIndex] as _ItemView).itemData);
      }
    }

    return GestureDetector(
      onVerticalDragDown: (DragDownDetails details) {
        OnSelectChanged(details.localPosition.dy.toInt());
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        OnSelectChanged(details.localPosition.dy.toInt());
      },
      child: Container(
        width: widget.itemWidth,
        height: layoutHeight,
        alignment: Alignment.center,
        child: Column(
          children: _children,
        ),
      ),
    );
  }
}

///实际上每一条ItemView.
class _ItemView extends StatefulWidget {
  ///需要知道的字段有
  /// Index width
  final double itemWidth;

  /// Index item height
  final double itemHeight;

  /// IndexBar text style.
  final TextStyle textStyle;
  final TextStyle textStyleSelected;

  ///自己的信息
  final IndexItem itemData;

  ///背景色
  final Color color;
  final Color colorSelected;

  final OnItemSelectedListener onSelected;

  ///需要的参数
  _ItemView({
    Key key,
    @required this.itemData,
    this.onSelected,
    this.itemWidth = 16.0,
    this.itemHeight = 16.0,
    this.color = Colors.transparent,
    this.colorSelected = Colors.blue,
    this.textStyle = const TextStyle(fontSize: 11.0, color: Colors.black45),
    this.textStyleSelected =
        const TextStyle(fontSize: 11.0, color: Colors.white),
  });

  void selectedChange(bool isSelected) {
    _currentState.setState(() {
      itemData.isSelected = isSelected;
    });
  }

  State<StatefulWidget> _currentState;

  @override
  State<StatefulWidget> createState() {
    _currentState = _ItemViewState();
    return _currentState;
  }
}

class _ItemViewState extends State<_ItemView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        width: widget.itemWidth,
        height: widget.itemHeight,
        decoration: BoxDecoration(
            color: widget.itemData.isSelected
                ? widget.colorSelected
                : widget.color,
            borderRadius: BorderRadius.circular(widget.itemWidth)),
        child: Text(
          widget.itemData.text,
          textAlign: TextAlign.center,
          style: widget.itemData.isSelected
              ? widget.textStyleSelected
              : widget.textStyle,
        ),
      ),
    );
  }
}

///当Item选中后,回调给外部.
typedef void OnItemSelectedListener(IndexItem item);
