package com.fwscott.webapis.smugmug.v1_2_0.methodgroups
{
	import com.fwscott.webapis.smugmug.v1_2_0.SmugMugService;
	import flash.events.Event;
	import com.fwscott.webapis.smugmug.NameValuePair;
	import com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent;
	import flash.net.URLLoader;
	import com.fwscott.webapis.smugmug.v1_2_0.AlbumSortDirection;
	import com.fwscott.webapis.smugmug.v1_2_0.AlbumSortMethod;
	import com.fwscott.webapis.smugmug.v1_2_0.AlbumTemplateView;
	import com.fwscott.webapis.smugmug.v1_2_0.AlbumSettings;
	
	public class Albums
	{
		private var _service:SmugMugService;
		
		public function Albums( service:SmugMugService ) {
			_service = service;
		}
		
		public function get( nickName:String=null, heavy:Boolean=false, sitePassword:String=null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, get_result, 
								   "smugmug.albums.get", 
								   sitePassword!=null,
								   new NameValuePair( "NickName", nickName ),
								   new NameValuePair( "Heavy", heavy.toString() ),
								   new NameValuePair( "SitePassword", sitePassword ) );						
		}
		
		private function get_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMS_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "albums",
												  null );				
		}
		
		public function getInfo( albumID:int, password:String = null, sitePassword:String = null ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getInfo_result, 
								   "smugmug.albums.getInfo", 
								   ( (sitePassword!=null) || (password!=null) ),
								   new NameValuePair( "AlbumID", albumID.toString() ),
								   new NameValuePair( "Password", password ),
								   new NameValuePair( "SitePassword", sitePassword ) );							
		}
		
		private function getInfo_result(event:Event):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMS_GET );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "albums",
												  MethodGroupHelper.parseGetAlbumsResult );						
		}

		public function create( title:String, categoryID:int, albumSettings:AlbumSettings
								):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, create_result, 
								   "smugmug.albums.create", 
								   albumSettings.password != null,
								   new NameValuePair( "Title", title ),
								   new NameValuePair( "CategoryID", categoryID.toString() ),
								   new NameValuePair( "AlbumTemplateID", albumSettings.albumTemplateID ),
								   new NameValuePair( "SubCategoryID", albumSettings.subCategoryID),
								   new NameValuePair( "CommuniyID", albumSettings.communityID ),
								   new NameValuePair( "Description", albumSettings.description ),
								   new NameValuePair( "Keywords", albumSettings.keywords),
								   new NameValuePair( "Password", albumSettings.password), 
								   new NameValuePair( "PasswordHint", albumSettings.passwordHint),
								   new NameValuePair( "Position", albumSettings.position),
								   new NameValuePair( "SortMethod", albumSettings.sortMethod),
								   new NameValuePair( "SortDirection", albumSettings.sortDirection.toString()),
								   new NameValuePair( "Public", albumSettings.isPublic),
								   new NameValuePair( "FileNames", albumSettings.fileNames),
								   new NameValuePair( "Comments", albumSettings.comments),
								   new NameValuePair( "External", albumSettings.external),
								   new NameValuePair( "EXIF", albumSettings.exif),
								   new NameValuePair( "Share", albumSettings.share),
								   new NameValuePair( "Printable", albumSettings.printable),
								   new NameValuePair( "Originals", albumSettings.originals),
								   new NameValuePair( "FamilyEdit", albumSettings.familyEdit),
								   new NameValuePair( "FriendEdit", albumSettings.friendEdit),
								   new NameValuePair( "Header", albumSettings.header),
								   new NameValuePair( "TemplateID", albumSettings.templateID),
								   new NameValuePair( "Larges", albumSettings.larges),
								   new NameValuePair( "Clean", albumSettings.clean),
								   new NameValuePair( "Protected", albumSettings.isProtected),
								   new NameValuePair( "Watermarking", albumSettings.watermarking),
								   new NameValuePair( "ProofDays", albumSettings.proofDays),
								   new NameValuePair( "BackPrinting", albumSettings.backPrinting),
								   new NameValuePair( "SmugSearchable", albumSettings.smugSearchable),
								   new NameValuePair( "WorldSearchable", albumSettings.worldSearchable) );
								   
								   
		}
		
		private function create_result(event:Event):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMS_CREATE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "albums",
												  null );						
		}


		public function changeSettings( albumID:int, albumSettings:AlbumSettings ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, changeSettings_result, 
								   "smugmug.albums.changeSettings", 
								   albumSettings.password != null,
								   new NameValuePair( "AlbumID", albumID ),
								   new NameValuePair( "SubCategoryID", albumSettings.subCategoryID),
								   new NameValuePair( "CommuniyID", albumSettings.communityID ),
								   new NameValuePair( "Description", albumSettings.description ),
								   new NameValuePair( "Keywords", albumSettings.keywords),
								   new NameValuePair( "Password", albumSettings.password), 
								   new NameValuePair( "PasswordHint", albumSettings.passwordHint),
								   new NameValuePair( "Position", albumSettings.position),
								   new NameValuePair( "SortMethod", albumSettings.sortMethod),
								   new NameValuePair( "SortDirection", albumSettings.sortDirection.toString()),
								   new NameValuePair( "Public", albumSettings.isPublic),
								   new NameValuePair( "FileNames", albumSettings.fileNames),
								   new NameValuePair( "Comments", albumSettings.comments),
								   new NameValuePair( "External", albumSettings.external),
								   new NameValuePair( "EXIF", albumSettings.exif),
								   new NameValuePair( "Share", albumSettings.share),
								   new NameValuePair( "Printable", albumSettings.printable),
								   new NameValuePair( "Originals", albumSettings.originals),
								   new NameValuePair( "FamilyEdit", albumSettings.familyEdit),
								   new NameValuePair( "FriendEdit", albumSettings.friendEdit),
								   new NameValuePair( "Header", albumSettings.header),
								   new NameValuePair( "TemplateID", albumSettings.templateID),
								   new NameValuePair( "Larges", albumSettings.larges),
								   new NameValuePair( "Clean", albumSettings.clean),
								   new NameValuePair( "Protected", albumSettings.isProtected),
								   new NameValuePair( "Watermarking", albumSettings.watermarking),
								   new NameValuePair( "ProofDays", albumSettings.proofDays),
								   new NameValuePair( "BackPrinting", albumSettings.backPrinting),
								   new NameValuePair( "SmugSearchable", albumSettings.smugSearchable),
								   new NameValuePair( "WorldSearchable", albumSettings.worldSearchable) );
								   
								   
		}
		
		private function changeSettings_result(event:Event):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMS_CHANGESETTINGS );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "albums",
												  null );						
		}

		public function reSort( albumID:int, sortBy:String, sortDirection:String ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, reSort_result, 
								   "smugmug.albums.reSort", 
								   false,
								   new NameValuePair("AlbumID", albumID),
								   new NameValuePair("By", sortBy),
								   new NameValuePair("Direction", sortDirection)
								   );
		}
		
		private function reSort_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMS_RESORT );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "albums",
												  null );												  
		}
		
		public function deleteAlbum( albumID:int ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, deleteAlbum_result, 
								   "smugmug.albums.delete", 
								   false,
								   new NameValuePair("AlbumID", albumID)
								   );			
		}
		
		private function deleteAlbum_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMS_DELETE );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "albums",
												  null );												  			
		}
		
		public function getStats( albumID:int, month:int, year:int, heavy:Boolean=false ):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( _service, getStats_result, 
								   "smugmug.albums.getStats", 
								   false,
								   new NameValuePair("AlbumID", albumID),
								   new NameValuePair("Month", month),
								   new NameValuePair("Yeah", albumID),
								   new NameValuePair("Heavy", heavy)
								   );					
		}
		
		private function getStats_result( event:Event ):void {
			var result:SmugMugResultEvent = new SmugMugResultEvent( SmugMugResultEvent.ALBUMS_GETSTATS );

			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "albums",
												  null );												  			
		}		
	}
}