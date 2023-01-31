import 'package:devcode_flutter_starter/data/enums/enums.dart';
import 'package:devcode_flutter_starter/data/model/contact_model.dart';
import 'package:devcode_flutter_starter/data/repository/contact_repository.dart';
import 'package:get/get.dart';

class RetrieveDataController extends GetxController {
  // .obs berarti variabel ini bersifat observable (perubahan data melalui stream)
  final contactStatus = RequestStatus.IDLE.obs;
  final contacts = <ContactItem>[].obs;

  final contactRepository = ContactRepositoryImpl();

  // TODO: Uncomment code di bawah ini untuk melakukan request API mendapatkan list contact.
  // void getContacts() async {
  //   contactStatus(RequestStatus.LOADING);
  //   final data = await contactRepository.getContact();
  //   // Code di bawah ini adalah inline condition atau biasa disebut ternary condition.
  //   // [.isLeft()] merupakan method bawaaan dari package [dartz] untuk mengetahui status error
  //   contactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);
  //
  //   data.fold((left) {}, (right) => contacts.assignAll(right));
  // }

  @override
  void onInit() {
    // TODO: Uncomment code di bawah ini untuk memanggil method getContacts()
    // getContacts();

    super.onInit();
  }
}