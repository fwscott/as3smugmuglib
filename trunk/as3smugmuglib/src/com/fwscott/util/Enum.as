package com.fwscott.util
{
	// see graniteds.org
	public class Enum
	{
		private var _value:Object;
		
		public function Enum(value:Object) {
			_value = value;
		}
		
		public final function get value():Object {
			return _value;
		}
	}
}