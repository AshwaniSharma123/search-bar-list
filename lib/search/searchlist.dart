import 'package:flutter/material.dart';

class searchlist extends StatefulWidget {
  @override
  _searchlistState createState() => _searchlistState();
}

class _searchlistState extends State<searchlist> {

  TextEditingController _searchview = TextEditingController();
  String _query = "" ;
  List<String> _listdata ;
  List<String> _filterlistdata ;

  @override
    void initState() {
      _searchData();
    super.initState();
    _listdata = List<String>();
    _listdata = [
       "Ashwani","Abhilasha","johny","pushkar","sanjeev","hemlata","abhinav","Ankit","Aman","Arvind","karan"];
       //_listdata.sort();  //for sorting list alphabatically
  }

   _searchData() {
    _searchview.addListener((){
         setState(() {
           _query = _searchview.text;
         });
        });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
       body: SafeArea(
       top: true,
       child: Container(
       margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: <Widget>[
       _createSearchView(),
       _performSearch()
     ],
    ),
   ),
  ),
    );
  }
  Widget _createSearchView() {
      return Container(
        //decoration: BoxDecoration(border: Border.all(width : 1.0 )),
        child: TextField(
          controller: _searchview,
          decoration: InputDecoration(
            border : OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey)
                      //borderSide: const BorderSide(),
                    ),
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey[300]),
            ),
        textAlign: TextAlign.start,
        ),
      );
    }

    //create the list //
  // Widget createListView() {
  //   return Flexible(
  //     child: ListView.builder(
  //       itemCount: _listdata.length,
  //       itemBuilder: (BuildContext context , int index){
  //         return  Card(
  //         color: Colors.green,
  //         elevation: 5.0,
  //         child:
  //        ListTile(
  //         leading: Icon(Icons.album, size: 50),
  //         title: Text('just now'),
  //         subtitle: Text('${_listdata[index]}'),
  //       ),
  //         );
  //       },
  //     ),
  //   );
  // }

//for search perform
  Widget _performSearch(){
    _filterlistdata = List<String>();
    for(int i = 0 ; i<_listdata.length; i++){
      var item = _listdata[i];

      if(item.toLowerCase().contains(_query.toLowerCase())){
        _filterlistdata.add(item);
         }
   }
   return _createfilteredListView();
  }

  //to show searched list
  Widget _createfilteredListView(){
    return Flexible(
      child: ListView.builder(
        itemCount: _filterlistdata.length,
        itemBuilder: (BuildContext context,int index){
          return  Card(
          color: Colors.grey,
          elevation: 5.0,
          child: ListTile(
                      leading: CircleAvatar(
                              child: ClipOval(
                                child: SizedBox(
                                   width:SizeConfig.blockSizeHorizontal*14.0, 
                              height: SizeConfig.blockSizeVertical*6.5,
                                  child:Icon(Icons.person, size: 30),
                                ),
                              ),
                              backgroundColor: Colors.grey,
                            ),
                      title:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                               Text('${_filterlistdata[index]}'),
                               Text(
                                  'Just now',style: TextStyle(fontSize: 14),
                                    ),
                              ],
                            ),
          subtitle: Text('hi How are you?'),
        ),  
          );
        },
      ),
    );
  }
}

