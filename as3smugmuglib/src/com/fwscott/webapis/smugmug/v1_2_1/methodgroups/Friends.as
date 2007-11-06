package com.fwscott.webapis.smugmug.v1_2_1.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_1.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	
	public class Friends
	{
		private var _service:SmugMugService;
		
		public function Friends( service:SmugMugService ) {
			_service = service;
		}
		
		public function get():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.friends.get", false	  
								 );						
		}
		
		private function get_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FRIENDS_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "friends",
												  null );				
		}		
		
		public function add( nickName:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, add_result, 
								   "smugmug.friends.add", false,
								   new NameValuePair( "NickName", nickName )
								 );						
		}
		
		private function add_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FRIENDS_ADD );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "friends",
												  null );				
		}	
		

		public function remove( nickName:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, remove_result, 
								   "smugmug.friends.remove", false,
								   new NameValuePair( "NickName", nickName )
								 );						
		}
		
		private function remove_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FRIENDS_REMOVE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "friends",
												  null );				
		}		
		
		public function removeAll():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, removeAll_result, 
								   "smugmug.friends.remove", false
								 );						
		}
		
		private function removeAll_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FRIENDS_REMOVEALL );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "friends",
												  null );				
		}				
		
	}
}