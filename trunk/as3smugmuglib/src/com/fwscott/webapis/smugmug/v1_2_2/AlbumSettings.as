package com.fwscott.webapis.smugmug.v1_2_2
{
	
	public class AlbumSettings
	{
		public var albumTemplateID:int=0;
		public var subCategoryID:int=0;
		public var communityID:int=0;
		public var description:String=null
		public var keywords:String=null;
		public var password:String=null;
		public var passwordHint:String=null;
		public var position:int=1;
		public var sortMethod:AlbumSortMethod=AlbumSortMethod.POSITION;
		public var sortDirection:AlbumSortDirection = AlbumSortDirection.ASC;
		public var isPublic:Boolean=true;
		public var fileNames:Boolean=false;
		public var comments:Boolean=true;
		public var external:Boolean=true;
		public var exif:Boolean=true;
		public var share:Boolean=true;
		public var printable:Boolean=true;
		public var originals:Boolean=true;
		public var familyEdit:Boolean=false;
		public var friendEdit:Boolean=false;
		public var header:Boolean=false;
		public var templateID:AlbumTemplateView=AlbumTemplateView.VIEWERCHOICE;
		public var themeID:int=0;
		public var larges:Boolean=true;
		public var clean:Boolean=false;
		public var isProtected:Boolean=false;
		public var watermarking:Boolean=false;
		public var proofDays:Boolean=false;
		public var backPrinting:String=null;
		public var smugSearchable:Boolean=true;
		public var worldSearchable:Boolean=true;
		public var shareGroup:Array;		
	}
}