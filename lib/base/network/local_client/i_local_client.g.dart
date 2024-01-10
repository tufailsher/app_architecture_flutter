// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'i_local_client.dart';

// // **************************************************************************
// // FloorGenerator
// // **************************************************************************

// // ignore: avoid_classes_with_only_static_members
// class $FloorAppDatabase {
//   /// Creates a database builder for a persistent database.
//   /// Once a database is built, you should keep a reference to it and re-use it.
//   static _$AppDatabaseBuilder databaseBuilder(String name) =>
//       _$AppDatabaseBuilder(name);

//   /// Creates a database builder for an in memory database.
//   /// Information stored in an in memory database disappears when the process is killed.
//   /// Once a database is built, you should keep a reference to it and re-use it.
//   static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
//       _$AppDatabaseBuilder(null);
// }

// class _$AppDatabaseBuilder {
//   _$AppDatabaseBuilder(this.name);

//   final String? name;

//   final List<Migration> _migrations = [];

//   Callback? _callback;

//   /// Adds migrations to the builder.
//   _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
//     _migrations.addAll(migrations);
//     return this;
//   }

//   /// Adds a database [Callback] to the builder.
//   _$AppDatabaseBuilder addCallback(Callback callback) {
//     _callback = callback;
//     return this;
//   }

//   /// Creates the database and initializes it.
//   Future<AppDatabase> build() async {
//     final path = name != null
//         ? await sqfliteDatabaseFactory.getDatabasePath(name!)
//         : ':memory:';
//     final database = _$AppDatabase();
//     database.database = await database.open(
//       path,
//       _migrations,
//       _callback,
//     );
//     return database;
//   }
// }

// class _$AppDatabase extends AppDatabase {
//   _$AppDatabase([StreamController<String>? listener]) {
//     changeListener = listener ?? StreamController<String>.broadcast();
//   }

//   PsyAboutModelDao? _psyAboutModelDaoInstance;

//   PsyJournalDao? _psyJournalDaoInstance;

//   AlreadyAnsweredQuestionDao? _alreadyAnsweredQuestionDaoInstance;

//   PersonalityQuestionModelDao? _personalityDaoInstance;

//   PersonalityResultDao? _personalityResultDaoInstance;

//   PsySelfHarmDao? _psySelfHarmDaoInstance;

//   AffirmationUserCategoriesDao? _affirmationUserCategoriesDaoInstance;

//   HomeCategoryMainPageVideoDao? _homeCategoryMainPageVideoDaoInstance;


//   EServicesMetaDao? _businessCenterMetaDaoInstance;

//   // BusinessCenterSliderDao? _businessCenterSliderDaoInstance;

//   Future<sqflite.Database> open(
//     String path,
//     List<Migration> migrations, [
//     Callback? callback,
//   ]) async {
//     final databaseOptions = sqflite.OpenDatabaseOptions(
//       version: 1,
//       onConfigure: (database) async {
//         await database.execute('PRAGMA foreign_keys = ON');
//         await callback?.onConfigure?.call(database);
//       },
//       onOpen: (database) async {
//         await callback?.onOpen?.call(database);
//       },
//       onUpgrade: (database, startVersion, endVersion) async {
//         await MigrationAdapter.runMigrations(
//             database, startVersion, endVersion, migrations);

