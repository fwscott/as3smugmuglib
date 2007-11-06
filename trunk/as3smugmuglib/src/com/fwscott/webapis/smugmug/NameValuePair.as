/*
Taken from FlickrAS3lib
*/

package com.fwscott.webapis.smugmug {
	
	/**
	 * NameValuePair is an object containing a key/value
	 * combination.
	 */
	public class NameValuePair {
		
		private var _name:String;
		private var _value:Object;
	
		/**
		 * Construct a new name value pair
		 *
		 * @langversion ActionScript 3.0
		 * @tiptext
		 */
		public function NameValuePair( name:String = "", value:Object = "" ) {
			_name = name;
			_value = value;
		}
		
		/**
		 * Returns the name
		 *
		 * @langversion ActionScript 3.0
		 * @tiptext
		 */
		public function get name():String {
			return _name;
		}
		
		/**
		 * Sets the name
		 *
		 * @langversion ActionScript 3.0
		 * @tiptext
		 */
		public function set name( value:String ):void {
			_name = value;
		}
		
		/**
		 * Returns the value
		 *
		 * @langversion ActionScript 3.0
		 * @tiptext
		 */
		public function get value():Object {
			return _value;
		}
		
		/**
		 * Sets the value
		 *
		 * @langversion ActionScript 3.0
		 * @tiptext
		 */
		public function set value( v:Object ):void {
			_value = v;
		}
		

	}	
	
}