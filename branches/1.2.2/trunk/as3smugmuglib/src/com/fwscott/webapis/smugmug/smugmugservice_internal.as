package com.fwscott.webapis.smugmug {
	
	/**
	 * Because of the directory structure (having a methodgroups package
	 * where the classes in there are really "Friends" of the FlickrService
	 * class), we can't use the "internal" modifier to hide methods from
	 * the public API.  Thus, in order to provide the helper classes in the
	 * methodGroup package access to this class, we create a special
	 * namespace to use as a method modifier.
	 */
	public namespace smugmugservice_internal = "http://www.franciswscott.com/webapis/smugmug/internal";
	
}