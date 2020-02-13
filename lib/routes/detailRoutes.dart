import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/foodModels.dart';

class DetailRoutes extends StatefulWidget {
  final String title;
  final FoodModels item;

  const DetailRoutes({Key key, this.title = "Detail Food", this.item}) : super(key: key);

  @override
  _DetailRoutesState createState() => _DetailRoutesState();
}

class _DetailRoutesState extends State<DetailRoutes> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name == "" ? widget.title : widget.item.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image.network(widget.item.thumbnail),
            TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  child: Text("Materials"),
                ),
                Tab(
                  child: Text("Seasonings"),
                ),
                Tab(
                  child: Text("How To"),
                )
              ],
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  ListView(
                    children: widget.item.materials.map((s) {
                      return ListTile(
                        dense: true,
                        title: Text(s),
                        leading: Icon(Icons.check),
                      );
                    }).toList(),
                  ),
                  ListView(
                    children: widget.item.seasonings.map((s) {
                      return ListTile(
                        dense: true,
                        title: Text(s),
                        leading: Icon(Icons.check),
                      );
                    }).toList(),
                  ),
                  ListView(
                    children: widget.item.howTo.map((s) {
                      return ListTile(
                        dense: true,
                        title: Text(s),
                        leading: Icon(Icons.check),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}