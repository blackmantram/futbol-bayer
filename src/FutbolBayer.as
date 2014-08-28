package
{
	import com.pixo.futbolbayer.GameContext;
	import com.pixo.futbolbayer.GameView;
	
	import flash.display.Sprite;
	
	[SWF(width="980", height="640", backgroundColor="#000000", frameRate="30")]
	public class FutbolBayer extends Sprite
	{
		private var _context:GameContext;
		private var _contextView:Sprite;
		private var _gameView:GameView = new GameView();
		
		public function FutbolBayer()
		{
			_contextView = new Sprite();
			addChild(_contextView);
			_context = new GameContext(_contextView);
			_contextView.addChild(_gameView);
			_gameView.showStart();
		}
	}
}