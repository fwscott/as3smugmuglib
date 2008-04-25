package com.fwscott.webapis.smugmug.v1_2_1
{
	import com.adobe.net.DynamicURLLoader;
	import com.adobe.webapis.URLLoaderBase;
	import com.fwscott.webapis.smugmug.smugmugservice_internal;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.AlbumTemplates;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Albums;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Categories;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Family;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Friends;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Images;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Login;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Logout;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.ProPricing;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Products;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.ShareGroups;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.SubCategories;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Themes;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Users;
	import com.fwscott.webapis.smugmug.v1_2_1.methodgroups.Watermarks;
	
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;

	// --------------   Albums ---------------------------------
	[Event(name="albums_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="albums_getInfo", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		
	[Event(name="albums_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		
	[Event(name="albums_changeSettings", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="albums_resort", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		
	[Event(name="albums_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		
	[Event(name="albums_getStats", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
	
	[Event(name="albums_applyWatermark", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 
	[Event(name="albums_removeWatermark", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 
	// --------------   Album Templates ---------------------------------		
	[Event(name="albumtemplates_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="albumtemplates_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]
		 
	[Event(name="albumtemplates_changeSettings", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]			 	
		 
	// --------------   Categories ---------------------------------
	[Event(name="categories_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="categories_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		
	[Event(name="categories_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		
	[Event(name="categories_rename", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

    // --------------   Family ---------------------------------
	[Event(name="family_add", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	    
		 
	[Event(name="family_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	    

	[Event(name="family_remove", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	    

	[Event(name="family_removeAll", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	    
		 
    // --------------   Friends ---------------------------------
	[Event(name="friends_add", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	 
		 
	[Event(name="friends_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	 		    
 
	[Event(name="friends_remove", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	     		 
		 
	[Event(name="friends_removeAll", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	 		 
		 
	// --------------   Images ---------------------------------
	[Event(name="images_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="images_getURLs", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="images_getInfo", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_getEXIF", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_changeSettings", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_changePosition", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_upload", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="images_uploadFromURL", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 		
	[Event(name="images_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="images_getStats", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 
	[Event(name="images_applyWatermark", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]			 

	[Event(name="images_crop", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 
	[Event(name="images_rotate", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]			 

	[Event(name="images_removeWatermark", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]			 

	[Event(name="images_zoomThumbnail", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]			 
		 
	// --------------   Login ---------------------------------		 		
	[Event(name="login_WithPassword", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="login_WithHash", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="login_Anonymously", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="smugmug_logout", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	// --------------   Products ---------------------------------
	[Event(name="products_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	// --------------   ProPricing ---------------------------------
	[Event(name="propricing_getProtfolio", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="propricing_getAlbum", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="propricing_getImage", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	// --------------   ShareGroups ---------------------------------
	[Event(name="sharegroups_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="sharegroups_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="sharegroups_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="sharegroups_getInfo", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 
	[Event(name="sharegroups_removeAlbum", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="sharegroups_addAlbum", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 
		 		 
	// --------------   SubCategories ---------------------------------
	[Event(name="subcategories_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="subcategories_getAll", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 
	[Event(name="subcategories_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		
	[Event(name="subcategories_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		
	[Event(name="subcategories_rename", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	// --------------   Themes ---------------------------------		 		
	[Event(name="themes_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	
		 		 
	// --------------   Users ---------------------------------		 		
	[Event(name="users_getTree", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="users_getTransferStats", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	[Event(name="users_getDisplayName", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]	

	// --------------   Watermarks ---------------------------------		 		
	[Event(name="watermarks_changeSettings", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]		 
		 
	[Event(name="watermarks_create", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]		 

	[Event(name="watermarks_delete", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]		 
		 		 
	[Event(name="watermarks_get", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]		 

	[Event(name="watermarks_getInfo", 
		 type="com.fwscott.webapis.smugmug.v1_2_1.events.SmugMugResultEvent")]		 
		 		 
	public class SmugMugService extends URLLoaderBase
	{
		
		public static var END_POINT:String = "http://api.smugmug.com/services/api/json/1.2.1/";
		public static var SECURE_END_POINT:String = "https://api.smugmug.com/services/api/json/1.2.1/";		
		
		private var _login:Login;
		private var _logout:Logout;
		private var _apiKey:String;
		private var _albums:Albums;
		private var _albumTemplates:AlbumTemplates;
		private var _categories:Categories;
		private var _family:Family;
		private var _friends:Friends;
		private var _images:Images;
		private var _products:Products;
		private var _proPricing:ProPricing;
		private var _shareGroups:ShareGroups;
		private var _subCategories:SubCategories;
		private var _themes:Themes;
		private var _users:Users;
		private var _watermarks:Watermarks;
		private var _allSecure:Boolean;
		
		public function SmugMugService(apiKey:String, allSecure:Boolean=false) {
			_apiKey = apiKey;	
			_albums = new Albums(this);
			_albumTemplates = new AlbumTemplates(this);
			_categories = new Categories(this);
			_family = new Family(this);
			_friends = new Friends(this);
			_images = new Images(this);
			_login = new Login(this);
			_logout = new Logout(this);
			_products = new Products(this);
			_proPricing = new ProPricing(this);
			_shareGroups = new ShareGroups(this);
			_subCategories = new SubCategories(this);
			_themes = new Themes(this);
			_users = new Users(this);
			_watermarks = new Watermarks(this);
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
		
		public function get family():Family {
			return _family;
		}
		
		public function get friends():Friends {
			return _friends;
		}
		
		public function get images():Images {
			return _images;
		}
		
		public function get login():Login {
			return _login;
		}
		
		public function get products():Products {
			return _products;
		}
		
		public function get proPricing():ProPricing {
			return _proPricing;	
		}
		
		public function get subCategories():SubCategories {
			return _subCategories;
		}
		
		public function get themes():Themes {
			return _themes;
		}
		
		public function get users():Users {
			return _users;	
		}
		
		public function get watermarks():Watermarks {
			return _watermarks;
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