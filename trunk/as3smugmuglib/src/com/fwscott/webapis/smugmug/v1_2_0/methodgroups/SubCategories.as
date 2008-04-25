package com.fwscott.webapis.smugmug.v1_2_0.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_0.SmugMugService;
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	
	public class SubCategories
	{
		private var _service:SmugMugService;
		
		public function SubCategories( service:SmugMugService ) {
			_service = service;
		}
		
		public function get( categoryID:int, nickName:String=null, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.subcategories.get", 
								   sitePassword!=null,
								   new NameValuePair( "CategoryID", categoryID),
								   new NameValuePair( "NickName", nickName ),
								   new NameValuePair( "SitePassword", sitePassword ) );						
		}
		
		private function get_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SUBCATEGORIES_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "subcategories",
												  null );				
		}		
		

		public function getAll( nickName:String=null, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getAll_result, 
								   "smugmug.subcategories.getAll", 
								   sitePassword!=null,
								   new NameValuePair( "NickName", nickName ),
								   new NameValuePair( "SitePassword", sitePassword ) );						
		}
		
		private function getAll_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SUBCATEGORIES_GETALL );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "subcategories",
												  null );				
		}		
		
		public function create( name:String, categoryID:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, create_result, 
								   "smugmug.subcategories.create", 
								   false,
								   new NameValuePair( "CategoryID", categoryID ),
								   new NameValuePair( "Name", name ) );						
		}
		
		private function create_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SUBCATEGORIES_CREATE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "subcategories",
												  null );				
		}						

		public function deleteSubCategory( subCategoryID:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, deleteSubCategory_result, 
								   "smugmug.subcategories.delete", 
									false,
									new NameValuePair( "SubCategoryID", subCategoryID ) );						
		}
		
		private function deleteSubCategory_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SUBCATEGORIES_DELETE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "subcategories",
												  null );				
		}						
		
		public function rename( subCategoryID:int, name:String ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, rename_result, 
								   "smugmug.subcategories.rename", 
								   false,
								   new NameValuePair( "SubCategoryID", subCategoryID ),
								   new NameValuePair( "Name", name ) );						
		}
		
		private function rename_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.SUBCATEGORIES_RENAME );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "subcategories",
												  null );				
		}														
	}
}