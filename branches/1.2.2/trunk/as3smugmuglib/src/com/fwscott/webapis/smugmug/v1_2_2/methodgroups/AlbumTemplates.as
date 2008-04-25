package com.fwscott.webapis.smugmug.v1_2_2.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_2.AlbumTemplateSettings;
	import com.fwscott.webapis.smugmug.v1_2_2.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_2.events.SmugMugResultEvent;
	
	import flash.net.URLLoader;
	import mx.rpc.events.ResultEvent;
	
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
								  false, false );			
		}
		
		private function get_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMTEMPLATES_GET );			
			
			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "albumTemplates",
												  null );						
		}
		
		public function create(templateSettings:AlbumTemplateSettings):void {
			// TODO Implement Method
			// Let the Helper do the work to invoke the method
	//		MethodGroupHelper.invokeMethod( _service, create_result, 
	//							   "smugmug.albumtemplates.create", 
	//							  false );			
		}
		
		private function create_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMTEMPLATES_CREATE );			
			
			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "albumTemplates",
												  null );						
		}		
		
		public function changeSettings(templateSettings:AlbumTemplateSettings):void {
			// TODO Implement Method
			// Let the Helper do the work to invoke the method
	//		MethodGroupHelper.invokeMethod( _service, changesettings_result, 
	//							   "smugmug.albumtemplates.changeSettings", 
	//							  false );			
		}
		
		private function changeSettings_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMTEMPLATES_CHANGESETTINGS );			
			
			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "albumTemplates",
												  null );						
		}				
	}
}