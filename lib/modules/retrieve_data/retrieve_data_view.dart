import 'package:devcode_flutter_starter/data/enums/enums.dart';
import 'package:devcode_flutter_starter/modules/retrieve_data/retrieve_data_controller.dart';
import 'package:devcode_flutter_starter/modules/retrieve_data/widgets/form_input.dart';
import 'package:devcode_flutter_starter/modules/retrieve_data/widgets/list_contact_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RetrieveDataView extends GetView<RetrieveDataController> {
  const RetrieveDataView({Key? key}) : super(key: key);

  Widget get _contactList {
    return Obx(() {
      return controller.contactStatus.value == RequestStatus.LOADING ?
      const Center(
        child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xff16ABF8)),
        )),
      ) :
      controller.contactStatus.value == RequestStatus.ERROR ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              controller.getContacts();
            },
            child: const Icon(Icons.refresh, size: 24,),
          ),
        ],
      ) :
      controller.contacts.isEmpty ?
      const Center(child: Text('Data contact kosong!', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),)) :
      ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (_, index) {
          final data = controller.contacts[index];

          return ListContactItem(contact: data,);
        },
        separatorBuilder: (_, __) => const Divider(height: 9, color: Colors.transparent,),
        itemCount: controller.contacts.length,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: AppBar().preferredSize.height,),
          Column(
            children: [
              const Text('Devcode Contact Manager', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24), key: Key('header-title'),),
              const SizedBox(height: 24,),
              FormInput(title: 'Nama Lengkap', hint: 'Masukkan Nama Lengkap', key: const Key('input-nama'), onChanged: (value) {}, textInputType: TextInputType.text),
              const SizedBox(height: 8,),
              FormInput(title: 'No. Telepon', hint: 'Masukkan Nomor Telepon', key: const Key('input-telepon'), onChanged: (value) {}, textInputType: TextInputType.text),
              const SizedBox(height: 8,),
              FormInput(title: 'Email', hint: 'Masukkan Email', key: const Key('input-email'), onChanged: (value) {}, textInputType: TextInputType.text),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      key: const Key('btn-submit'),
                      onPressed: () {
                      },
                      child: const Text('Simpan',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.green,
                        // minimumSize: Size(double.infinity, minimumSize ?? 50),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ).marginSymmetric(horizontal: 16),
          Expanded(
            child: _contactList,
          )
        ],
      ),
    );
  }
}
