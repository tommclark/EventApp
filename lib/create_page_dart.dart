import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'create.dart';

class EventForm extends StatefulWidget {
  @override
  EventFormState createState() => EventFormState();
}

class EventFormState extends State<EventForm> {
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ticketPriceController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();

  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _streetNumberController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _additionalDetailsController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void saveEvent(Event event) async {
    final box = await Hive.openBox<Event>('events');
    await box.add(event);
    print('Contents of Hive box "events":');
    for (var i = 0; i < box.length; i++) {
      print('Key: ${box.keyAt(i)}, Value: ${box.getAt(i)}');
    }
    await box.close();
    print('Box closed');
  }

  Future<void> _selectDate(BuildContext context) async {
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
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _submitForm() {
    final event = Event(
      userID: _userIDController.text,
      name: _nameController.text,
      date: _selectedDate ?? DateTime.now(),
      time: _selectedTime ?? TimeOfDay.now(),
      location: _locationController.text,
      description: _descriptionController.text,
      ticketPrice: double.parse(_ticketPriceController.text),
      totalPrice: 0,
    );

    saveEvent(event);

    // Clear the text controllers after saving the event
    _userIDController.clear();
    _nameController.clear();
    _locationController.clear();
    _descriptionController.clear();
    _ticketPriceController.clear();
    _totalPriceController.clear();

    // Reset selected date and time
    setState(() {
      _selectedDate = null;
      _selectedTime = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _userIDController,
                decoration: InputDecoration(labelText: 'User ID'),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select Date'),
              ),
              _selectedDate != null
                  ? Text(
                'Selected Date: ${_selectedDate!.toString()}',
                style: TextStyle(fontSize: 16),
              )
                  : SizedBox(), // Show selected date if available
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: Text('Select Time'),
              ),
              _selectedTime != null
                  ? Text(
                'Selected Time: ${_selectedTime!.format(context)}',
                style: TextStyle(fontSize: 16),
              )
                  : SizedBox(), // Show selected time if available
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
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: _ticketPriceController, // Use the ticket price controller here
                keyboardType: TextInputType.numberWithOptions(decimal: true), // Allow decimal input
                decoration: InputDecoration(labelText: 'Ticket Price'),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Event'),
              ),
            ],
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