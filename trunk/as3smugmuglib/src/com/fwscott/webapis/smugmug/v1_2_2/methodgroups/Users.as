package com.fwscott.webapis.smugmug.v1_2_2.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_2.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_2.events.SmugMugResultEvent;
	
	import mx.rpc.events.ResultEvent;
	
	public class Users
	{
		private var _service:SmugMugService;
		
		public function Users( service:SmugMugService ) {
			_service = service;	
		}
		
		public function getTree( nickName:String=null, heavy:Boolean=false, extras:String=null, sitePassword:String=null, shareGroup:Array=null, getAsXML:Boolean=false ):void {
			// Let the Helper do the work to invoke the method
			// TODO: do something with the array of sharegroup
			var resultProcessor:Function;
			
			if (getAsXML)
				resultProcessor = getRAWTree_result;
			else
				resultProcessor = getTree_result;
			
			MethodGroupHelper.invokeMethod( _service, resultProcessor, 
								   "smugmug.users.getTree", 
								   sitePassword != null,getAsXML,
								   new NameValuePair( "NickName", nickName ),
								   new NameValuePair( "Heavy", heavy ),
								   new NameValuePair( "Extras", extras ),
								   new NameValuePair( "SitePassword", sitePassword ) );
		}
		
		private function getTree_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.USERS_GETTREE );
			
			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "users",
												  null );
		}
		
		private function getRAWTree_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.USERS_GETTREE );
			
			MethodGroupHelper.processRAWAndDispatch( _service, 
												  XML(event.result), 
												  result,
												  "users",
												  null );
		}
		
		/**
		 * Converts a SmugMug tree to a useable XMLList
		 */
		public function smugmugTreeToXMLList(smTree:XML,stripEmptyCategories:Boolean=false):XMLList {
			// unimplimented
			var oldTree:String = smTree.toXMLString();
			var newTree:XMLList;
			var myPattern:RegExp;
			
			// remove <Albums>
			myPattern = /<Albums>/gi;
			oldTree = oldTree.replace(myPattern,"");
			myPattern = /<\/Albums>/gi;
			oldTree = oldTree.replace(myPattern,"");
			
			// remove <SubCategories>
			myPattern = /<SubCategories>/gi;
			oldTree = oldTree.replace(myPattern,"");
			myPattern = /<\/SubCategories>/gi;
			oldTree = oldTree.replace(myPattern,"");
			
			// strip out empty categories
			if (stripEmptyCategories) {
				myPattern = /<Category(.*)\/>/gi;
				oldTree = oldTree.replace(myPattern,"");
				myPattern = /<SubCategory(.*)\/>/gi;
				oldTree = oldTree.replace(myPattern,"");
			}
			
			// change Title= to Name=
			myPattern = /Title=/gi;
			oldTree = oldTree.replace(myPattern,"Name=");
			
			// fix escaped &###; style characters
			myPattern = /\&amp;/gi;
			oldTree = oldTree.replace(myPattern,"&");
			
			newTree = new XMLList(oldTree);
			
			return newTree;
		}
		
		public function getTransferStats( month:int, year:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getTransferStats_result, 
								   "smugmug.users.getTransferStats", 
								   false,false,
								   new NameValuePair( "Month", month ),
								   new NameValuePair( "Year", year ) );
		}
		
		private function getTransferStats_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.USERS_GETTRANSFERSTATS );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "users",
												  null );			
		}

		public function getDisplayName( nickName:String ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getDisplayName_result, 
								   "smugmug.users.getDisplayName", 
								   false,false,
								   new NameValuePair( "NickName", nickName )
								   );
		}
		
		private function getDisplayName_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.USERS_GETDISPLAYNAME );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "users",
												  null );			
		}		
	}
}