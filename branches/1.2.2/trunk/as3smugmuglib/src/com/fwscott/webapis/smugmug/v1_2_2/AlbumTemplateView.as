package com.fwscott.webapis.smugmug.v1_2_2
{
	import com.fwscott.util.Enum;
	
	public class AlbumTemplateView extends Enum
	{
		public static const VIEWERCHOICE:AlbumTemplateView = new AlbumTemplateView(0);
		public static const SMUGMUG:AlbumTemplateView = new AlbumTemplateView(3);
		public static const SMUGMUG_SMALL:AlbumTemplateView = new AlbumTemplateView(10);
		public static const TRADITIONAL:AlbumTemplateView = new AlbumTemplateView(4);
		public static const ALLTHUMBS:AlbumTemplateView = new AlbumTemplateView(7);
		public static const SLIDESHOW:AlbumTemplateView = new AlbumTemplateView(8);
		public static const JOURNAL:AlbumTemplateView = new AlbumTemplateView(9);
		public static const FILMSTRIP:AlbumTemplateView = new AlbumTemplateView(11);
		
		public function AlbumTemplateView(val:Object) {
			super(val);
		}
	}
}