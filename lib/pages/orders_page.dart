import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'custom_drawer.dart';
import 'location_service.dart';

class DeliveryTrackingMap extends StatefulWidget {
  final String orderId;
  
  const DeliveryTrackingMap({super.key, required this.orderId});

  @override
  State<DeliveryTrackingMap> createState() => _DeliveryTrackingMapState();
}

class _DeliveryTrackingMapState extends State<DeliveryTrackingMap> {
  GoogleMapController? mapController;
  Position? currentPosition;
  final LatLng deliveryGuyPosition = const LatLng(6.5874, 79.9619);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      
      if (permission == LocationPermission.denied) {
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        currentPosition = position;
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking Order ${widget.orderId}'),
        backgroundColor: const Color(0xFF06C167),
      ),
      body: currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: LatLng(currentPosition!.latitude, currentPosition!.longitude),
                  infoWindow: const InfoWindow(title: 'Your Location'),
                ),
                Marker(
                  markerId: const MarkerId('deliveryGuy'),
                  position: deliveryGuyPosition,
                  infoWindow: const InfoWindow(title: 'Delivery Partner'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
    );
  }
}

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final LocationService _locationService = LocationService();
  final List<Map<String, dynamic>> orders = [
    {
      'id': 'OD001',
      'status': 'Delivered',
      'date': '2024-10-18',
      'time': '12:30 PM',
      'total': '\$45.99',
      'items': [
        {'name': 'Burger', 'quantity': 2, 'price': '\$10.99'},
        {'name': 'Fries', 'quantity': 1, 'price': '\$5.50'},
        {'name': 'Coke', 'quantity': 2, 'price': '\$2.50'}
      ]
    },
    {
      'id': 'OD002',
      'status': 'In Progress',
      'date': '2024-10-17',
      'time': '6:45 PM',
      'total': '\$29.99',
      'items': [
        {'name': 'Pizza', 'quantity': 1, 'price': '\$15.99'},
        {'name': 'Garlic Bread', 'quantity': 1, 'price': '\$4.50'},
        {'name': 'Lemonade', 'quantity': 2, 'price': '\$3.50'}
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _locationService.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
      body: ListView.builder(
        itemCount: orders.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final order = orders[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ExpansionTile(
                    leading: _getStatusIcon(order['status']),
                    title: Text(
                      'Order ID: ${order['id']}',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status: ${order['status']}',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Date: ${order['date']} - ${order['time']}',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Total: ${order['total']}',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    children: order['items'].map<Widget>((item) {
                      return ListTile(
                        tileColor: const Color(0xFFF5F5F5),
                        title: Text(
                          item['name'],
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Quantity: ${item['quantity']}',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        trailing: Text(
                          item['price'],
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  if (order['status'] == 'In Progress')
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeliveryTrackingMap(
                                  orderId: order['id'],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF06C167),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Track Order',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getStatusIcon(String status) {
    if (status == 'Delivered') {
      return const Icon(Icons.check_circle, color: Color(0xFF006400));
    } else if (status == 'In Progress') {
      return const Icon(Icons.local_shipping, color: Color(0xFFFF8C00));
    } else {
      return const Icon(Icons.cancel, color: Colors.red);
    }
  }
}