package com.fwscott.webapis.smugmug.v1_2_0
{
	import com.fwscott.webapis.smugmug.v1_2_0.methodgroups.Login;
	import flash.net.URLLoader;
	import com.adobe.net.DynamicURLLoader;
	import com.adobe.webapis.URLLoaderBase;
	import flash.events.ProgressEvent;
	import com.fwscott.webapis.smugmug.smugmugservice_internal;
	import com.fwscott.webapis.smugmug.v1_2_0.methodgroups.Albums;
	import com.fwscott.webapis.smugmug.v1_2_0.methodgroups.AlbumTemplates;
	import com.fwscott.webapis.smugmug.v1_2_0.methodgroups.Categories;
	import com.fwscott.webapis.smugmug.v1_2_0.methodgroups.Images;
	import com.fwscott.webapis.smugmug.v1_2_0.methodgroups.SubCategories;
	import com.fwscott.webapis.smugmug.v1_2_0.methodgroups.Users;
	import com.fwscott.webapis.smugmug.v1_2_0.methodgroups.Logout;

	// --------------   Albums ---------------------------------
	[Event(name="albums_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="albums_getInfo", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		
	[Event(name="albums_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		
	[Event(name="albums_changeSettings", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="albums_resort", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		
	[Event(name="albums_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		
	[Event(name="albums_getStats", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	// --------------   Album Templates ---------------------------------		
	[Event(name="albumtemplates_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	// --------------   Categories ---------------------------------
	[Event(name="categories_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="categories_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		
	[Event(name="categories_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		
	[Event(name="categories_rename", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	// --------------   Images ---------------------------------
	[Event(name="images_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="images_getURLs", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="images_getInfo", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_getEXIF", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_changeSettings", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_changePosition", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_upload", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="images_uploadFromURL", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="images_getStats", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	// --------------   Login ---------------------------------		 		
	[Event(name="login_WithPassword", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="login_WithHash", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="login_Anonymously", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="smugmug_logout", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	// --------------   SubCategories ---------------------------------
	[Event(name="subcategories_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="subcategories_getAll", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		 
	[Event(name="subcategories_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		
	[Event(name="subcategories_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		
	[Event(name="subcategories_rename", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		 
	// --------------   Users ---------------------------------		 		
	[Event(name="users_getTree", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	

	[Event(name="users_getTransferStats", 
		 type="com.fwscott.webapis.smugmug.v1_2_0.events.SmugMugResultEvent")]	
		 
	public class SmugMugService extends URLLoaderBase
	{
		
		public static var END_POINT:String = "http://api.smugmug.com/services/api/json/1.2.0/";
		public static var SECURE_END_POINT:String = "https://api.smugmug.com/services/api/json/1.2.0/";		
		
		private var _login:Login;
		private var _logout:Logout;
		private var _apiKey:String;
		private var _albums:Albums;
		private var _albumTemplates:AlbumTemplates;
		private var _categories:Categories;
		private var _images:Images;
		private var _subCategories:SubCategories;
		private var _users:Users;
		private var _allSecure:Boolean;
		
		public function SmugMugService(apiKey:String, allSecure:Boolean=false) {
			_apiKey = apiKey;	
			_albums = new Albums(this);
			_albumTemplates = new AlbumTemplates(this);
			_categories = new Categories(this);
			_images = new Images(this);
			_login = new Login(this);
			_logout = new Logout(this);
			_subCategories = new SubCategories(this);
			_users = new Users(this);
			_allSecure = allSecure;
			_sessionID = "";
		}

		public function logout():void {
			_logout.logout();
		}
		
		public function get isSecure():Boolean {
			return _allSecure;
		}
				
		public function get apiKey():String {
			return _apiKey;
		}
		
		private var _sessionID:String;
		
		public function get sessionID():String {
			return _sessionID;
		}
		
		public function set sessionID(val:String):void {
			_sessionID = val;
		}
				
		public function get albums():Albums {
			return _albums;
		}
		
		public function get albumTemplates():AlbumTemplates {
			return _albumTemplates;
		}		
		
		public function get categories():Categories {
			return _categories;
		}
		
		public function get images():Images {
			return _images;
		}
		
		public function get login():Login {
			return _login;
		}
		
		public function get subCategories():SubCategories {
			return _subCategories;
		}
		
		public function get users():Users {
			return _users;	
		}
		
		private function onProgress(event:ProgressEvent):void {
			dispatchEvent(event);
		}
		/**
		 * Use our "internal" namespace to provide access to the URLLoader
		 * from this class to the helper classes in the methodgroups package.
		 * This keeps this method away from the public API since it is not meant
		 * to be used by the public.
		 */
		smugmugservice_internal function get urlLoader():URLLoader
		{
			var loader:DynamicURLLoader = getURLLoader();
				loader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			return loader;	
		}		
	}
}