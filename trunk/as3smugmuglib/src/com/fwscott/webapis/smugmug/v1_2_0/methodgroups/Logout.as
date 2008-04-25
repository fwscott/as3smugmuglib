package com.fwscott.webapis.smugmug.v1_2_0.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_0.SmugMugService;
	import flash.events.Event;
	import com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent;
	import flash.net.URLLoader;
	
	public class Logout
	{
		private var _service:SmugMugService;
		
		public function Logout( service:SmugMugService ) {
			_service = service;
		}
		
		public function logout():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, logout_result, 
								   "smugmug.logout", 
								   false );			
		}
		
		private function logout_result(event:Event):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.LOGOUT );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "logout",
												  logoutResultParser );			
		}
		
		private function logoutResultParser( obj:Object ):Object {
			return true;
		}
	}
}