import 'package:jikan_api/jikan_api.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// external api connection
final jikan = Provider((ref) => Jikan());