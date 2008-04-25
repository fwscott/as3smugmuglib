package com.fwscott.webapis.smugmug.v1_2_2.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_2.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_2.events.SmugMugResultEvent;
	
	import mx.rpc.events.ResultEvent;
		
	public class Themes
	{
		private var _service:SmugMugService;
		
		public function Themes( service:SmugMugService ) {
			_service = service;
		}
		
		public function get():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.themes.get", false,false	  
								 );						
		}
		
		private function get_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.THEMES_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "themes",
												  null );				
		}				
	}
}