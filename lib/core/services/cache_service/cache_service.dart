// import 'dart:async';
// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:balance_project/imports.dart';
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';
// import 'package:sqlite3/sqlite3.dart';
// import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
//
// part 'cache_service.g.dart';
//
// @DriftDatabase(tables: <Type>[Cache])
// class CacheService extends _$CacheService {
//   CacheService() : super(_openConnection());
//
//   int get schemaVersion => 1;
//
//   // Future<int> insertToCache(CacheCompanion cacheCompanion) async {
//   //   return into(cache).insertOnConflictUpdate(cacheCompanion);
//   // }
//   Future<int> insertToCache(CacheCompanion cacheCompanion) async {
//     try {
//       print('Inserting into cache: ${cacheCompanion.url.value}');
//       return await into(cache)
//           .insert(cacheCompanion, mode: InsertMode.insertOrReplace);
//     } catch (e) {
//       if (e is SqliteException && e.extendedResultCode == 2067) {
//         print('Unique constraint failed for url: ${cacheCompanion.url.value}');
//         return -1; // Indicate failure or handle accordingly
//       } else {
//         rethrow;
//       }
//     }
//   }
//
//   Future<Either<Failure, CacheEntry>> getCache(String url) async {
//     CacheEntry? query = await (select(cache)
//           ..where(($CacheTable tbl) => tbl.url.equals(url)))
//         .getSingleOrNull();
//     if (query != null) {
//       bool isDeleted = await clearExpiredCache(url);
//
//       if (isDeleted) {
//         return left(CustomFailure(<String>['No Cache found']));
//       } else {
//         return right(query);
//       }
//     } else {
//       return left(CustomFailure(<String>['No Cache found']));
//     }
//   }
//
//   Future<int> updateCache(String url, String response, DateTime expiration) {
//     return (update(cache)..where(($CacheTable t) => t.url.equals(url))).write(
//       CacheCompanion(
//         response: Value(response),
//         expiration: Value(expiration),
//       ),
//     );
//   }
//
//   Future<bool> clearExpiredCache(String url) async {
//     // CacheEntry? record =  await (select(cache)..where(($CacheTable tbl) => tbl.url.equals(url))).getSingleOrNull();
//     // if(record !=null) {
//     //   print('Remaining Time in cache : ${record.expiration.difference(DateTime.now()).inSeconds}');
//     // }
//     bool isDeleted = false;
//     delete(cache)
//       ..where(($CacheTable tbl) =>
//           tbl.url.equals(url) &
//           tbl.expiration.isBiggerThanValue(DateTime.now()).not())
//       ..go().then((int value) {
//         if (value > 0) {
//           LoggerService.logSuccess('cleared : ${value}');
//           isDeleted = true;
//         } else {
//           LoggerService.logError('not yet expired');
//           isDeleted = false;
//         }
//       });
//     return isDeleted;
//   }
// }
//
// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final Directory dbFolder = await getApplicationDocumentsDirectory();
//     final File file = File(p.join(dbFolder.path, 'cache.sqlite'));
//
//     // Also work around limitations on old Android versions
//     if (Platform.isAndroid) {
//       await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
//     }
//
//     // Make sqlite3 pick a more suitable location for temporary files - the
//     // one from the system may be inaccessible due to sandboxing.
//     final String cachebase = (await getTemporaryDirectory()).path;
//     // We can't access /tmp on Android, which sqlite3 would try by default.
//     // Explicitly tell it about the correct temporary directory.
//     sqlite3.tempDirectory = cachebase;
//
//     return NativeDatabase.createInBackground(file);
//   });
// }
