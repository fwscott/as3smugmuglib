package com.fwscott.webapis.smugmug.v1_2_1.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_1.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
		
	public class ShareGroups
	{
		private var _service:SmugMugService;
		
		public function ShareGroups( service:SmugMugService ) {
			_service = service;
		}
		
		public function get():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.sharegroups.get", false	  
								 );						
		}	
		
		private function get_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SHAREGROUPS_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "sharegroups",
												  null );				
		}			
		
		public function addAlbum(shareGroupID:int, albumID:int):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, addAlbum_result, 
								   "smugmug.sharegroups.addAlbum", false,
								   new NameValuePair("ShareGroupID",shareGroupID),
								   new NameValuePair("AlbumID", albumID)  
								 );						
		}	
		
		private function addAlbum_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SHAREGROUPS_ADDALBUM );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "sharegroups",
												  null );				
		}						
		
		public function create(name:String, description:String):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, create_result, 
								   "smugmug.sharegroups.create", false,
								   new NameValuePair("Name",name),
								   new NameValuePair("Description", description) 
								 );						
		}	
		
		private function create_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SHAREGROUPS_CREATE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "sharegroups",
												  null );				
		}				
		
		public function remove( shareGroupID:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, remove_result, 
								   "smugmug.sharegroups.delete", false,
								   new NameValuePair("ShareGroupID",shareGroupID)
								 );						
		}	
		
		private function remove_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SHAREGROUPS_DELETE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "sharegroups",
												  null );				
		}	
		
		public function getInfo( shareGroupID:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getInfo_result, 
								   "smugmug.sharegroups.getInfo", false,
								   new NameValuePair("ShareGroupID",shareGroupID) 
								 );						
		}	
		
		private function getInfo_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SHAREGROUPS_GETINFO );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "sharegroups",
												  null );				
		}	
		
		public function removeAlbum(shareGroupID:int, albumID:int):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, removeAlbum_result, 
								   "smugmug.sharegroups.removeAlbum", false,
								   new NameValuePair("ShareGroupID",shareGroupID),
								   new NameValuePair("AlbumID", albumID)  
								 );						
		}	
		
		private function removeAlbum_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SHAREGROUPS_REMOVEALBUM );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "sharegroups",
												  null );				
		}																										
	}
}