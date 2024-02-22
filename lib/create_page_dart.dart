import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _streetNumberController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _additionalDetailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Creation'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.withOpacity(0.1), Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Text(
                      'Event Creation',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _userIDController,
                  decoration: InputDecoration(
                    labelText: 'User ID',
                    hintText: 'Enter your User ID',
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter the Event Name',
                  ),
                ),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                      helpText: 'Select Event Date',
                      cancelText: 'Cancel',
                      confirmText: 'OK',
                      errorFormatText: 'Invalid date format',
                      errorInvalidText: 'Invalid date',
                    );

                    if (pickedDate != null) {
                      setState(() {
                        _dateController.text = pickedDate.toString().substring(0, 10);
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'The Date that will take place for this event',
                  ),
                ),
                TextFormField(
                  controller: _timeController,
                  readOnly: true,
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        _timeController.text = pickedTime.format(context);
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Time',
                    hintText: 'Enter the Starting Time',
                  ),
                ),
                TextFormField(
                  controller: _locationController,
                  readOnly: true,
                  onTap: () {
                    _showLocationDialog(context, _streetNameController, _streetNumberController, _postalCodeController,
                        _additionalDetailsController, _locationController);
                  },
                  decoration: InputDecoration(
                    labelText: 'Location',
                    hintText: 'Select the Location for this event',
                  ),
                ),
                /*TextFormField(
                  controller: _locationController,
                  /*readOnly: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(locationController: _locationController),
                      ),
                    );
                  },*/
                  decoration: InputDecoration(
                    labelText: 'Location',
                    hintText: 'Select the Location for this event',
                  ),
                ),*/
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Say more about this Event in-details..',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder for button functionality
                  },
                  child: Text('Create Event'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void _showLocationDialog(BuildContext context, TextEditingController streetNameController,
    TextEditingController streetNumberController, TextEditingController postalCodeController,
    TextEditingController additionalDetailsController, TextEditingController locationController) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter Location Details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Street Name',
                ),
                controller: streetNameController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Street Number',
                ),
                controller: streetNumberController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                ),
                controller: postalCodeController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Additional Details',
                ),
                maxLines: 3,
                controller: additionalDetailsController,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Get the text from the controllers and concatenate them
              String locationDetails = (streetNameController.text.isNotEmpty ? streetNameController.text + ', ' : '') +
                  (streetNumberController.text.isNotEmpty ? streetNumberController.text + ', ' : '') +
                  (postalCodeController.text.isNotEmpty ? postalCodeController.text + ', ' : '') +
                  additionalDetailsController.text;

              // Update the location controller with the concatenated details
              locationController.text = locationDetails.trim();

              // Close the dialog
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}



/* class MapScreen extends StatefulWidget {
  final TextEditingController locationController;

  MapScreen({required this.locationController});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        actions: [
          IconButton(
            onPressed: () async {
              if (_mapController != null) {
                final LatLngBounds visibleRegion = await _mapController!.getVisibleRegion();
                final LatLng center = LatLng(
                  (visibleRegion.southwest.latitude + visibleRegion.northeast.latitude) / 2,
                  (visibleRegion.southwest.longitude + visibleRegion.northeast.longitude) / 2,
                );
                Navigator.pop(context, center);
              }
            },
            icon: Icon(Icons.done),
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 15,
        ),
        onTap: (LatLng position) {
          widget.locationController.text = '${position.latitude}, ${position.longitude}';
        },
      ),
    );
  }
}*/