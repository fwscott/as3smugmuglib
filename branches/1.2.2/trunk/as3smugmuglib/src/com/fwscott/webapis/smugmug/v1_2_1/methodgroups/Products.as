package com.fwscott.webapis.smugmug.v1_2_1.methodgroups
{
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_1.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
		
	public class Products
	{
		private var _service:SmugMugService;
		
		public function Products( service:SmugMugService ) {
			_service = service;
		}
		
		public function get():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.products.get", false	  
								 );						
		}
		
		private function get_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.PRODUCTS_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "products",
												  null );				
		}						
	}
}