import 'package:devcode_flutter_starter/data/enums/enums.dart';
import 'package:devcode_flutter_starter/data/model/contact_model.dart';
import 'package:devcode_flutter_starter/data/repository/contact_repository.dart';
import 'package:get/get.dart';

class RetrieveDataController extends GetxController {
  // .obs berarti variabel ini bersifat observable (perubahan data melalui stream)
  final contactStatus = RequestStatus.IDLE.obs;
  final contacts = <ContactItem>[].obs;

  final contactRepository = ContactRepositoryImpl();

  void getContacts() async {
    contactStatus(RequestStatus.LOADING);
    final data = await contactRepository.getContact();
    contactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);
  
    data.fold((left) {}, (right) => contacts.assignAll(right));
  }

  @override
  void onInit() {
    getContacts();

    super.onInit();
  }
}