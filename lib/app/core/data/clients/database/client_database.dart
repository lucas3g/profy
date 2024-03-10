import 'package:profy/app/core/data/clients/database/params/client_database_params.dart';

abstract class ClientDataBase {
  Future<List<Map<String, dynamic>>> saveData(
      {required ClientDataBaseSaveParams params});
  Future<List<Map<String, dynamic>>> updateData(
      {required ClientDataBaseUpdateParams params});
  Future<List<Map<String, dynamic>>> getDataByField(
      {required ClientDataBaseGetDataByFieldParams params});
  Future<List<Map<String, dynamic>>> getDataByFilters(
      {required ClientDataBaseGetDataByFiltersParams params});
  Future<List<Map<String, dynamic>>> getDataWithForeignTables(
      {required ClientDataBaseGetDataWithForeignTablesParams params});
  Future<Map<String, dynamic>> createAccount(
      {required ClientDataBaseCreateAccountParams params});
}
