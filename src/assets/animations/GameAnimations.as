package assets.animations {
	public class GameAnimations {
		
		[Embed(source="FutbolBayer/gol.swf", mimeType="application/octet-stream")]
		public static var Goal:Class;
		
		[Embed(source="FutbolBayer/fuera_de_lugar.swf", mimeType="application/octet-stream")]
		public static var OffSide:Class;
		
		[Embed(source="FutbolBayer/falta_ofensiva.swf", mimeType="application/octet-stream")]
		public static var Fault:Class;
		
		[Embed(source="FutbolBayer/mano.swf", mimeType="application/octet-stream")]
		public static var HandBall:Class;
		
		[Embed(source="FutbolBayer/tiro_libre.swf", mimeType="application/octet-stream")]
		public static var FreeKick:Class;
	}
}
