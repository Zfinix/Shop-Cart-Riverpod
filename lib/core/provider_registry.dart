import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_cart/core/viewmodels/home_vm.dart';

final homeProvider = ChangeNotifierProvider((_) => HomeViewModel());
