import 'package:devcode_flutter_starter/data/model/contact_model.dart';
import 'package:flutter/material.dart';

class ListContactItem extends StatelessWidget {
  final ContactItem contact;

  const ListContactItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('item-card'),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1), offset: const Offset(0, 6), blurRadius: 10, spreadRadius: 0
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contact.fullName ?? '', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
          const SizedBox(height: 6,),
          Text('${contact.phoneNumber ?? ''} | ${contact.email ?? ''}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
        ],
      ),
    );
  }
}
