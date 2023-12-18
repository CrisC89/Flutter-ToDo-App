import 'package:uuid/uuid.dart';

class UniqueId {

  final String value;

  const UniqueId._(this.value);

  factory UniqueId(){
    return UniqueId._(const Uuid().v4());
  }

  factory UniqueId.fromUniqueString(String uniqueString){
    return UniqueId._(uniqueString);
  }
}

class CollectionId extends UniqueId{

  const CollectionId._(String value): super._(value);

  factory CollectionId(){
    return CollectionId._(const Uuid().v4());
  }

  factory CollectionId.fromUniqueString(String uniqueString){
    return CollectionId._(uniqueString);
  }
}
