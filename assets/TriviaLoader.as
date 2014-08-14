package 
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class TriviaLoader
	{
		private var xml:String;
		private var jsonFileLocation:String =  = "/config/gameassets.json";
		
		public function TriviaLoader()
		{
			
		}
		
		public function load():void
		{
			
		}
		
		private function loadJsonFile():void
		{
			var loader:URLLoader(new URLRequest(jsonFileLocation));
		}
	}
}