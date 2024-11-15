
import 'package:flutter/material.dart';
import 'package:foodapp/pages/custom_drawer.dart';
import 'package:foodapp/pages/location_service.dart';
import 'chat_list.dart';
import 'chat.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> with SingleTickerProviderStateMixin {
  final LocationService _locationService = LocationService();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 5),
            Expanded(
              child: ListenableBuilder(
                listenable: _locationService,
                builder: (context, child) {
                  return Text(
                    _locationService.currentAddress,
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF06C167),
      ),
      drawer: const CustomDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatList(tabController: _tabController),
          Chat(tabController: _tabController),  // Fixed: Added required tabController parameter
        ],
      ),
    );
  }
}