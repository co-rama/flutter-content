import 'package:myapp/scoped_models/products.dart';
import 'package:myapp/scoped_models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with ProductsModel, UserModel {}
