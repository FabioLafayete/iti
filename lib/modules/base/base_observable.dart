import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/extensions.dart';

abstract class BaseObservable {
  get variable;
  set variable(value);

  get validateResult {}
  set validateResult(value) {}

  bool validate() => false;

  String format() => '';

  get rx => null;
}

class ListObservable extends BaseObservable {
  RxList _variable;

  ListObservable({@required RxList variable}) {
    _variable = variable;
  }

  @override
  get rx => _variable;

  @override
  get variable => _variable;

  @override
  set variable(value) {
    if (!_variable.isNullOrUndefined && _variable.isNotEmpty) _variable.clear();
    _variable.addAll(value);
  }
}

class Observable extends BaseObservable {
  dynamic _variable;
  Function _validator;
  Function _formatter;
  List<dynamic> _formatterArgs;
  List<dynamic> _validatorArgs;
  bool _validateOnUpdate;
  Rx _validatorResult = Rx(null);

  Observable({
    @required RxInterface variable,
    Function validator,
    Function formatter,
    List formatterArgs,
    List validatorArgs,
    bool validateOnUpdate = false,
  }) {
    validatorArgs ??= [];
    validatorArgs.insert(0, variable.toString());

    formatterArgs ??= [];
    formatterArgs.insert(0, variable.toString());

    _variable = variable;
    _validator = validator;
    _formatter = formatter;
    _formatterArgs = formatterArgs;
    _validatorArgs = validatorArgs;
    _validateOnUpdate = validateOnUpdate;
  }

  @override
  get rx => _variable;

  @override
  get variable => _variable.value;

  @override
  set variable(value) {
    _variable.value = value;
    if (_validateOnUpdate) validate();
  }

  @override
  get validateResult => _validatorResult.value;

  @override
  set validateResult(value) {
    _validatorResult.value = value;
  }

  @override
  bool validate() {
    if (_validator == null) return true;
    _validatorArgs[0] = _variable.value.toString();
    _validatorResult.value = Function.apply(_validator, _validatorArgs);
    return _validatorResult.value == null;
  }

  @override
  String format() {
    if (_formatter == null) return _variable.value.toString();
    _formatterArgs[0] = _variable.value.toString();
    return Function.apply(_formatter, _formatterArgs);
  }
}
