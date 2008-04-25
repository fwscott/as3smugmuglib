package com.fwscott.webapis.smugmug.v1_2_2.methodgroups
{
	import com.adobe.serialization.json.JSON;
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_2.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_2.events.SmugMugResultEvent;
	
	import mx.rpc.events.ResultEvent;
		 
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
								   true,false,
								   new NameValuePair( "EmailAddress", emailAddress ),
								   new NameValuePair( "Password", password ));			
		}
		
		private function withPassword_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.LOGIN_WITHPASSWORD );
			var tmpResponse:Object = JSON.decode(event.target.data);
			if(tmpResponse.stat == "ok")
				_service.sessionID = tmpResponse.Login.Session.id;			
			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "login",
												  MethodGroupHelper.parseLoginResult );			
		}
		
		public function withHash( userID:String, passwordHash:String ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, withHash_result, 
								   "smugmug.login.withHash", 
								   true,false,
								   new NameValuePair( "UserID", userID ),
								   new NameValuePair( "PasswordHash", passwordHash ));					
		}
		
		private function withHash_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.LOGIN_WITHHASH );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "login",
												  MethodGroupHelper.parseLoginResult );			
			
		}
		
		
		public function anonymously():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, anonymously_result, 
								   "smugmug.login.anonymously", 
								   true,false);					
		}
		
		private function anonymously_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.LOGIN_ANONYMOUSLY );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "login",
												  MethodGroupHelper.parseLoginResult );			
			
		}
		
	}
}