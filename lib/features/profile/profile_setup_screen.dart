import 'dart:io' if (dart.library.html) 'dart:html' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../../providers/auth_provider.dart';
import '../../models/user_model.dart';
import '../../core/theme/app_colors.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _nameController = TextEditingController();
  XFile? _imageFile;
  Uint8List? _webImage;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (kIsWeb) {
          final bytes = await pickedFile.readAsBytes();
          setState(() {
            _webImage = bytes;
            _imageFile = pickedFile;
          });
        } else {
          setState(() {
            _imageFile = pickedFile;
          });
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error picking image')),
      );
    }
  }

  void _saveProfile() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }
    
    setState(() => _isLoading = true);
    debugPrint('[ProfileSetup] Starting save profile...');
    
    try {
      final user = FirebaseAuth.instance.currentUser;
      debugPrint('[ProfileSetup] Current User: ${user?.uid}');
      
      if (user == null) {
        debugPrint('[ProfileSetup] User is null, redirecting to login');
        if (!mounted) return;
        context.go('/login');
        return;
      }

      final userModel = UserModel(
        uid: user.uid,
        phoneNumber: user.phoneNumber ?? '',
        displayName: name,
        isOnline: true,
        lastSeen: DateTime.now(),
        photoUrl: user.photoURL ?? '', 
      );
      
      debugPrint('[ProfileSetup] Saving to Firestore...');
      // Add a timeout to prevent infinite loading
      await ref.read(authServiceProvider).saveUserData(userModel).timeout(
        const Duration(seconds: 15),
        onTimeout: () => throw 'Connection timeout. Please check your internet and Firestore settings.',
      );
      
      debugPrint('[ProfileSetup] Firestore write successful!');
      if (!mounted) return;
      context.go('/home');
    } catch (e) {
      debugPrint('[ProfileSetup] Error: $e');
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save profile: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Please provide your name and an optional profile photo',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: kIsWeb 
                    ? (_webImage != null ? MemoryImage(_webImage!) : null)
                    : (_imageFile != null ? FileImage(io.File(_imageFile!.path)) : null),
                child: (_webImage == null && _imageFile == null)
                    ? const Icon(Icons.add_a_photo, size: 40, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Type your name here...',
                border: UnderlineInputBorder(),
              ),
            ),
            const Spacer(),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('NEXT'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
