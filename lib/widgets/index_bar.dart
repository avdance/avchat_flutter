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
class IndexItem{
  String text;
  int position;
  bool isSelected;

  IndexItem({this.text,this.position,this.isSelected});
}


/// IndexView
class IndexBarLayout extends StatefulWidget{

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
  final List<OnItemSelectedListener> _listeners = new List<OnItemSelectedListener>();
  final OnItemSelectedListener onSelected;

  ///需要的参数
  IndexBarLayout({Key key,
      this.dataSet = INDEX_OF_LETTERS,
      this.onSelected,
    this.itemWidth,
    this.itemHeight,
    this.color = Colors.transparent,
    this.textStyle = const TextStyle(fontSize: 11.0,color: Colors.black45),
    this.textStyleSelected = const TextStyle(fontSize: 11.0,color: Colors.black),
  });

  @override
  State<StatefulWidget> createState() {
    return _IndexItemLayoutState();
  }
}

///整个Layout.
class _IndexItemLayoutState extends State<IndexBarLayout>{

  List<Widget> _children = new List<Widget>();
  int _selectedIndex;

  int _getIndex(int offset){
    //根据位移获取到现在的Index.

  }

  @override
  void initState() {
    //state init
    widget.dataSet.forEach((index){
      //创建这些View出来.

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: _ItemView(

      ),
    );
  }

}

///实际上每一条ItemView.
class _ItemView extends StatefulWidget{

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
  _ItemView({Key key,
    @required this.itemData,
    this.onSelected,
    this.itemWidth = 16.0,
    this.itemHeight = 16.0,
    this.color = Colors.transparent,
    this.colorSelected = Colors.blue,
    this.textStyle = const TextStyle(fontSize: 11.0,color: Colors.black45),
    this.textStyleSelected = const TextStyle(fontSize: 11.0,color: Colors.black),
  });

  @override
  State<StatefulWidget> createState() {
    return _ItemViewState();
  }
}

class _ItemViewState extends State<_ItemView>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: widget.itemWidth,
        height: widget.itemHeight,
        decoration: BoxDecoration(
            color: widget.itemData.isSelected?widget.colorSelected:widget.color,
            borderRadius: BorderRadius.circular(widget.itemWidth/2)
        ),
        child: Text(widget.itemData.text,
          textAlign: TextAlign.center,
          style: widget.itemData.isSelected?widget.textStyleSelected:widget.textStyle,
        ),
      ),
    );
  }
}


///当Item选中后,回调给外部.
typedef void OnItemSelectedListener(IndexItem item);


