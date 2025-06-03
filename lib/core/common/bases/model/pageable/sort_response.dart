import 'package:gen_cert/core/common/bases/entities/sort_entity.dart';
import 'package:gen_cert/core/mapper/entity_convertible.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sort_response.g.dart';

@JsonSerializable(createToJson: false)
class SortResponse with EntityConvertible<SortResponse, SortEntity> {
  @JsonKey(name: 'sorted')
  bool? sorted;
  @JsonKey(name: 'unsorted')
  bool? unsorted;
  @JsonKey(name: 'empty')
  bool? empty;

  SortResponse({this.sorted, this.unsorted, this.empty});

  factory SortResponse.fromJson(Map<String, dynamic> json) =>
      _$SortResponseFromJson(json);

  @override
  SortEntity toEntity() {
    return SortEntity(sorted: sorted, unsorted: unsorted, empty: empty);
  }
}