//         await callback?.onUpgrade?.call(database, startVersion, endVersion);
//       },
//       onCreate: (database, version) async {
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `PsyAboutModel` (`title` TEXT, `description` TEXT, `image` TEXT, `encodedCheckPoints` TEXT, `encodedImages` TEXT, `createdAt` TEXT, `updatedAt` TEXT, `id` TEXT, PRIMARY KEY (`id`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `JournalQuestions` (`question` TEXT, `sId` TEXT, `createdAt` TEXT, `answer` TEXT, `updatedAt` TEXT, `parsedDate` TEXT, `createdDate` TEXT, `formattedTime` TEXT, PRIMARY KEY (`sId`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `AnswersSubmittedToday` (`questionId` TEXT, `date` INTEGER, PRIMARY KEY (`questionId`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `PersonalityQuestionModel` (`question` TEXT, `enCodedOptions` TEXT, `answer` TEXT, `sId` TEXT, `createdAt` TEXT, `testId` TEXT, `updatedAt` TEXT, `selected` TEXT, PRIMARY KEY (`sId`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `PersonalityResult` (`criteriaName` TEXT NOT NULL, `value` REAL, `testId` TEXT, `id` TEXT NOT NULL, PRIMARY KEY (`id`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `SelfHarmCategory` (`title` TEXT, `image` TEXT, `createdAt` TEXT, `updatedAt` TEXT, `id` TEXT, PRIMARY KEY (`id`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `AffirmationCategory` (`title` TEXT, `createdAt` TEXT, `updatedAt` TEXT, `id` TEXT, PRIMARY KEY (`id`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `HomeVideoModel` (`thumbnail` TEXT, `video` TEXT, `type` TEXT, `createdAt` TEXT, `aboutTitle` TEXT, `aboutDescription` TEXT, `aboutVideo` TEXT, `updatedAt` TEXT, `id` TEXT, PRIMARY KEY (`id`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `ChoreProfileImagesModel` (`base64Image` TEXT, `createdAt` TEXT, `updatedAt` TEXT, `id` TEXT, `title` TEXT, PRIMARY KEY (`id`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `EServicesMetaData` (`benefit` TEXT, `description` TEXT, `createdAt` TEXT, `updatedAt` TEXT, `type` TEXT, `id` TEXT, PRIMARY KEY (`id`))');
//         await database.execute(
//             'CREATE TABLE IF NOT EXISTS `EServicesSliderImageModel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `image` TEXT, `title` TEXT, `description` TEXT, `type` TEXT)');

//         await callback?.onCreate?.call(database, version);
//       },
//     );
//     return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
//   }

//   @override
//   PsyAboutModelDao get psyAboutModelDao {
//     return _psyAboutModelDaoInstance ??=
//         _$PsyAboutModelDao(database, changeListener);
//   }

//   @override
//   PsyJournalDao get psyJournalDao {
//     return _psyJournalDaoInstance ??= _$PsyJournalDao(database, changeListener);
//   }

//   @override
//   AlreadyAnsweredQuestionDao get alreadyAnsweredQuestionDao {
//     return _alreadyAnsweredQuestionDaoInstance ??=
//         _$AlreadyAnsweredQuestionDao(database, changeListener);
//   }

//   @override
//   PersonalityQuestionModelDao get personalityDao {
//     return _personalityDaoInstance ??=
//         _$PersonalityQuestionModelDao(database, changeListener);
//   }

//   @override
//   PersonalityResultDao get personalityResultDao {
//     return _personalityResultDaoInstance ??=
//         _$PersonalityResultDao(database, changeListener);
//   }

//   @override
//   PsySelfHarmDao get psySelfHarmDao {
//     return _psySelfHarmDaoInstance ??=
//         _$PsySelfHarmDao(database, changeListener);
//   }

//   @override
//   AffirmationUserCategoriesDao get affirmationUserCategoriesDao {
//     return _affirmationUserCategoriesDaoInstance ??=
//         _$AffirmationUserCategoriesDao(database, changeListener);
//   }

//   @override
//   HomeCategoryMainPageVideoDao get homeCategoryMainPageVideoDao {
//     return _homeCategoryMainPageVideoDaoInstance ??=
//         _$HomeCategoryMainPageVideoDao(database, changeListener);
//   }

//   @override
//   EServicesMetaDao get businessCenterMetaDao {
//     return _businessCenterMetaDaoInstance ??=
//         _$EServicesMetaDao(database, changeListener);
//   }

//   // @override
//   // BusinessCenterSliderDao get businessCenterSliderDao {
//   //   return _businessCenterSliderDaoInstance ??=
//   //       _$BusinessCenterSliderDao(database, changeListener);
//   // }
// }

// class _$PsyAboutModelDao extends PsyAboutModelDao {
//   _$PsyAboutModelDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _psyAboutModelInsertionAdapter = InsertionAdapter(
//             database,
//             'PsyAboutModel',
//             (PsyAboutModel item) => <String, Object?>{
//                   'title': item.title,
//                   'description': item.description,
//                   'image': item.image,
//                   'encodedCheckPoints': item.encodedCheckPoints,
//                   'encodedImages': item.encodedImages,
//                   'createdAt': item.createdAt,
//                   'updatedAt': item.updatedAt,
//                   'id': item.id
//                 }),
//         _psyAboutModelUpdateAdapter = UpdateAdapter(
//             database,
//             'PsyAboutModel',
//             ['id'],
//             (PsyAboutModel item) => <String, Object?>{
//                   'title': item.title,
//                   'description': item.description,
//                   'image': item.image,
//                   'encodedCheckPoints': item.encodedCheckPoints,
//                   'encodedImages': item.encodedImages,
//                   'createdAt': item.createdAt,
//                   'updatedAt': item.updatedAt,
//                   'id': item.id
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<PsyAboutModel> _psyAboutModelInsertionAdapter;

//   final UpdateAdapter<PsyAboutModel> _psyAboutModelUpdateAdapter;

//   @override
//   Future<List<PsyAboutModel>> getAllPsyABouts() async {
//     return _queryAdapter.queryList('SELECT * FROM PsyAboutModel',
//         mapper: (Map<String, Object?> row) => PsyAboutModel(
//             title: row['title'] as String?,
//             description: row['description'] as String?,
//             image: row['image'] as String?,
//             createdAt: row['createdAt'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             id: row['id'] as String?,
//             encodedImages: row['encodedImages'] as String?));
//   }

//   @override
//   Future<PsyAboutModel?> getPsyAboutById(String id) async {
//     return _queryAdapter.query('SELECT * FROM PsyAboutModel WHERE id = ?1',
//         mapper: (Map<String, Object?> row) => PsyAboutModel(
//             title: row['title'] as String?,
//             description: row['description'] as String?,
//             image: row['image'] as String?,
//             createdAt: row['createdAt'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             id: row['id'] as String?,
//             encodedImages: row['encodedImages'] as String?),
//         arguments: [id]);
//   }

//   @override
//   Future<List<int>> insertList(List<PsyAboutModel> abouts) {
//     return _psyAboutModelInsertionAdapter.insertListAndReturnIds(
//         abouts, OnConflictStrategy.abort);
//   }

//   @override
//   Future<int> updateList(List<PsyAboutModel> abouts) {
//     return _psyAboutModelUpdateAdapter.updateListAndReturnChangedRows(
//         abouts, OnConflictStrategy.abort);
//   }
// }

// class _$PsyJournalDao extends PsyJournalDao {
//   _$PsyJournalDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _journalQuestionsInsertionAdapter = InsertionAdapter(
//             database,
//             'JournalQuestions',
//             (JournalQuestions item) => <String, Object?>{
//                   'question': item.question,
//                   'sId': item.sId,
//                   'createdAt': item.createdAt,
//                   'answer': item.answer,
//                   'updatedAt': item.updatedAt,
//                   'parsedDate': item.parsedDate,
//                   'createdDate': item.createdDate,
//                   'formattedTime': item.formattedTime
//                 }),
//         _journalQuestionsUpdateAdapter = UpdateAdapter(
//             database,
//             'JournalQuestions',
//             ['sId'],
//             (JournalQuestions item) => <String, Object?>{
//                   'question': item.question,
//                   'sId': item.sId,
//                   'createdAt': item.createdAt,
//                   'answer': item.answer,
//                   'updatedAt': item.updatedAt,
//                   'parsedDate': item.parsedDate,
//                   'createdDate': item.createdDate,
//                   'formattedTime': item.formattedTime
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<JournalQuestions> _journalQuestionsInsertionAdapter;

//   final UpdateAdapter<JournalQuestions> _journalQuestionsUpdateAdapter;

//   @override
//   Future<List<JournalQuestions>> getJournalQuestions() async {
//     return _queryAdapter.queryList('SELECT * FROM JournalQuestions',
//         mapper: (Map<String, Object?> row) => JournalQuestions(
//             question: row['question'] as String?,
//             sId: row['sId'] as String?,
//             createdAt: row['createdAt'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             formattedTime: row['formattedTime'] as String?,
//             answer: row['answer'] as String?,
//             parsedDate: row['parsedDate'] as String?));
//   }

//   @override
//   Future<JournalQuestions?> getQuestionById(String id) async {
//     return _queryAdapter.query('SELECT * FROM JournalQuestions WHERE id = ?1',
//         mapper: (Map<String, Object?> row) => JournalQuestions(
//             question: row['question'] as String?,
//             sId: row['sId'] as String?,
//             createdAt: row['createdAt'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             formattedTime: row['formattedTime'] as String?,
//             answer: row['answer'] as String?,
//             parsedDate: row['parsedDate'] as String?),
//         arguments: [id]);
//   }

//   @override
//   Future<List<int>> insertList(List<JournalQuestions> questions) {
//     return _journalQuestionsInsertionAdapter.insertListAndReturnIds(
//         questions, OnConflictStrategy.abort);
//   }

//   @override
//   Future<int> updateList(List<JournalQuestions> questions) {
//     return _journalQuestionsUpdateAdapter.updateListAndReturnChangedRows(
//         questions, OnConflictStrategy.abort);
//   }
// }

// class _$AlreadyAnsweredQuestionDao extends AlreadyAnsweredQuestionDao {
//   _$AlreadyAnsweredQuestionDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _answersSubmittedTodayInsertionAdapter = InsertionAdapter(
//             database,
//             'AnswersSubmittedToday',
//             (AnswersSubmittedToday item) => <String, Object?>{
//                   'questionId': item.questionId,
//                   'date': _dateTimeConverter.encode(item.date)
//                 }),
//         _answersSubmittedTodayDeletionAdapter = DeletionAdapter(
//             database,
//             'AnswersSubmittedToday',
//             ['questionId'],
//             (AnswersSubmittedToday item) => <String, Object?>{
//                   'questionId': item.questionId,
//                   'date': _dateTimeConverter.encode(item.date)
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<AnswersSubmittedToday>
//       _answersSubmittedTodayInsertionAdapter;

//   final DeletionAdapter<AnswersSubmittedToday>
//       _answersSubmittedTodayDeletionAdapter;

//   @override
//   Future<List<AnswersSubmittedToday>> getTodaySubmittedQuestions() async {
//     return _queryAdapter.queryList('SELECT * FROM AnswersSubmittedToday',
//         mapper: (Map<String, Object?> row) => AnswersSubmittedToday(
//             questionId: row['questionId'] as String?,
//             date: _dateTimeConverter.decode(row['date'] as int)));
//   }

//   @override
//   Future<void> insert(AnswersSubmittedToday questions) async {
//     await _answersSubmittedTodayInsertionAdapter.insert(
//         questions, OnConflictStrategy.replace);
//   }

//   @override
//   Future<int> deleteAnswersSubmittedToday(AnswersSubmittedToday question) {
//     return _answersSubmittedTodayDeletionAdapter
//         .deleteAndReturnChangedRows(question);
//   }
// }

// class _$PersonalityQuestionModelDao extends PersonalityQuestionModelDao {
//   _$PersonalityQuestionModelDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _personalityQuestionModelInsertionAdapter = InsertionAdapter(
//             database,
//             'PersonalityQuestionModel',
//             (PersonalityQuestionModel item) => <String, Object?>{
//                   'question': item.question,
//                   'enCodedOptions': item.enCodedOptions,
//                   'answer': item.answer,
//                   'sId': item.sId,
//                   'createdAt': item.createdAt,
//                   'testId': item.testId,
//                   'updatedAt': item.updatedAt,
//                   'selected': item.selected
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<PersonalityQuestionModel>
//       _personalityQuestionModelInsertionAdapter;

//   @override
//   Future<List<PersonalityQuestionModel>> getPersonalityQuestion() async {
//     return _queryAdapter.queryList('SELECT * FROM PersonalityQuestionModel',
//         mapper: (Map<String, Object?> row) => PersonalityQuestionModel(
//             question: row['question'] as String?,
//             enCodedOptions: row['enCodedOptions'] as String?,
//             answer: row['answer'] as String?,
//             sId: row['sId'] as String?,
//             createdAt: row['createdAt'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             selected: row['selected'] as String?,
//             testId: row['testId'] as String?));
//   }

//   @override
//   Future<List<int>> insertList(List<PersonalityQuestionModel> questions) {
//     return _personalityQuestionModelInsertionAdapter.insertListAndReturnIds(
//         questions, OnConflictStrategy.abort);
//   }
// }

// class _$PersonalityResultDao extends PersonalityResultDao {
//   _$PersonalityResultDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _personalityResultInsertionAdapter = InsertionAdapter(
//             database,
//             'PersonalityResult',
//             (PersonalityResult item) => <String, Object?>{
//                   'criteriaName': item.criteriaName,
//                   'value': item.value,
//                   'testId': item.testId,
//                   'id': item.id
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<PersonalityResult> _personalityResultInsertionAdapter;

//   @override
//   Future<List<PersonalityResult>> getPersonalityQuestion() async {
//     return _queryAdapter.queryList('SELECT * FROM PersonalityResult',
//         mapper: (Map<String, Object?> row) => PersonalityResult(
//             row['value'] as double?,
//             row['criteriaName'] as String,
//             row['id'] as String,
//             row['testId'] as String?));
//   }

//   @override
//   Future<List<int>> insertList(List<PersonalityResult> questions) {
//     return _personalityResultInsertionAdapter.insertListAndReturnIds(
//         questions, OnConflictStrategy.abort);
//   }
// }

// class _$PsySelfHarmDao extends PsySelfHarmDao {
//   _$PsySelfHarmDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _selfHarmCategoryInsertionAdapter = InsertionAdapter(
//             database,
//             'SelfHarmCategory',
//             (SelfHarmCategory item) => <String, Object?>{
//                   'title': item.title,
//                   'image': item.image,
//                   'createdAt': item.createdAt,
//                   'updatedAt': item.updatedAt,
//                   'id': item.id
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<SelfHarmCategory> _selfHarmCategoryInsertionAdapter;

//   @override
//   Future<List<SelfHarmCategory>> getCategories() async {
//     return _queryAdapter.queryList('SELECT * FROM SelfHarmCategory',
//         mapper: (Map<String, Object?> row) => SelfHarmCategory(
//             title: row['title'] as String?,
//             image: row['image'] as String?,
//             createdAt: row['createdAt'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             id: row['id'] as String?));
//   }

//   @override
//   Future<List<int>> saveCategories(List<SelfHarmCategory> categories) {
//     return _selfHarmCategoryInsertionAdapter.insertListAndReturnIds(
//         categories, OnConflictStrategy.abort);
//   }
// }

// class _$AffirmationUserCategoriesDao extends AffirmationUserCategoriesDao {
//   _$AffirmationUserCategoriesDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _affirmationCategoryInsertionAdapter = InsertionAdapter(
//             database,
//             'AffirmationCategory',
//             (AffirmationCategory item) => <String, Object?>{
//                   'title': item.title,
//                   'createdAt': item.createdAt,
//                   'updatedAt': item.updatedAt,
//                   'id': item.id
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<AffirmationCategory>
//       _affirmationCategoryInsertionAdapter;

//   @override
//   Future<List<AffirmationCategory>>
//       getUserSelectedAffirmationCategories() async {
//     return _queryAdapter.queryList('SELECT * FROM AffirmationCategory',
//         mapper: (Map<String, Object?> row) => AffirmationCategory(
//             title: row['title'] as String?,
//             createdAt: row['createdAt'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             id: row['id'] as String?));
//   }

//   @override
//   Future<List<int>> saveUserSelectedCategories(
//       List<AffirmationCategory> categories) {
//     return _affirmationCategoryInsertionAdapter.insertListAndReturnIds(
//         categories, OnConflictStrategy.abort);
//   }
// }

// class _$HomeCategoryMainPageVideoDao extends HomeCategoryMainPageVideoDao {
//   _$HomeCategoryMainPageVideoDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _homeVideoModelInsertionAdapter = InsertionAdapter(
//             database,
//             'HomeVideoModel',
//             (HomeVideoModel item) => <String, Object?>{
//                   'thumbnail': item.thumbnail,
//                   'video': item.video,
//                   'type': item.type,
//                   'createdAt': item.createdAt,
//                   'aboutTitle': item.aboutTitle,
//                   'aboutDescription': item.aboutDescription,
//                   'aboutVideo': item.aboutVideo,
//                   'updatedAt': item.updatedAt,
//                   'id': item.id
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<HomeVideoModel> _homeVideoModelInsertionAdapter;

//   @override
//   Future<List<HomeVideoModel>> getAllHomeCategoryVideos() async {
//     return _queryAdapter.queryList('SELECT * FROM HomeVideoModel',
//         mapper: (Map<String, Object?> row) => HomeVideoModel(
//             thumbnail: row['thumbnail'] as String?,
//             video: row['video'] as String?,
//             type: row['type'] as String?,
//             createdAt: row['createdAt'] as String?,
//             aboutDescription: row['aboutDescription'] as String?,
//             aboutTitle: row['aboutTitle'] as String?,
//             aboutVideo: row['aboutVideo'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             id: row['id'] as String?));
//   }

//   @override
//   Future<HomeVideoModel?> getVideoByHomeCategoryType(String type) async {
//     return _queryAdapter.query('SELECT * FROM HomeVideoModel WHERE type = ?1',
//         mapper: (Map<String, Object?> row) => HomeVideoModel(
//             thumbnail: row['thumbnail'] as String?,
//             video: row['video'] as String?,
//             type: row['type'] as String?,
//             createdAt: row['createdAt'] as String?,
//             aboutDescription: row['aboutDescription'] as String?,
//             aboutTitle: row['aboutTitle'] as String?,
//             aboutVideo: row['aboutVideo'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             id: row['id'] as String?),
//         arguments: [type]);
//   }

//   @override
//   Future<List<int>> saveCategoryVideos(List<HomeVideoModel> categories) {
//     return _homeVideoModelInsertionAdapter.insertListAndReturnIds(
//         categories, OnConflictStrategy.abort);
//   }
// }

// class _$EServicesMetaDao extends EServicesMetaDao {
//   _$EServicesMetaDao(
//     this.database,
//     this.changeListener,
//   )   : _queryAdapter = QueryAdapter(database),
//         _eServicesMetaDataInsertionAdapter = InsertionAdapter(
//             database,
//             'EServicesMetaData',
//             (EServicesMetaData item) => <String, Object?>{
//                   'benefit': item.benefit,
//                   'description': item.description,
//                   'createdAt': item.createdAt,
//                   'updatedAt': item.updatedAt,
//                   // 'type': item.type,
//                   'id': item.id
//                 });

//   final sqflite.DatabaseExecutor database;

//   final StreamController<String> changeListener;

//   final QueryAdapter _queryAdapter;

//   final InsertionAdapter<EServicesMetaData> _eServicesMetaDataInsertionAdapter;

//   @override
//   Future<List<EServicesMetaData>> getMetaData() async {
//     return _queryAdapter.queryList('SELECT * FROM EServicesMetaData',
//         mapper: (Map<String, Object?> row) => EServicesMetaData(
//             benefit: row['benefit'] as String?,
//             description: row['description'] as String?,
//             createdAt: row['createdAt'] as String?,
//             // type: row['type'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             id: row['id'] as String?));
//   }

//   @override
//   Future<List<EServicesMetaData?>> findByType(String type) async {
//     return _queryAdapter.queryList(
//         'SELECT * FROM EServicesMetaData WHERE type = ?1',
//         mapper: (Map<String, Object?> row) => EServicesMetaData(
//             benefit: row['benefit'] as String?,
//             description: row['description'] as String?,
//             createdAt: row['createdAt'] as String?,
//             // type: row['type'] as String?,
//             updatedAt: row['updatedAt'] as String?,
//             id: row['id'] as String?),
//         arguments: [type]);
//   }

//   @override
//   Future<List<int>> saveList(List<EServicesMetaData> data) {
//     return _eServicesMetaDataInsertionAdapter.insertListAndReturnIds(
//         data, OnConflictStrategy.replace);
//   }

//   @override
//   Future<void> insertMetaData(EServicesMetaData data) async {
//     await _eServicesMetaDataInsertionAdapter.insert(
//         data, OnConflictStrategy.replace);
//   }
// }

// // class _$BusinessCenterSliderDao extends BusinessCenterSliderDao {
// //   _$BusinessCenterSliderDao(
// //     this.database,
// //     this.changeListener,
// //   )   : _queryAdapter = QueryAdapter(database),
// //         _eServicesSliderImageModelInsertionAdapter = InsertionAdapter(
// //             database,
// //             'EServicesSliderImageModel',
// //             (EServicesSliderImageModel item) => <String, Object?>{
// //                   'id': item.id,
// //                   'image': item.image,
// //                   'title': item.title,
// //                   'description': item.description,
// //                   'type': item.type
// //                 });

// //   final sqflite.DatabaseExecutor database;

// //   final StreamController<String> changeListener;

// //   final QueryAdapter _queryAdapter;

// //   final InsertionAdapter<EServicesSliderImageModel>
// //       _eServicesSliderImageModelInsertionAdapter;

// //   @override
// //   Future<List<EServicesSliderImageModel>> getEServicesSliderData() async {
// //     return _queryAdapter.queryList('SELECT * FROM EServicesSliderImageModel',
// //         mapper: (Map<String, Object?> row) => EServicesSliderImageModel(
// //             row['image'] as String?,
// //             row['title'] as String?,
// //             row['description'] as String?,
// //             row['type'] as String?,
// //             row['id'] as int?));
// //   }

// //   @override
// //   Future<List<EServicesSliderImageModel>> findByType(String type) async {
// //     return _queryAdapter.queryList(
// //         'SELECT * FROM EServicesSliderImageModel WHERE type = ?1',
// //         mapper: (Map<String, Object?> row) => EServicesSliderImageModel(
// //             row['image'] as String?,
// //             row['title'] as String?,
// //             row['description'] as String?,
// //             row['type'] as String?,
// //             row['id'] as int?),
// //         arguments: [type]);
// //   }

// //   @override
// //   Future<List<int>> saveSliders(List<EServicesSliderImageModel> images) {
// //     return _eServicesSliderImageModelInsertionAdapter.insertListAndReturnIds(
// //         images, OnConflictStrategy.replace);
// //   }
// // }



// // ignore_for_file: unused_element
// final _dateTimeConverter = DateTimeConverter();
