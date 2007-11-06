package com.fwscott.webapis.smugmug.v1_2_0.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_0.SmugMugService;
	import flash.events.Event;
	import flash.net.URLLoader;
	import com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent;
	
	public class AlbumTemplates
	{
		
		private var _service:SmugMugService;
		
		public function AlbumTemplates( service:SmugMugService ) {
			_service = service;
		}
		
		public function get():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.albumtemplates.get", 
								  false );			
		}
		
		private function get_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMTEMPLATES_GET );			
			
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "albumTemplates",
												  null );						
		}
	}
}