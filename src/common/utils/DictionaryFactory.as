package common.utils
{
	import flash.utils.Dictionary;

	public class DictionaryFactory
	{
		public function create(objectsArray:Array):Dictionary
		{
			var dict:Dictionary = new Dictionary();
			
			for each (var object:Object in objectsArray) {
				dict[object["key"]] = object["value"];
			}
			
			return dict;
		}
	}
}