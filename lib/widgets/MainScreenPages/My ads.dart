import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScreenMain extends StatefulWidget {
  @override
  MyScreenMainState createState() => MyScreenMainState();
}

class MyScreenMainState extends State<MyScreenMain>
    with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2,vsync: this );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Padding(
        padding: const EdgeInsets.only(left: 20,right:20),
        child: Column(
          children: [
            Container(
              height: 34,
              width: 325,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                border: Border.all(color: Color(0xff4B4B4B))
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Color(0xff0CCDE6),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    text: 'Активні',
                  ),
                  Tab(
                    text: 'Архів',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(
                    child: Text(
                      'Активні',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      'Архів',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
    );
  }
}