package com.fwscott.webapis.smugmug.v1_2_0.methodgroups
{
	import com.adobe.serialization.json.JSON;
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_0.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
		 
	public class Login
	{
		private var _service:SmugMugService;
		
		public function Login( service:SmugMugService ) {
			_service = service;
		}
		
		public function withPassword( emailAddress:String, password:String ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, withPassword_result, 
								   "smugmug.login.withPassword", 
								   true,
								   new NameValuePair( "EmailAddress", emailAddress ),
								   new NameValuePair( "Password", password ));			
		}
		
		private function withPassword_result(event:Event):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.LOGIN_WITHPASSWORD );
			var tmpResponse:Object = JSON.decode(event.target.data);
			if(tmpResponse.stat == "ok")
				_service.sessionID = tmpResponse.Login.Session.id;			
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "login",
												  MethodGroupHelper.parseLoginResult );			
		}
		
		public function withHash( userID:String, passwordHash:String ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, withHash_result, 
								   "smugmug.login.withHash", 
								   true,
								   new NameValuePair( "UserID", userID ),
								   new NameValuePair( "PasswordHash", passwordHash ));					
		}
		
		private function withHash_result(event:Event):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.LOGIN_WITHHASH );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "login",
												  MethodGroupHelper.parseLoginResult );			
			
		}
		
		
		public function anonymously():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, anonymously_result, 
								   "smugmug.login.anonymously", 
								   true);					
		}
		
		private function anonymously_result(event:Event):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.LOGIN_ANONYMOUSLY );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "login",
												  MethodGroupHelper.parseLoginResult );			
			
		}
		
	}
}