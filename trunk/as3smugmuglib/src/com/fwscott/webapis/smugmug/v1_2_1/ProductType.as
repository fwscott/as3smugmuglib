package com.fwscott.webapis.smugmug.v1_2_1
{
	import com.fwscott.util.Enum;

	public class ProductType extends Enum
	{
		public static const COMMONPRINT:ProductType = new ProductType("CommonPrint");
		public static const DIGITALPRINT:ProductType = new ProductType("DigitalPrint");
		public static const SPECIALITYPRINT:ProductType = new ProductType("SpecialityPrint");
		public static const MERCHANDISE:ProductType = new ProductType("Merchandise");
		public static const DOWNLOAD:ProductType = new ProductType("Download");
		
		public function ProductType(value:Object)
		{
			super(value);
		}
		
	}
}