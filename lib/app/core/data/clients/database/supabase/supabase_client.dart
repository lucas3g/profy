import 'package:injectable/injectable.dart';
import 'package:profy/app/core/data/clients/database/client_database.dart';
import 'package:profy/app/core/data/clients/database/params/client_database_params.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: ClientDataBase)
class SupaBaseService implements ClientDataBase {
  final SupabaseClient _supa;

  SupaBaseService({
    required SupabaseClient supa,
  }) : _supa = supa;

  @override
  Future<List<Map<String, dynamic>>> getDataByField(
      {required ClientDataBaseGetDataByFieldParams params}) async {
    final PostgrestList result = await _supa
        .from(params.table.name)
        .select()
        .eq(params.field, params.value)
        .order(params.orderBy, ascending: true);

    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> saveData(
      {required ClientDataBaseSaveParams params}) async {
    final PostgrestList result =
        await _supa.from(params.table.name).insert(params.data).select();

    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> updateData(
      {required ClientDataBaseUpdateParams params}) async {
    if (params.data is List<Map<String, dynamic>>) {
      late List<Map<String, dynamic>> result = <Map<String, dynamic>>[];

      for (Map<String, dynamic> data in params.data) {
        result = await _supa
            .from(params.table.name)
            .update(data)
            .eq('id', data['id'])
            .select();
      }

      return result;
    } else {
      final PostgrestList result = await _supa
          .from(params.table.name)
          .update(params.data)
          .eq('id', params.data['id'])
          .select();

      return result;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getDataByFilters(
      {required ClientDataBaseGetDataByFiltersParams params}) async {
    if (params.filters.length == 3) {
      final PostgrestList result = await _supa
          .from(params.table.name)
          .select()
          .eq(params.filters.elementAt(0).field,
              params.filters.elementAt(0).value)
          .gte(params.filters.elementAt(1).field,
              params.filters.elementAt(1).value)
          .lte(params.filters.elementAt(2).field,
              params.filters.elementAt(2).value);

      return result;
    }

    final Map<String, dynamic> match = <String, dynamic>{};

    for (ClientDataBaseFilters filter in params.filters) {
      match.addAll(<String, dynamic>{filter.field: filter.value});
    }

    final PostgrestList result =
        await _supa.from(params.table.name).select().match(match);

    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getDataWithForeignTables(
      {required ClientDataBaseGetDataWithForeignTablesParams params}) async {
    final PostgrestList result = await _supa
        .from(params.table.name)
        .select('*, ${params.foreignTable.name}!inner(*)')
        .order(params.orderBy, ascending: true);

    return result;
  }

  @override
  Future<Map<String, dynamic>> createAccount(
      {required ClientDataBaseCreateAccountParams params}) async {
    final AuthResponse result = await _supa.auth.signUp(
      email: params.email,
      password: params.password,
    );

    if (result.user == null) {
      throw Exception('Erro ao tentar criar conta');
    }

    return result.user!.toJson();
  }

  @override
  Future<Map<String, dynamic>> signIn(
      {required ClientDataBaseSignInParams params}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
