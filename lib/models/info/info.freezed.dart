// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Info _$InfoFromJson(Map<String, dynamic> json) {
  return _Info.fromJson(json);
}

/// @nodoc
mixin _$Info {
  String get id => throw _privateConstructorUsedError;
  String? get synopsis => throw _privateConstructorUsedError;
  String? get yearsAired => throw _privateConstructorUsedError;
  List<Creator>? get sayings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoCopyWith<Info> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoCopyWith<$Res> {
  factory $InfoCopyWith(Info value, $Res Function(Info) then) =
      _$InfoCopyWithImpl<$Res, Info>;
  @useResult
  $Res call(
      {String id,
      String? synopsis,
      String? yearsAired,
      List<Creator>? sayings});
}

/// @nodoc
class _$InfoCopyWithImpl<$Res, $Val extends Info>
    implements $InfoCopyWith<$Res> {
  _$InfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? synopsis = freezed,
    Object? yearsAired = freezed,
    Object? sayings = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: freezed == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      yearsAired: freezed == yearsAired
          ? _value.yearsAired
          : yearsAired // ignore: cast_nullable_to_non_nullable
              as String?,
      sayings: freezed == sayings
          ? _value.sayings
          : sayings // ignore: cast_nullable_to_non_nullable
              as List<Creator>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfoCopyWith<$Res> implements $InfoCopyWith<$Res> {
  factory _$$_InfoCopyWith(_$_Info value, $Res Function(_$_Info) then) =
      __$$_InfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? synopsis,
      String? yearsAired,
      List<Creator>? sayings});
}

/// @nodoc
class __$$_InfoCopyWithImpl<$Res> extends _$InfoCopyWithImpl<$Res, _$_Info>
    implements _$$_InfoCopyWith<$Res> {
  __$$_InfoCopyWithImpl(_$_Info _value, $Res Function(_$_Info) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? synopsis = freezed,
    Object? yearsAired = freezed,
    Object? sayings = freezed,
  }) {
    return _then(_$_Info(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: freezed == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      yearsAired: freezed == yearsAired
          ? _value.yearsAired
          : yearsAired // ignore: cast_nullable_to_non_nullable
              as String?,
      sayings: freezed == sayings
          ? _value._sayings
          : sayings // ignore: cast_nullable_to_non_nullable
              as List<Creator>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Info implements _Info {
  const _$_Info(
      {required this.id,
      this.synopsis,
      this.yearsAired,
      final List<Creator>? sayings})
      : _sayings = sayings;

  factory _$_Info.fromJson(Map<String, dynamic> json) => _$$_InfoFromJson(json);

  @override
  final String id;
  @override
  final String? synopsis;
  @override
  final String? yearsAired;
  final List<Creator>? _sayings;
  @override
  List<Creator>? get sayings {
    final value = _sayings;
    if (value == null) return null;
    if (_sayings is EqualUnmodifiableListView) return _sayings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Info(id: $id, synopsis: $synopsis, yearsAired: $yearsAired, sayings: $sayings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Info &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.yearsAired, yearsAired) ||
                other.yearsAired == yearsAired) &&
            const DeepCollectionEquality().equals(other._sayings, _sayings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, synopsis, yearsAired,
      const DeepCollectionEquality().hash(_sayings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoCopyWith<_$_Info> get copyWith =>
      __$$_InfoCopyWithImpl<_$_Info>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InfoToJson(
      this,
    );
  }
}

abstract class _Info implements Info {
  const factory _Info(
      {required final String id,
      final String? synopsis,
      final String? yearsAired,
      final List<Creator>? sayings}) = _$_Info;

  factory _Info.fromJson(Map<String, dynamic> json) = _$_Info.fromJson;

  @override
  String get id;
  @override
  String? get synopsis;
  @override
  String? get yearsAired;
  @override
  List<Creator>? get sayings;
  @override
  @JsonKey(ignore: true)
  _$$_InfoCopyWith<_$_Info> get copyWith => throw _privateConstructorUsedError;
}

Creator _$CreatorFromJson(Map<String, dynamic> json) {
  return _Creator.fromJson(json);
}

/// @nodoc
mixin _$Creator {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatorCopyWith<Creator> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatorCopyWith<$Res> {
  factory $CreatorCopyWith(Creator value, $Res Function(Creator) then) =
      _$CreatorCopyWithImpl<$Res, Creator>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$CreatorCopyWithImpl<$Res, $Val extends Creator>
    implements $CreatorCopyWith<$Res> {
  _$CreatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreatorCopyWith<$Res> implements $CreatorCopyWith<$Res> {
  factory _$$_CreatorCopyWith(
          _$_Creator value, $Res Function(_$_Creator) then) =
      __$$_CreatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$_CreatorCopyWithImpl<$Res>
    extends _$CreatorCopyWithImpl<$Res, _$_Creator>
    implements _$$_CreatorCopyWith<$Res> {
  __$$_CreatorCopyWithImpl(_$_Creator _value, $Res Function(_$_Creator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Creator(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Creator implements _Creator {
  const _$_Creator({this.name, this.url});

  factory _$_Creator.fromJson(Map<String, dynamic> json) =>
      _$$_CreatorFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString() {
    return 'Creator(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Creator &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatorCopyWith<_$_Creator> get copyWith =>
      __$$_CreatorCopyWithImpl<_$_Creator>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatorToJson(
      this,
    );
  }
}

abstract class _Creator implements Creator {
  const factory _Creator({final String? name, final String? url}) = _$_Creator;

  factory _Creator.fromJson(Map<String, dynamic> json) = _$_Creator.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_CreatorCopyWith<_$_Creator> get copyWith =>
      throw _privateConstructorUsedError;
}
