package test;

import utest.Assert;
import utest.Async;
import haxe.io.Bytes;

// copy of Test from Haxe unit test sources
// + beq, noExc
class Test implements utest.ITest {
	public function new() {}

	function eq<T>(v:T, v2:T, ?pos:haxe.PosInfos) {
		Assert.equals(v, v2, pos);
	}

	function feq(v:Float, v2:Float, ?pos:haxe.PosInfos) {
		Assert.floatEquals(v, v2, pos);
	}

	function aeq<T>(expected:Array<T>, actual:Array<T>, ?pos:haxe.PosInfos) {
		Assert.same(expected, actual, pos);
	}

	function beq(a:Bytes, b:Bytes, ?pos:haxe.PosInfos) {
		Assert.isTrue(a.compare(b) == 0, pos);
	}

	function t(v, ?pos:haxe.PosInfos) {
		Assert.isTrue(v, pos);
	}

	function f(v, ?pos:haxe.PosInfos) {
		Assert.isFalse(v, pos);
	}

	function assert(?message:String, ?pos:haxe.PosInfos) {
		Assert.fail(message, pos);
	}

	function exc(f:Void->Void, ?pos:haxe.PosInfos) {
		Assert.raises(f, pos);
	}

	function noExc(f:Void->Void, ?pos:haxe.PosInfos) {
		Assert.isTrue(try {
			f();
			true;
		} catch (e:Dynamic) false, pos);
	}

	function unspec(f:Void->Void, ?pos) {
		try {
			f();
		} catch (e:Dynamic) {}
		noAssert();
	}

	function allow<T>(v:T, values:Array<T>, ?pos) {
		Assert.contains(v, values, pos);
	}

	function noAssert(?pos:haxe.PosInfos) {
		t(true, pos);
	}

	function hf(c:Class<Dynamic>, n:String, ?pos:haxe.PosInfos) {
		t(Lambda.has(Type.getInstanceFields(c), n));
	}

	function nhf(c:Class<Dynamic>, n:String, ?pos:haxe.PosInfos) {
		f(Lambda.has(Type.getInstanceFields(c), n));
	}

	function hsf(c:Class<Dynamic>, n:String, ?pos:haxe.PosInfos) {
		t(Lambda.has(Type.getClassFields(c), n));
	}

	function nhsf(c:Class<Dynamic>, n:String, ?pos:haxe.PosInfos) {
		f(Lambda.has(Type.getClassFields(c), n));
	}
}
