import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  const ContactListScreen({super.key});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    try {
      if (!await FlutterContacts.requestPermission()) {
        setState(() => _permissionDenied = true);
      } else {
        final contacts = await FlutterContacts.getContacts(withProperties: true);
        setState(() => _contacts = contacts);
      }
    } catch (e) {
      setState(() => _permissionDenied = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select contact'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: _permissionDenied
          ? const Center(child: Text('Permission denied or not supported on this platform'))
          : _contacts == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _contacts!.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ListTile(
                        leading: const CircleAvatar(backgroundColor: AppColors.accent, child: Icon(Icons.group, color: Colors.white)),
                        title: const Text('New group'),
                        onTap: () => context.push('/create-group'),
                      );
                    }
                    if (index == 1) {
                      return ListTile(
                        leading: const CircleAvatar(backgroundColor: AppColors.accent, child: Icon(Icons.person_add, color: Colors.white)),
                        title: const Text('New contact'),
                        trailing: const Icon(Icons.qr_code),
                        onTap: () => context.push('/qr-scanner'),
                      );
                    }
                    final contact = _contacts![index - 2];
                    return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(contact.displayName),
                      subtitle: Text(contact.phones.isNotEmpty ? (contact.phones.first.number) : ''),
                      onTap: () {
                        context.pop();
                      },
                    );
                  },
                ),
    );
  }
}
