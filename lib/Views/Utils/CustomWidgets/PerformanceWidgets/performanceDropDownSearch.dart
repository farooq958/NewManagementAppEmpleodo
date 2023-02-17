import 'package:flutter/material.dart';

class FlutterDropdownSearch extends StatefulWidget {
  final TextEditingController? textController;
  final String? hintText;
  final List<String>? items;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? dropdownTextStyle;
  final IconData? suffixIcon;
  final double? dropdownHeight;
  final Color? dropdownBgColor;
  final InputBorder? textFieldBorder;
  final EdgeInsetsGeometry? contentPadding;

  const FlutterDropdownSearch({
    required this.textController,
    this.hintText,
    required this.items,
    this.hintStyle,
    this.style,
    this.dropdownTextStyle,
    this.suffixIcon,
    this.dropdownHeight,
    this.dropdownBgColor,
    this.textFieldBorder,
    this.contentPadding
  });

  @override
  _FlutterDropdownSearchState createState() => _FlutterDropdownSearchState();
}

class _FlutterDropdownSearchState extends State<FlutterDropdownSearch> {
  bool _isTapped=false;
  List<String> _filteredList=[];
  List<String> _subFilteredList=[];

  @override
  initState(){
    super.initState();
    _filteredList=widget.items!;
    _subFilteredList=_filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //shrinkWrap: true,
      children: [
        ///Text Field
        TextFormField(

          controller: widget.textController,
          onChanged: (val){
            setState(() {
              _filteredList = _subFilteredList.where((element) =>
                  element.toLowerCase().contains(widget.textController!.text.toLowerCase())).toList();
            if(_filteredList.isEmpty){

              _filteredList.add("No Items");
            }
            });

          },
          validator: (val)=>val!.isEmpty?'Field can\'t empty':null,
          style: widget.style??TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16.0
          ),
          onTap: ()=> setState(()=>_isTapped=true),
          decoration: InputDecoration(
              border: widget.textFieldBorder?? const UnderlineInputBorder(),
              hintText: widget.hintText??"Write here...",
              hintStyle: widget.hintStyle??const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey
              ),
              suffixIcon: InkWell(

                  onTap: (){
                   // print('here');
                    FocusManager.instance.primaryFocus?.unfocus();
                   // widget.textController!.clear();
                    setState(()=>_isTapped=!_isTapped);
                    setState(()=>_filteredList=widget.items!);
                  },
                  child: Icon(widget.suffixIcon??Icons.arrow_drop_down,size: 30,color: !_isTapped?Colors.grey:Colors.blue,)),
              contentPadding: widget.contentPadding?? const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              isDense: true,


          ),
        ),
        ///Dropdown Items
        _isTapped && _filteredList.isNotEmpty? Container(
          height: widget.dropdownHeight??150.0,
          color: widget.dropdownBgColor??Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: _filteredList.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){


                  setState(()=>_isTapped=!_isTapped);
                  widget.textController!.text=_filteredList[index];
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(_filteredList[index],
                      style: widget.dropdownTextStyle??TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0
                      )),
                ),
              );
            },
          ),
        ):Container(),
      ],
    );
  }
}
