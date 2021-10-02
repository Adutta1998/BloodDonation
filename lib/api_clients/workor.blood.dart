import 'package:supabase/supabase.dart';

class ServiceWorker {
  static ServiceWorker? _instance;
  final String supabase_key =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjk0MjcwMSwiZXhwIjoxOTQ4NTE4NzAxfQ.-Hpz7HG8eWB3LzAgpzqcclzW6NhpoM_C2UL5ST5kgbc";
  final String supabase_url = "https://vaiaijpyombwtamusuxv.supabase.co";

  SupabaseClient? client;

  static ServiceWorker getInstance() {
    return _instance ??= ServiceWorker._internal();
  }

  ServiceWorker._internal() {
    client = SupabaseClient(supabase_url, supabase_key);
  }
}
