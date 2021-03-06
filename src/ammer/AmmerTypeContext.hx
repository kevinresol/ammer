package ammer;

import haxe.macro.Expr;
import haxe.macro.Type;

typedef AmmerTypeContext = {
  implType:ClassType,
  implTypePath:TypePath,
  nativeName:String,
  nativePrefix:String,
  nativeType:ComplexType,
  originalFields:Array<Field>,
  library:ComplexType,
  processed:Array<Field>,
  isStruct:Bool,
  kind:SubtypeKind,
  ffiMethods:Array<FFIMethod>,
  ffiConstants:Array<FFIVariable>,
  ffiVariables:Array<FFIStructVariable>,
  libraryCtx:AmmerContext // only set when patching
};
