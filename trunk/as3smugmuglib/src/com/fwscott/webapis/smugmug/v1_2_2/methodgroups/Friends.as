package com.fwscott.webapis.smugmug.v1_2_2.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_2.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_2.events.SmugMugResultEvent;
	
	import mx.rpc.events.ResultEvent;
	
	public class Friends
	{
		private var _service:SmugMugService;
		
		public function Friends( service:SmugMugService ) {
			_service = service;
		}
		
		public function get():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.friends.get", false,false	  
								 );						
		}
		
		private function get_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FRIENDS_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "friends",
												  null );				
		}		
		
		public function add( nickName:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, add_result, 
								   "smugmug.friends.add", false,false,
								   new NameValuePair( "NickName", nickName )
								 );						
		}
		
		private function add_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FRIENDS_ADD );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "friends",
												  null );				
		}	
		

		public function remove( nickName:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, remove_result, 
								   "smugmug.friends.remove", false,false,
								   new NameValuePair( "NickName", nickName )
								 );						
		}
		
		private function remove_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FRIENDS_REMOVE );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "friends",
												  null );				
		}		
		
		public function removeAll():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, removeAll_result, 
								   "smugmug.friends.remove", false,false
								 );						
		}
		
		private function removeAll_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FRIENDS_REMOVEALL );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "friends",
												  null );				
		}				
		
	}
}