package com.fwscott.webapis.smugmug.v1_2_2.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_2.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_2.events.SmugMugResultEvent;
	
	import mx.rpc.events.ResultEvent;
	
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
								   false,false );			
		}
		
		private function logout_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.LOGOUT );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "logout",
												  logoutResultParser );			
		}
		
		private function logoutResultParser( obj:Object ):Object {
			return true;
		}
	}
}