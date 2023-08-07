import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/crud_repository.dart';
import '../../../model/baber.dart';
import 'baber_event.dart';
import 'baber_state.dart';

class BaberBloc extends Bloc<BaberEvent, BaberState> {
  

  BaberBloc():super(InitialState());

  Stream<BaberState> mapEventToState(BaberEvent event) async* {
    if (event is CreateBaberEvent) {
      yield* _mapCreateBaberEventToState(event);
    } else if (event is UpdateBaberEvent) {
      yield* _mapUpdateBaberEventToState(event);
    } else if (event is DeleteBaberEvent) {
      yield* _mapDeleteBaberEventToState(event);
    } else if (event is FetchBaberEvent) {
      yield* _mapFetchBaberEventToState();
    }
  }

  Stream<BaberState> _mapCreateBaberEventToState(CreateBaberEvent event) async* {
    try {
      await baberCollection.add(event.baber.toFirestore());
      yield InitialState();
    } catch (e) {
      yield ErrorState('Failed to create Baber');
    }
  }

  Stream<BaberState> _mapUpdateBaberEventToState(UpdateBaberEvent event) async* {
    try {
      final baberMap = event.baber.toFirestore();
      await baberCollection.doc(event.baber.baberId).update(baberMap);
      yield InitialState();
    } catch (e) {
      yield ErrorState('Failed to update Baber');
    }
  }

  Stream<BaberState> _mapDeleteBaberEventToState(DeleteBaberEvent event) async* {
    try {
      await baberCollection.doc(event.baberId).delete();
      yield InitialState();
    } catch (e) {
      yield ErrorState('Failed to delete Baber');
    }
  }

  Stream<BaberState> _mapFetchBaberEventToState() async* {
    yield LoadingState();
    try {
      final querySnapshot = await baberCollection.get();
      final babers = querySnapshot.docs
          .map((doc) => Baber.fromFirestore(documentSnapshot: doc))
          .toList();
      yield BaberLoadedState(babers);
    } catch (e) {
      yield ErrorState('Failed to fetch Babers');
    }
  }
}
