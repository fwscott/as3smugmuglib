package com.fwscott.webapis.smugmug.v1_2_0
{
	import flexunit.framework.TestCase;
	import flexunit.framework.Test;
	import flexunit.framework.TestSuite;
	import com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent;

	public class SmugMugServiceTestAuthPassword extends TestCase
	{
		
		private const CALL_TIMEOUT:int = 20000;
		private static var _service:SmugMugService;
		public static var setupProperties:TestSetupProperties;
				
		public function SmugMugServiceTestAuthPassword(methodName:String=null)
		{
			super(methodName);
		}

		public static function suite():TestSuite {
			var ts:TestSuite = new TestSuite();
			
			// Order of the tests are important
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testAPIKey") ) );
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testValidAPIKey") ) );
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testLogin") ) );
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testUsersGetTree") ) );
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testUsersGetTransferStats") ) );			
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testAlbumTemplatesGet") ) );
			// A Category must be created before we try to lookup / create subcategories
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testCategoriesGetNoName") ) );
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testCategoriesCreate") ) );
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testSubCategoriesCreate") ) );						
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testSubCategoriesGet") ) );
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testSubCategoriesGetAll") ) );									
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testSubCategoriesRename") ) );						
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testSubCategoriesDelete") ) );						
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testCategoriesRename") ) );
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testCategoriesDelete") ) );			
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testAlbumsGet") ) );			
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testAlbumsGetInfo") ) );			
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testAlbumsGetStats") ) );			
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testAlbumsChangeSettings") ) );				
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testAlbumsCreate") ) );				
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testAlbumsDelete") ) );				
			ts.addTest( Test( new SmugMugServiceTestAuthPassword("testLogout") ) );						
			return ts;
		}
		
		public function testAPIKey():void {
			_service = new SmugMugService( setupProperties.API_KEY );
		
			assertTrue( "service.apiKey == API_KEY", _service.apiKey == setupProperties.API_KEY );
		}
		
		public function testValidAPIKey():void {
			_service.addEventListener(SmugMugResultEvent.LOGIN_ANONYMOUSLY, addAsync( onLoginAnonymously, CALL_TIMEOUT ) );
			_service.login.anonymously();
			
		}

		private function onLoginAnonymously(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
		}
		
		// ------------------------- Login methods ------------------------------
		public function testLogin():void {
			_service.addEventListener( SmugMugResultEvent.LOGIN_WITHPASSWORD, 
									  addAsync( onLoginWithPassword, CALL_TIMEOUT ) );
			_service.login.withPassword(setupProperties.EMAILADDRESS, setupProperties.PASSWORD);		
			
		}	
		
		private function onLoginWithPassword( event:SmugMugResultEvent ):void {
			assertGenericPassOrFail(event);
		}	
		
		// ------------------------- Users methods ------------------------------
		public function testUsersGetTree():void {
			_service.addEventListener( SmugMugResultEvent.USERS_GETTREE, 
									  addAsync( onGetTree, CALL_TIMEOUT ) );
			_service.users.getTree();				
		}
		
		private function onGetTree( event:SmugMugResultEvent ):void {
			assertGenericPassOrFail(event);
		}
		
		public function testUsersGetTransferStats():void {
			var today:Date = new Date();
			
			_service.addEventListener( SmugMugResultEvent.USERS_GETTRANSFERSTATS, 
									  addAsync( onUsersGetTransferStats, CALL_TIMEOUT ) );
			
			_service.users.getTransferStats(today.month, int(today.fullYear));
		}
		
		private function onUsersGetTransferStats( event:SmugMugResultEvent ):void {
			assertGenericPassOrFail(event);
		}
	
		// ------------------------- Album Template methods ------------------------------
		
		public function testAlbumTemplatesGet():void {
			_service.addEventListener( SmugMugResultEvent.ALBUMTEMPLATES_GET, 
									  addAsync( onAlbumTemplatesGet, CALL_TIMEOUT ) );
			
			_service.albumTemplates.get();			
		}
		
		private function onAlbumTemplatesGet( event:SmugMugResultEvent ):void {
			assertGenericPassOrFail(event);
		}
		
		
		
		// ------------------------- Categories methods ------------------------------		
		public function testCategoriesGetNoName():void {
			_service.addEventListener( SmugMugResultEvent.CATEGORIES_GET, 
									  addAsync( onCategoriesGetNoName, CALL_TIMEOUT ) );
			
			_service.categories.get();				
		}
		
		private function onCategoriesGetNoName(event:SmugMugResultEvent):void {
			assertGenericPassOrFail( event );
		}

		public function testCategoriesCreate():void {
			_service.addEventListener( SmugMugResultEvent.CATEGORIES_CREATE, 
									  addAsync( onCategoriesCreate, CALL_TIMEOUT ) );
			
			_service.categories.create(setupProperties.CATEGORYTOCREATE + "_" + new Date().time.toString());				
		}
		
		private function onCategoriesCreate(event:SmugMugResultEvent):void {
			assertGenericPassOrFail( event );
			if(event.success)
				setupProperties.newcatid = int(event.data.Category.id);
		}		

		public function testCategoriesRename():void {
			_service.addEventListener( SmugMugResultEvent.CATEGORIES_RENAME, 
									  addAsync( onCategoriesRename, CALL_TIMEOUT ) );
			
			_service.categories.rename(setupProperties.newcatid,setupProperties.CATEGORYTOCREATE + "_" + new Date().time.toString());				
		}
		
		private function onCategoriesRename( event:SmugMugResultEvent ):void {
			assertGenericPassOrFail( event );
		}		

		public function testCategoriesDelete():void {
			_service.addEventListener( SmugMugResultEvent.CATEGORIES_DELETE, 
									  addAsync( onCategoriesDelete, CALL_TIMEOUT ) );
			
			_service.categories.deleteCategory(setupProperties.newcatid);				
		}
		
		private function onCategoriesDelete( event:SmugMugResultEvent ):void {
			assertGenericPassOrFail( event );
		}		
		
		
		// ------------------------- SubCategories methods ------------------------------		
		public function testSubCategoriesGet():void {
			_service.addEventListener( SmugMugResultEvent.SUBCATEGORIES_GET, 
									  addAsync( onSubCategoriesGet, CALL_TIMEOUT ) );
			
			_service.subCategories.get(setupProperties.newcatid);				
		}
		
		private function onSubCategoriesGet(event:SmugMugResultEvent):void {
			assertGenericPassOrFail( event );
		}

		public function testSubCategoriesGetAll():void {
			_service.addEventListener( SmugMugResultEvent.SUBCATEGORIES_GETALL, 
									  addAsync( onSubCategoriesGetAll, CALL_TIMEOUT ) );
			
			_service.subCategories.getAll();				
		}
		
		private function onSubCategoriesGetAll(event:SmugMugResultEvent):void {
			assertGenericPassOrFail( event );
		}
		public function testSubCategoriesCreate():void {
			_service.addEventListener( SmugMugResultEvent.SUBCATEGORIES_CREATE, 
									  addAsync( onSubCategoriesCreate, CALL_TIMEOUT ) );
			
			_service.subCategories.create("subcat_from_as",setupProperties.newcatid);				
		}
		
		private function onSubCategoriesCreate(event:SmugMugResultEvent):void {
			assertGenericPassOrFail( event );
			if(event.success)
				setupProperties.newsubcatid = int(event.data.SubCategory.id);
		}		

		public function testSubCategoriesRename():void {
			_service.addEventListener( SmugMugResultEvent.SUBCATEGORIES_RENAME, 
									  addAsync( onSubCategoriesRename, CALL_TIMEOUT ) );
			
			_service.subCategories.rename(setupProperties.newsubcatid,"subcat_rename");				
		}
		
		private function onSubCategoriesRename( event:SmugMugResultEvent ):void {
			assertGenericPassOrFail( event );
		}		

		public function testSubCategoriesDelete():void {
			_service.addEventListener( SmugMugResultEvent.SUBCATEGORIES_DELETE, 
									  addAsync( onSubCategoriesDelete, CALL_TIMEOUT ) );
			
			_service.subCategories.deleteSubCategory(setupProperties.newsubcatid);				
		}
		
		private function onSubCategoriesDelete( event:SmugMugResultEvent ):void {
			assertGenericPassOrFail( event );
		}		
		
		// ----------------------------------   Logout -----------------------------
		public function testLogout():void {
			_service.addEventListener( SmugMugResultEvent.LOGOUT, 
							  addAsync( onLogout, CALL_TIMEOUT ) );
			_service.logout();
		}
		
		private function onLogout(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
		}
		
		
		// --------------------------- Album Tests ------------------------
		public function testAlbumsGet():void {
			_service.addEventListener( SmugMugResultEvent.ALBUMS_GET, 
							  addAsync( onAlbumsGet, CALL_TIMEOUT ) );
			_service.albums.get();
		}
		
		private function onAlbumsGet(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
			if(event.success) {
				var albums:Array = event.data.Albums;
				setupProperties.inspectalbumid = albums[0].id;
			}
		}		
	
		public function testAlbumsGetInfo():void {
			_service.addEventListener( SmugMugResultEvent.ALBUMS_GETINFO, 
							  addAsync( onAlbumsGetInfo, CALL_TIMEOUT ) );
			_service.albums.getInfo(setupProperties.inspectalbumid);
		}
		
		private function onAlbumsGetInfo(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
		}				

		public function testAlbumsGetStats():void {
			var today:Date = new Date();
			_service.addEventListener( SmugMugResultEvent.ALBUMS_GETSTATS, 
							  addAsync( onAlbumsGetStats, CALL_TIMEOUT ) );
			_service.albums.getStats(setupProperties.inspectalbumid,today.month,today.fullYear);
		}
		
		private function onAlbumsGetStats(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
		}				
		
		public function testAlbumsResort():void {
			_service.addEventListener( SmugMugResultEvent.ALBUMS_RESORT, 
							  addAsync( onAlbumsResort, CALL_TIMEOUT ) );
			_service.albums.reSort(setupProperties.inspectalbumid,AlbumSortMethod.POSITION,"DESC");
		}
		
		private function onAlbumsResort(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
		}	
		
		public function testAlbumsChangeSettings():void {
			var settings:AlbumSettings = new AlbumSettings();
			settings.description = "just changing the comments to last runtime - " + new Date().time.toString(); 
			_service.addEventListener( SmugMugResultEvent.ALBUMS_CHANGESETTINGS, 
							  addAsync( onAlbumsResort, CALL_TIMEOUT ) );
			_service.albums.changeSettings(setupProperties.inspectalbumid,settings);
		}
		
		private function onAlbumsChangeSettings(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
		}
		
		public function testAlbumsCreate():void {
			var albumSettings:AlbumSettings = new AlbumSettings();
			albumSettings.description = "created by unit tests";
			albumSettings.smugSearchable = false;
			albumSettings.worldSearchable = false;
			
			_service.addEventListener( SmugMugResultEvent.ALBUMS_CREATE, 
							  addAsync( onAlbumsCreate, CALL_TIMEOUT ) );
			_service.albums.create("test_album_" + new Date().time.toString(),1, new AlbumSettings());
		}
		
		private function onAlbumsCreate(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
			if(event.success) {
				setupProperties.newalbumid = event.data.Album.id;
			}
		}				

		public function testAlbumsDelete():void {
						
			_service.addEventListener( SmugMugResultEvent.ALBUMS_DELETE, 
							  addAsync( onAlbumsDelete, CALL_TIMEOUT ) );
			_service.albums.deleteAlbum(setupProperties.newalbumid);
		}
		
		private function onAlbumsDelete(event:SmugMugResultEvent):void {
			assertGenericPassOrFail(event);
		}				
		
		
		private function assertGenericPassOrFail( event:SmugMugResultEvent ):void {
			assertTrue("event.success == true", event.success);
		}	
			
	}
}