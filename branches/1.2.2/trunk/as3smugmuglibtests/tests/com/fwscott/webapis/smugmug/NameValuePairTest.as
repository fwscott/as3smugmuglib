package com.fwscott.webapis.smugmug
{
	import flexunit.framework.TestCase;
	import flexunit.framework.TestSuite;
	import flexunit.framework.Test;
	
	public class NameValuePairTest extends TestCase
	{
		public function NameValuePairTest(methodName:String=null)
		{
			super(methodName);
		}
	
		public static function suite():TestSuite {
			var ts:TestSuite = new TestSuite();
			
			ts.addTest( Test( new NameValuePairTest("testName") ) );
			ts.addTest( Test( new NameValuePairTest("testValue") ) );
				
			return ts;
		}
		
		public function testName():void {
			// Test construction/getter
			var pair:NameValuePair = new NameValuePair( "test" );
			assertTrue( "name is test", pair.name == "test" );
			
			// Test setter/getter
			pair.name = "test2";
			assertTrue( "name is test2", pair.name == "test2" );
		}
		
		public function testValue():void {
			// Test construction/getter
			var pair:NameValuePair = new NameValuePair( "test", "testValue" );
			assertTrue( "value is testValue", pair.value == "testValue" );
			
			// Test setter/getter
			pair.value = "testValue2";
			assertTrue( "value is testValue2", pair.value == "testValue2" );
		}		
	}
}