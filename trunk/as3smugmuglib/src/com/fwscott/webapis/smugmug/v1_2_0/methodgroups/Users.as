package com.fwscott.webapis.smugmug.v1_2_0.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_0.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	
	public class Users
	{
		private var _service:SmugMugService;
		
		public function Users( service:SmugMugService ) {
			_service = service;	
		}
		
		public function getTree( nickName:String=null, heavy:Boolean=false, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getTree_result, 
								   "smugmug.users.getTree", 
								   sitePassword != null,
								   new NameValuePair( "NickName", nickName ),
								   new NameValuePair( "Heavy", heavy ),
								   new NameValuePair( "SitePassword", sitePassword ) );
		}
		
		private function getTree_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.USERS_GETTREE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "users",
												  null );			
		}
		
		public function getTransferStats( month:int, year:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getTransferStats_result, 
								   "smugmug.users.getTransferStats", 
								   false,
								   new NameValuePair( "Month", month ),
								   new NameValuePair( "Year", year ) );
		}
		
		private function getTransferStats_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.USERS_GETTRANSFERSTATS );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "users",
												  null );			
		}
		
	}
}