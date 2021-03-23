import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_event.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_state.dart';
import 'package:my_portofolio_flutter/models/portofolio.dart';

class PortofolioBloc extends Bloc<PortofolioEvent, PortofolioState> {
  PortofolioBloc() : super(PortofolioLoadingState()) {
    this.add(PortofolioEvent.GET_DATA);
  }

  @override
  Stream<PortofolioState> mapEventToState(PortofolioEvent event) async* {
    switch (event) {
      case PortofolioEvent.GET_DATA:
        {
          yield PortofolioLoadingState();
          try {
            Portofolio portofolio = await getPortofolio();
            yield PortofolioSuccessState(portofolio: portofolio);
          } on Exception catch (e) {
            yield PortofolioErrorState(exception: e);
          }
        }
        break;
    }
  }

  Future<Portofolio> getPortofolio() async {
    http.Response response = await http.get(Uri.https(
        'raw.githubusercontent.com',
        'erikrios/dummy-file-testing/master/json/my-portofolio.json'));
    if (response.statusCode == 200)
      return Portofolio.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to load portofolio');
  }
}
