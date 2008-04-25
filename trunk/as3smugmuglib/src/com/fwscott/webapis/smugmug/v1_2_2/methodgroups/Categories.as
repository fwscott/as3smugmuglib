package com.fwscott.webapis.smugmug.v1_2_2.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_2.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_2.events.SmugMugResultEvent;
	import com.fwscott.webapis.smugmug.NameValuePair;
	
	import mx.rpc.events.ResultEvent;
	
	public class Categories
	{
		private var _service:SmugMugService;
		
		public function Categories( service:SmugMugService ) {
			_service = service;
		}
		
		public function get( nickName:String=null, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.categories.get", 
								   sitePassword!=null,false,
								   new NameValuePair( "NickName", nickName ),
								   new NameValuePair( "SitePassword", sitePassword ) );						
		}
		
		private function get_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.CATEGORIES_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "categories",
												  null );				
		}						
		
		public function create( name:String ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, create_result, 
								   "smugmug.categories.create", 
								   false,false,
								   new NameValuePair( "Name", name ) );						
		}
		
		private function create_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.CATEGORIES_CREATE );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "categories",
												  null );				
		}						

		public function deleteCategory( categoryID:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, deleteCategory_result, 
								   "smugmug.categories.delete", 
									false,false,
									new NameValuePair( "CategoryID", categoryID ) );						
		}
		
		private function deleteCategory_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.CATEGORIES_DELETE );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "categories",
												  null );				
		}						
		
		public function rename( categoryID:int, name:String ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, rename_result, 
								   "smugmug.categories.rename", 
								   false,false,
								   new NameValuePair( "CategoryID", categoryID ),
								   new NameValuePair( "Name", name ) );						
		}
		
		private function rename_result( event:ResultEvent ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.CATEGORIES_RENAME );

			MethodGroupHelper.processAndDispatch( _service, 
												  String(event.result), 
												  result,
												  "categories",
												  null );				
		}						
		
	}
}