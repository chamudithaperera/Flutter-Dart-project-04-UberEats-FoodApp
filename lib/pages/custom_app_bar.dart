import 'package:flutter/material.dart';
import 'dart:io';
import 'location_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final LocationService locationService;
  final String? profileImagePath;
  
  const CustomAppBar({
    super.key,
    required this.locationService,
    this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              listenable: locationService,
              builder: (context, child) {
                return Text(
                  locationService.currentAddress,
                  style: const TextStyle(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ),
          CircleAvatar(
            backgroundImage: profileImagePath != null
                ? FileImage(File(profileImagePath!))
                : const AssetImage('assets/profile_image.png') as ImageProvider,
          ),
        ],
      ),
      backgroundColor: const Color(0xFF06C167),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}