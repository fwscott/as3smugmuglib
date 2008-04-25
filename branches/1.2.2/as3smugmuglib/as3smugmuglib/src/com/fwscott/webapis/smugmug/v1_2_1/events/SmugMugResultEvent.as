package com.fwscott.webapis.smugmug.v1_2_1.events
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
		public static const ALBUMS_APPLYWATERMARK:String = "albums_applyWatermark";	
		public static const ALBUMS_REMOVEWATERMARK:String = "albums_removeWatermark";
		
		public static const ALBUMTEMPLATES_GET:String = "albumtemplates_get";
		public static const ALBUMTEMPLATES_CREATE:String = "albumtemplates_create";
		public static const ALBUMTEMPLATES_CHANGESETTINGS:String = "albumtemplates_changeSettings";
		
		public static const CATEGORIES_GET:String = "categories_get";				
		public static const CATEGORIES_CREATE:String = "categories_create";
		public static const CATEGORIES_DELETE:String = "categories_delete";								
		public static const CATEGORIES_RENAME:String = "categories_rename";										
	
		public static const FAMILY_ADD:String = "family_add";
		public static const FAMILY_GET:String = "family_get";		
		public static const FAMILY_REMOVE:String = "family_remove";		
		public static const FAMILY_REMOVEALL:String = "family_removeAll";		
		
		public static const FRIENDS_ADD:String = "friends_add";
		public static const FRIENDS_GET:String = "friends_get";
		public static const FRIENDS_REMOVE:String = "friends_remove";
		public static const FRIENDS_REMOVEALL:String = "friends_removeAll";
		
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
		public static const IMAGES_APPLYWATERMARK:String = "images_applyWatermark";
		public static const IMAGES_CROP:String = "images_crop";
		public static const IMAGES_ROTATE:String = "images_rotate";
		public static const IMAGES_REMOVEWATERMARK:String = "images_removeWatermark";
		public static const IMAGES_ZOOMTHUMBNAIL:String = "images_zoomThumbnail";
		

		public static const LOGIN_WITHPASSWORD:String = "login_withPassword";
		public static const LOGIN_WITHHASH:String = "login_withHash";		
		public static const LOGIN_ANONYMOUSLY:String = "login_anonymously";		
	
		public static const LOGOUT:String = "smugmug_logout";
		
		public static const PRODUCTS_GET:String = "products_get";
		
		public static const PROPRICING_GETPORTFOLIO:String = "propricing_getPortfolio";
		public static const PROPRICING_GETALBUM:String = "propricing_getAlbum";
		public static const PROPRICING_GETIMAGE:String = "propricing_getImage";
		
		public static const SHAREGROUPS_CREATE:String = "sharegroups_create";
		public static const SHAREGROUPS_DELETE:String = "sharegroups_delete";
		public static const SHAREGROUPS_GET:String = "sharegroups_get";
		public static const SHAREGROUPS_GETINFO:String = "sharegroups_getInfo";
		public static const SHAREGROUPS_REMOVEALBUM:String = "sharegroups_removeAlbum";
		public static const SHAREGROUPS_ADDALBUM:String = "sharegroups_addAlbum";
		
		public static const SUBCATEGORIES_GET:String = "subcategories_get";
		public static const SUBCATEGORIES_GETALL:String = "subcategories_getAll";
		public static const SUBCATEGORIES_CREATE:String = "subcategories_create";
		public static const SUBCATEGORIES_DELETE:String = "subcategories_delete";
		public static const SUBCATEGORIES_RENAME:String = "subcategories_rename";

		public static const THEMES_GET:String = "themes_get";
		
		public static const USERS_GETTREE:String = "users_getTree";
		public static const USERS_GETTRANSFERSTATS:String = "users_getTransferStats";
		public static const USERS_GETDISPLAYNAME:String = "users_getDisplayName";

		public static const WATERMARKS_CHANGESETTINGS:String = "watermarks_changeSettings";
		public static const WATERMARKS_CREATE:String = "watermarks_create";
		public static const WATERMARKS_DELETE:String = "watermarks_delete";
		public static const WATERMARKS_GET:String = "watermarks_get";
		public static const WATERMARKS_GETINFO:String = "watermarks_getInfo";
		
		// instance variables
		public var success:Boolean;
		public var data:Object;
		
		public function SmugMugResultEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}