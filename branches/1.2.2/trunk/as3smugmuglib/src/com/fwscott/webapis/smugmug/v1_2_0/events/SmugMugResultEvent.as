package com.fwscott.webapis.smugmug.v1_2_0.events
{
	import flash.events.Event;

	public class SmugMugResultEvent extends Event
	{
		
		public static const ALBUMS_GET:String = "albums_get";
		public static const ALBUMS_GETINFO:String = "albums_getInfo";
		public static const ALBUMS_CREATE:String = "albums_create";
		public static const ALBUMS_CHANGESETTINGS:String = "albums_changeSettings";		
		public static const ALBUMS_RESORT:String = "albums_resort";		
		public static const ALBUMS_DELETE:String = "albums_delete";		
		public static const ALBUMS_GETSTATS:String = "albums_getStats";		

		public static const ALBUMTEMPLATES_GET:String = "albumtemplates_get";
	
		public static const CATEGORIES_GET:String = "categories_get";				
		public static const CATEGORIES_CREATE:String = "categories_create";
		public static const CATEGORIES_DELETE:String = "categories_delete";								
		public static const CATEGORIES_RENAME:String = "categories_rename";										
	
		public static const IMAGES_GET:String = "images_get";				
		public static const IMAGES_GETURLS:String = "images_getURLS";
		public static const IMAGES_GETINFO:String = "images_getInfo";
		public static const IMAGES_GETEXIF:String = "images_getEXIF";										
		public static const IMAGES_CHANGESETTINGS:String = "images_changeSettings";				
		public static const IMAGES_CHANGEPOSITION:String = "images_changePosition";				
		public static const IMAGES_UPLOAD:String = "images_upload";				
		public static const IMAGES_UPLOADFROMURL:String = "images_uploadFromURL";				
		public static const IMAGES_DELETE:String = "images_delete";				
		public static const IMAGES_GETSTATS:String = "images_getStats";				

		public static const LOGIN_WITHPASSWORD:String = "login_withPassword";
		public static const LOGIN_WITHHASH:String = "login_withHash";		
		public static const LOGIN_ANONYMOUSLY:String = "login_anonymously";		
	
		public static const LOGOUT:String = "smugmug_logout";
		
		public static const SUBCATEGORIES_GET:String = "subcategories_get";
		public static const SUBCATEGORIES_GETALL:String = "subcategories_getAll";
		public static const SUBCATEGORIES_CREATE:String = "subcategories_create";
		public static const SUBCATEGORIES_DELETE:String = "subcategories_delete";
		public static const SUBCATEGORIES_RENAME:String = "subcategories_rename";

		public static const USERS_GETTREE:String = "users_getTree";
		public static const USERS_GETTRANSFERSTATS:String = "users_getTransferStats";

		// instance variables
		public var success:Boolean;
		public var data:Object;
		
		public function SmugMugResultEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}