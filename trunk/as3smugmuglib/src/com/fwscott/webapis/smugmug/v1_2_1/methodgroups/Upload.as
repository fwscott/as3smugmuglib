package com.fwscott.webapis.smugmug.v1_2_1.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_1.SmugMugService;
	
	import flash.events.DataEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class Upload
	{
		protected static const UPLOAD_DEST:String = "http://www.franciswscott.com/util/tempuploader.cfm";
		
		private var _service:SmugMugService;
		
		public function Upload(service:SmugMugService) {
			_service = service;
		}
		
		public function upload(fileReference:FileReference, albumID:int,caption:String=null):void {
		
 			var urlVars:URLVariables = new URLVariables();
			urlVars.AlbumID = albumID;
			urlVars.ResponseType = "REST";
			urlVars.SessionID = _service.sessionID;
			urlVars.APIKey = _service.apiKey;
			urlVars.ByteCount = fileReference.size;
			if(caption != null)
				urlVars.Caption = caption;
 			// all the other args
			fileReference.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,function (event:DataEvent):void {
				var data:Object = event.data;
				//_service.images.uploadFromURL(mx.utils.StringUtil.trim(data as String),albumID,caption);		
			},false,0,true);
			//var request:URLRequest = new URLRequest(UPLOAD_DEST + "?action=UPLOAD");
			var request:URLRequest = new URLRequest("http://upload.smugmug.com/photos/xmladd.mg");
			request.method = URLRequestMethod.POST;	
			request.data = urlVars;
			fileReference.upload(request);
						
		}
		
		private function onUploadComplete(event:DataEvent):void {

		}
	}
}