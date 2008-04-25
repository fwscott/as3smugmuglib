package com.fwscott.webapis.smugmug.v1_2_2.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_2.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_2.events.SmugMugResultEvent;
	
	import mx.rpc.events.ResultEvent;
	
	public class Family
	{
		private var _service:SmugMugService;
		
		public function Family( service:SmugMugService ) {
			_service = service;
		}
		
		public function get( ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.family.get",false,false
								 );						
		}
		
		private function get_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FAMILY_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "family",
												  null );				
		}		
		
		public function add( nickName:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, add_result, 
								   "smugmug.family.add", false,false,
								   new NameValuePair( "NickName", nickName )
								 );						
		}
		
		private function add_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FAMILY_ADD );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "family",
												  null );				
		}	
		

		public function remove( nickName:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, remove_result, 
								   "smugmug.family.remove",false,false, 
								   new NameValuePair( "NickName", nickName )
								 );						
		}
		
		private function remove_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FAMILY_REMOVE );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "family",
												  null );				
		}		
		
		public function removeAll():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, removeAll_result, 
								   "smugmug.family.remove", false,false
								 );						
		}
		
		private function removeAll_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.FAMILY_REMOVEALL );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "family",
												  null );				
		}				
	}
}