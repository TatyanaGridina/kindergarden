import '../../router/ui/routes.dart';
import 'kids_controller.dart';

extension GoToNewKid on KidsController {
  goToNewKid() {
    usecases.goTo(route: newKidRoute);
  }
}
