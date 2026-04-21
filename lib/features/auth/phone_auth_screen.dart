import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../providers/auth_provider.dart';
import '../../core/theme/app_colors.dart';

class PhoneAuthScreen extends ConsumerStatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  ConsumerState<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends ConsumerState<PhoneAuthScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  String? _verificationId;
  bool _codeSent = false;
  bool _isLoading = false;

  void _sendOtp() async {
    String number = _phoneController.text.trim();
    if (number.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a phone number')));
      return;
    }

    // Remove leading zero if present (e.g., 0300 -> 300)
    if (number.startsWith('0')) {
      number = number.substring(1);
    }

    // Basic validation for Pakistan mobile numbers (usually 10 digits after prefix)
    if (number.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a valid 10-digit number')));
      return;
    }

    final fullNumber = '+92$number';

    setState(() => _isLoading = true);
    final authService = ref.read(authServiceProvider);
    
    await authService.verifyPhoneNumber(
      phoneNumber: fullNumber,
      verificationCompleted: (credential) async {
        await authService.signInWithCredential(credential);
        if (!mounted) return;
        context.go('/profile-setup');
      },
      verificationFailed: (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'Verification failed')));
      },
      codeSent: (verificationId, resendToken) {
        setState(() {
          _verificationId = verificationId;
          _codeSent = true;
          _isLoading = false;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void _verifyOtp() async {
    if (_verificationId == null) return;
    setState(() => _isLoading = true);
    
    final authService = ref.read(authServiceProvider);
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: _otpController.text,
    );
    
    try {
      await authService.signInWithCredential(credential);
      if (!mounted) return;
      context.go('/profile-setup');
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid OTP')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'GupShup will need to verify your phone number.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            if (!_codeSent)
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '300 1234567',
                  labelText: 'Phone Number',
                  prefixText: '+92 ',
                  prefixStyle: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  border: const OutlineInputBorder(),
                ),
              )
            else
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '123456',
                  labelText: 'OTP Code',
                  border: OutlineInputBorder(),
                ),
              ),
            const Spacer(),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: _codeSent ? _verifyOtp : _sendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(_codeSent ? 'NEXT' : 'SEND OTP'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
