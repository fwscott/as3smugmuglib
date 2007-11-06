package com.fwscott.webapis.smugmug.v1_2_1.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_1.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
		
	public class ProPricing
	{
		private var _service:SmugMugService;
		
		public function ProPricing( service:SmugMugService ) {
			_service = service;
		}
		
		public function getPortfolio(productTypes:Array=null, productIDs:Array=null):void {
			// TODO: need to find out how you send an array as params
			// Let the Helper do the work to invoke the method
 			MethodGroupHelper.invokeMethod( _service, getPortfolio_result, 
								   "smugmug.propricing.getPortfolio", false	  
								 );
		}
		
		private function getPortfolio_result( event:Event ):void {
 			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.PROPRICING_GETPORTFOLIO );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "propricing",
												  null );
		}					
		
		public function getAlbum(productTypes:Array=null, productIDs:Array=null):void {
			// TODO: need to find out how you send an array as params
			// Let the Helper do the work to invoke the method
 			MethodGroupHelper.invokeMethod( _service, getAlbum_result, 
								   "smugmug.propricing.getAlbum", false	  
								 );
		}
		
		private function getAlbum_result( event:Event ):void {
 			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.PROPRICING_GETALBUM );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "propricing",
												  null );
		}									

		public function getImage(productTypes:Array=null, productIDs:Array=null):void {
			// TODO: need to find out how you send an array as params
			// Let the Helper do the work to invoke the method
 			MethodGroupHelper.invokeMethod( _service, getImage_result, 
								   "smugmug.propricing.getImage", false	  
								 );
		}
		
		private function getImage_result( event:Event ):void {
 			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.PROPRICING_GETIMAGE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "propricing",
												  null );
		}									

	}
}