package com.fwscott.webapis.smugmug.v1_2_1.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_1.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_1.WatermarkSettings;
	import com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
		
	public class Watermarks
	{
		private var _service:SmugMugService;
		
		public function Watermarks( service:SmugMugService ) {
			_service = service;
		}
		
		public function get(heavy:Boolean):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.watermarks.get", false,
								   new NameValuePair("Heavy",heavy)  
								 );						
		}
		
		private function get_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.WATERMARKS_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "watermarks",
												  null );				
		}						
		
		public function changeSettings(settings:WatermarkSettings):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, changeSettings_result, 
								   "smugmug.watermarks.changeSettings", false,
								   new NameValuePair("ImageID",settings.imageID),  
								   new NameValuePair("Name",settings.name),
								   new NameValuePair("Pinned",settings.pinned.value),
								   new NameValuePair("Dissolved",settings.dissolved),
								   new NameValuePair("Thumbs",settings.thumbs)
								 );						
		}
		
		private function changeSettings_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.WATERMARKS_CHANGESETTINGS );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "watermarks",
												  null );				
		}								
		
		public function create(settings:WatermarkSettings):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, create_result, 
								   "smugmug.watermarks.create", false,
								   new NameValuePair("ImageID",settings.imageID),  
								   new NameValuePair("Name",settings.name),
								   new NameValuePair("Pinned",settings.pinned.value),
								   new NameValuePair("Dissolved",settings.dissolved),
								   new NameValuePair("Thumbs",settings.thumbs)
								 );						
		}
		
		private function create_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.WATERMARKS_CREATE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "watermarks",
												  null );				
		}										
		
		public function remove( watermarkID:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, remove_result, 
								   "smugmug.watermarks.delete", false,
								   new NameValuePair("WatermarkID",watermarkID)
								 );						
		}
		
		private function remove_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.WATERMARKS_DELETE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "watermarks",
												  null );				
		}		
		
		public function getInfo(watermarkID:int):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getInfo_result, 
								   "smugmug.watermarks.getInfo", false,
								   new NameValuePair("WatermarkID",watermarkID)  
								 );						
		}
		
		private function getInfo_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.WATERMARKS_GETINFO );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "watermarks",
												  null );				
		}																
	}
}