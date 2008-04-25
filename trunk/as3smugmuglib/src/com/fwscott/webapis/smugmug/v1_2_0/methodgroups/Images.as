package com.fwscott.webapis.smugmug.v1_2_0.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_0.ImageSettings;
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_0.SmugMugService;
	import com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent;
	
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	
	public class Images
	{
		private var _service:SmugMugService;
		private var _upload:Upload;
		public function Images( service:SmugMugService ) {
			_service = service;
			_upload = new Upload(_service);
		}

		
		public function get( albumID:int, albumKey:String, heavy:Boolean=false, password:String=null, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.images.get", 
								   ((sitePassword!=null) || (password!=null)),
								   new NameValuePair( "AlbumID", albumID ),
								   new NameValuePair( "AlbumKey", albumKey ),
								   new NameValuePair( "Heavy", heavy ),
								   new NameValuePair( "Password", password ),
								   new NameValuePair( "SitePassword", sitePassword ) );						
		}
		
		private function get_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );				
		}		

		public function getURLs( imageID:int, imageKey:String, templateID:int=3, password:String=null, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getURLs_result, 
								   "smugmug.images.getURLs", 
								   ((sitePassword!=null) || (password!=null)),
								   new NameValuePair( "ImageID", imageID ),
								   new NameValuePair( "ImageKey", imageKey ),
								   new NameValuePair( "TemplateID", templateID ),
								   new NameValuePair( "Password", password ),
								   new NameValuePair( "SitePassword", sitePassword ) );						
		}
		
		private function getURLs_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_GETURLS );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );				
		}		

		public function getInfo( imageID:int, imageKey:String, password:String=null, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getInfo_result, 
								   "smugmug.images.getInfo", 
								   ((sitePassword!=null) || (password!=null)),
								   new NameValuePair( "ImageID", imageID ),
								   new NameValuePair( "ImageKey", imageKey ),
								   new NameValuePair( "Password", password ),
								   new NameValuePair( "SitePassword", sitePassword ) );						
		}
		
		private function getInfo_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_GETINFO );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );				
		}		

		public function getEXIF( imageID:int, imageKey:String, password:String=null, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getEXIF_result, 
								   "smugmug.images.getEXIF", 
								   ((sitePassword!=null) || (password!=null)),
								   new NameValuePair( "ImageID", imageID ),
								   new NameValuePair( "ImageKey", imageKey ),
								   new NameValuePair( "Password", password ),
								   new NameValuePair( "SitePassword", sitePassword ) );						
		}
		
		private function getEXIF_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_GETEXIF );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );				
		}		

		public function changeSettings( imageID:int, imageSettings:ImageSettings ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, changeSettings_result, 
								   "smugmug.images.changeSettings", 
								   false,
								   new NameValuePair( "ImageID", imageID ),
								   new NameValuePair( "AlbumID", imageSettings.albumID ),
								   new NameValuePair( "Caption", imageSettings.caption ),
								   new NameValuePair( "Keywords", imageSettings.keywords ) );						
		}
		
		private function changeSettings_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_CHANGESETTINGS );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );				
		}		

		public function changePosition( imageID:int, position:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, changePosition_result, 
								   "smugmug.images.changePosition", 
								   false,
								   new NameValuePair( "ImageID", imageID ),
								   new NameValuePair( "Position", position ) );						
		}
		
		private function changePosition_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_CHANGEPOSITION );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );				
		}			
		
		public function uploadFromURL(URL:String, albumID:int, caption:String="", keywords:Array=null,
									latitude:String=null, longitude:String=null, altitude:String=null,
									byteCount:Number=NaN, MD5Sum:Number=NaN):void {
			var keywordsStr:String = null;
			
			if(keywords != null  && keywords.length > 0)
				keywordsStr = keywords.join(";");
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, uploadFromURL_result, 
								   "smugmug.images.uploadFromURL", 
								   false,
								   new NameValuePair( "URL", URL ),
								   new NameValuePair( "AlbumID", albumID ),
								   new NameValuePair( "Caption", caption ),
								   new NameValuePair( "Keywords", keywordsStr ),
								   new NameValuePair( "Latitude", latitude ),
								   new NameValuePair( "Longitude", longitude ),
								   new NameValuePair( "altitude", altitude ),
								   new NameValuePair( "ByteCount", byteCount ),
								   new NameValuePair( "MD5Sum", MD5Sum )
								    );														
		}
		
		private function uploadFromURL_result(event:Event):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_UPLOADFROMURL );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );			
		}
		public function upload(fileReference:FileReference, albumID:int, caption:String):void {
			//always send to an external upload class so each developer can implement his/her own
			// till I can figure out a standard way to do this in flash
			_upload.upload(fileReference,albumID,caption);
		}
		
		private function onUploadComplete(event:DataEvent):void {
			trace(event.data);
		}
		
		public function deleteImage( imageID:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, deleteImage_result, 
								   "smugmug.images.delete", 
								   false,
								   new NameValuePair( "ImageID", imageID ) );						
		}
		
		private function deleteImage_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_DELETE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );				
		}
		
		
		public function getStats( imageID:int, month:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getStats_result, 
								   "smugmug.images.getStats", 
								   false,
								   new NameValuePair( "ImageID", imageID ),
								   new NameValuePair( "Month", month ) );						
		}
		
		private function getStats_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.IMAGES_GETSTATS );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "images",
												  null );				
		}													
	}
}