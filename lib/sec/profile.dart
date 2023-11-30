import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileUser {
  late String name;
  late String email;
  late String phone;
  late String description;

  ProfileUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.description,
  });

  ProfileUser.copy(ProfileUser other) {
    name = other.name;
    email = other.email;
    phone = other.phone;
    description = other.description;
  }
}

class UserProfileScreen extends StatefulWidget {
  ProfileUser user;
  final Function(ProfileUser) onSave;

  UserProfileScreen(this.user, this.onSave);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState(onSave: onSave);
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Function(ProfileUser) onSave;

  _UserProfileScreenState({required this.onSave});

  late ProfileUser _editedUser;

  @override
  void initState() {
    super.initState();
    _editedUser = ProfileUser.copy(widget.user);
  }

  void _saveChanges(ProfileUser editedUser) {
    setState(() {
      widget.user = editedUser;
    });
    // onSave(editedUser); // Call the callback to save changes in the original page.
    // Navigator.pop(context);
  }

  void _logOut() {
    // Implement your log out functionality here
    // Typically, you would clear the user's session and navigate to the login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xFF31496B),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text('Profile',
        style: TextStyle(
      color: Colors.white,
      fontSize: 15, // Adjust the font size according to your preference
       // You can adjust the fontWeight as well
    ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit,color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(
                    _editedUser,
                        (editedUser) {
                      _saveChanges(editedUser);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: Container(
        color: Colors.white, // Set the background color you want
        child: Column(
          children: <Widget>[
            // User Profile Picture
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(4.0), // Optional: Adjust the padding based on your preference
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade400, // Set the border color
                      width: 4.0, // Set the border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/sislogo.png'), // Replace with your image path
                  ),
                ),
              ),
            ),
            // Personal Information section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text(widget.user.name),
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(widget.user.email),
                  ),
                  ListTile(
                    title: Text('Phone'),
                    subtitle: Text(widget.user.phone),
                  ),
                ],
              ),
            ),

            // Description section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(widget.user.description),
                ],
              ),
            ),

            // Spacer to push the log out button to the bottom
            Spacer(),

            // Log Out button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                ),
    onPressed: () {
      // Add your action here
    },
    child: Text('Log Out', style: TextStyle(fontSize: 16)),
  ),
          ),
        ],
      ),
    ));
  }
}

class EditProfileScreen extends StatefulWidget {
  final ProfileUser user;
  final Function(ProfileUser) onSave;

  EditProfileScreen(this.user, this.onSave);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState(onSave: onSave);
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Function(ProfileUser) onSave;

  _EditProfileScreenState({required this.onSave});

  late ProfileUser _editedUser;
  XFile? _selectedImage; // Store the selected image file

  @override
  void initState() {
    super.initState();
    _editedUser = ProfileUser.copy(widget.user);
  }

  void _saveChanges() {
    onSave(_editedUser); // Pass the edited user data to the callback.
    Navigator.pop(context, _editedUser);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xFF31496B),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text('Edit Profile',
        style: TextStyle(
      color: Colors.white,
      fontSize: 15, // Adjust the font size according to your preference
       // You can adjust the fontWeight as well
    ),
        ),
      ),
      body: _buildEditMode(),
    );
  }

  Widget _buildEditMode() {
    return Column(
      children: <Widget>[
        // User Profile Picture
        if (_selectedImage != null)
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: FileImage(File(_selectedImage!.path)),
            ),
          )
        else
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(4.0), // Optional: Adjust the padding based on your preference
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade400, // Set the border color
                      width: 4.0, // Set the border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/sislogo.png'), // Replace with your image path
                  ),
                ),
              ),
            ),
        // Change Profile Picture Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 primary: Colors.grey, 
                 onPrimary: Colors.white, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                 ),
             elevation: 4, 
             ),
    onPressed: () {
      // Add your action here
    },
    child: Text('Change Profile Picture', style: TextStyle(fontSize: 16)),
  ),
        ),

        // Rest of the editing fields (Name, Email, Phone, Description)
        ListTile(
          title: Text('Name'),
          subtitle: TextFormField(
            initialValue: _editedUser.name,
            onChanged: (value) {
              _editedUser.name = value;
            },
          ),
        ),
        ListTile(
          title: Text('Email'),
          subtitle: TextFormField(
            initialValue: _editedUser.email,
            onChanged: (value) {
              _editedUser.email = value;
            },
          ),
        ),
        ListTile(
          title: Text('Phone'),
          subtitle: TextFormField(
            initialValue: _editedUser.phone,
            onChanged: (value) {
              _editedUser.phone = value;
            },
          ),
        ),
        ListTile(
          title: Text('Description'),
          subtitle: TextFormField(
            initialValue: _editedUser.description,
            onChanged: (value) {
              _editedUser.description = value;
            },
          ),
        ),

        // Save button to save changes
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 primary: Colors.grey, 
                 onPrimary: Colors.white, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                 ),
             elevation: 4, 
             ),
    onPressed: () {
      // Add your action here
    },
    child: Text('Save Changes', style: TextStyle(fontSize: 16)),
  ),
        ),
      ],
    );
  }
}
