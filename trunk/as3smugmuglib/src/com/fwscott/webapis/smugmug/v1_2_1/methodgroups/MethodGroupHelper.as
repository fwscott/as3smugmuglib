/*
Taken almost directly from the Flickr AS3 library project.
*/

package com.fwscott.webapis.smugmug.v1_2_1.methodgroups {
	

	import com.adobe.serialization.json.JSON;
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_1.SmugMugError;
	import com.fwscott.webapis.smugmug.v1_2_1.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_1.User;
	import com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent;
	import com.fwscott.webapis.smugmug.smugmugservice_internal;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.*;
	
	/**
	 * Contains helper functions for the method group classes that are
	 * reused throughout them.
	 */
	internal class MethodGroupHelper {
	
		/**
		 * Reusable method that the "method group" classes can call to invoke a
		 * method on the API.
		 *
		 * @param callBack The function to be notified when the RPC is complete
		 * @param method The name of the method to invoke ( like flickr.test.echo )
		 * @param signed A boolean value indicating if the method call needs
		 *			an api_sig attached to it
		 * @param params An array of NameValuePair or primitive elements to pass
		 *			as parameters to the remote method
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function invokeMethod( service:SmugMugService, 
												callBack:Function, method:String, 
												forceSecure:Boolean, ... params:Array ):void
		{
			
			// Create an array to store our name/value pairs
			// for the query because during signing we need to sort
			// these alphabetically
			var args:Array = new Array();
			
			args.push( new NameValuePair( "APIKey", service.apiKey ) );
			args.push( new NameValuePair( "method", method ) );
			
			
			// Loop over the params and add them as arguments
			for ( var i:int = 0; i < params.length; i++ ) {
				// Do we have an argument name, or do we create one
				if ( params[i] is NameValuePair ) {
					args.push( params[i] );
				} else {
					// Create a unique argument name using our loop counter
					args.push( new NameValuePair( "param" + i, params[i].toString() ) );
				}
			}
			
			// If a user is authenticated, automatically add their token
			if ( service.sessionID != "" ) {
				args.push( new NameValuePair( "SessionID", service.sessionID ) );
			}
			
			// Construct the query string to send to the SmugMug service
			var query:String = "";
			for ( var k:int = 0; k < args.length; k++ ) {
				// This puts 1 too many "&" on the end, but that doesn't
				// affect the flickr call, so it doesn't matter
				query += toQueryArgument(args[k] as NameValuePair);
			}
			
			// Use the "internal" flickrservice namespace to be able to
			// access the urlLoader so we can make the request.
			var loader:URLLoader = service.smugmugservice_internal::urlLoader;
			
			var endPoint:String;
			if(forceSecure || service.isSecure)
				endPoint = SmugMugService.SECURE_END_POINT;
			else
				endPoint = SmugMugService.END_POINT;
			
			// Construct a url request with our query string and invoke
			// the Flickr method
			loader.addEventListener( "complete", callBack );
			trace("sending --- " + endPoint + "?" + query);
			loader.load( new URLRequest( endPoint + "?" + query ) );
		}

		private static function toQueryArgument(val:NameValuePair):String {
			var value:String = "";
			if(val.value == null || (val.value is Number && isNaN(val.value as Number)) )
				return "";
			if(val.value is Boolean)
				value = val.value==true?"1":"0";
			else
				value = escape(String(val.value));
			
			return val.name + "=" + value + "&";	
		}		
		/**
		 * Handle processing the result of the API call.
		 *
		 * @param service The FlickrService associated with the method group
		 * @param response The XML response we got from the loader call
		 * @param result The event to fill in the details of and dispatch
		 * @param propertyName The property in event.data that the results should be placed
		 * @param parseFunction The function to parse the response XML with
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function processAndDispatch( service:SmugMugService, response:String, result:SmugMugResultEvent, propertyName:String = "", parseFunction:Function = null ):void {
			// Process the response to create an object for return values
			var rsp:Object = processResponse( response, propertyName, parseFunction );

			// Copy some properties from the response to the result event
			result.success = rsp.success;
			result.data = rsp.data;

			// Notify everyone listening
			service.dispatchEvent( result );
		}
		
		/**
		 * Reusable method that the "method group" classes can call
		 * to process the results of the Flickr method.
		 *
		 * @param flickrResponse The rest response string that aligns
		 *		with the documentation here: 
		 *			http://www.flickr.com/services/api/response.rest.html
		 * @param parseFunction A reference to the function that should be used
		 *		to parse the XML received from the server
		 * @param propertyName The name of the property to put the parsed data in.
		 *  	For example, the result object will contain a "data" property that
		 * 		will contain an additional property (the value of propertyName) that
		 * 		contains the actual data.
		 * @return An object with success and data properties.  Success
		 *		will be true if the call was completed, false otherwise.
		 *		Data will contain ether an array of NameValuePair (if
		 *		successful) or errorCode and errorMessage properties.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function processResponse( flickrResponse:String, propertyName:String, parseFunction:Function ):Object {
			var result:Object = new Object();
			result.data = new Object();
			
			var rsp:Object = JSON.decode(flickrResponse);

			if ( rsp==null || rsp.stat == "ok" ) {
				result.success = true;
				
				if ( parseFunction == null ) {
					// No parse function speficied, just pass through the dynamic object data.
					result.data =  rsp;
				} else {
					result.data[propertyName] = parseFunction( rsp  );	
				}			
								
			} else {
				result.success = false;
				
				
				// In the event that we don't get an object
				// as part of the error returned, just
				// use the plain text as the error message
				
				var error:SmugMugError = new SmugMugError();
				if ( rsp != null ) 
				{
					error.errorCode = int( rsp.code );
					error.errorMessage = rsp.message;
					
					result.data.error = error;
				}
				else 
				{
					error.errorCode = -1;
					error.errorMessage = "";
					
					result.data.error = error;
				}
				
			}
			
			
			return result;			
		}
		
		/**
		 * Converts a date object into a Flickr date string
		 *
		 * @param date The date to convert
		 * @return A string representing the date in a format
		 *		that Flickr understands
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function dateToString( date:Date ):String {
			// Don't do anything if the date is invalid
			if ( date == null ) {
				return "";
			} else {
				return date.getFullYear() + "-" + (date.getMonth() + 1)
					+ "-" + date.getDate() + " " + date.getHours()
					+ ":" + date.getMinutes() + ":" + date.getSeconds();
			}
		}
		
		/**
		 * Converts a Flickr date string into a date object
		 *
		 * @param date The string to convert
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function stringToDate( str:String = "" ):Date {
			if ( str == "" ) {
				return null;
			}
			
			var date:Date = new Date();
			// split the date into date / time parts
			var parts:Array = str.split( " " );
			
			// See if we have the xxxx-xx-xx xx:xx:xx format
			if ( parts.length == 2 ) {
				var dateParts:Array = parts[0].split( "-" );
				var timeParts:Array = parts[1].split( ":" );
				
				date.setFullYear( dateParts[0] );
				date.setMonth( dateParts[1] - 1 ); // subtract 1 (Jan == 0)
				date.setDate( dateParts[2] );
				date.setHours( timeParts[0] );
				date.setMinutes( timeParts[1] );
				date.setSeconds( timeParts[2] );
			} else {
				// Create a date based on # of seconds since Jan 1, 1970 GMT
				date.setTime( parseInt( str ) * 1000 );
			}
			
			return date;
		}
		
		internal static function parseLoginResult( xml:Object ):Object {
			var tmpObj:Object = new Object();
			var x:XML = XML(xml);
			tmpObj.user = new User();
			var userNode:Object = x.rsp.login.user;
			
			return xml;
		}

		internal static function parseGetAlbumsResult( xml:Object ):Object {
			return xml;
		}
	}
	
}