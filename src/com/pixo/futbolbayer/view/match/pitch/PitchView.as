package com.pixo.futbolbayer.view.match.pitch 
{
	import animations.FreeKickAnimations;
	import animations.PenaltyKickAnimations;
	
	import com.pixo.futbolbayer.view.events.DiceEvent;
	import com.pixo.futbolbayer.view.events.GridEvent;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.match.grid.HexagonalGrid;
	import com.pixo.futbolbayer.view.match.pitch.events.PitchEvent;
	import com.pixo.futbolbayer.view.tweens.MoveToPointTween;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	import skins.GameSkin;
	
	public class PitchView extends Sprite
	{
		private var currentPoint:Point;
		public var movements:int;
		private var direction:int;
		
		public var dice:Dice;
		private var grid:HexagonalGrid;
		private var ball:Sprite;
		private var stadium:Sprite;
		
		public var penaltyKickHolder:KickHolder;
		public var freeKickHolder:KickHolder;
		
		public var banner:Sprite;
		
		public function get movementsLeft():int
		{
			return movements;
		}
		
		public function PitchView()
		{
			addSkin();
			addListeners();
		}
		
		private function addSkin():void
		{
			var skin:Sprite = new GameSkin.PitchSkin() as Sprite;
			addChild(skin);
			stadium = skin.getChildByName("stadium_container") as Sprite;
			grid = new HexagonalGrid(skin.getChildByName("grid") as Sprite);
			dice = new Dice(skin.getChildByName("dice") as MovieClip);
			ball = skin.getChildByName("ball") as Sprite;
			banner = skin.getChildByName("banner") as Sprite;
			initializeKickHolders(skin);
		}
		
		private function initializeKickHolders(skin:Sprite):void
		{
			penaltyKickHolder = new KickHolder(skin.getChildByName("penalty_kick") as Sprite, new PenaltyKickAnimations());
			freeKickHolder = new KickHolder(skin.getChildByName("free_kick") as Sprite, new FreeKickAnimations());
		}
		
		private function addListeners():void
		{
			grid.addEventListener(GridEvent.SELECTED_POINT, handleSelectedPoint);
		}
		
		private function handleSelectedPoint(e:GridEvent):void 
		{
			var tween:MoveToPointTween = new MoveToPointTween();
			tween.tween(ball, e.point);
			checkGoal();
		}
		
		public function reset():void
		{
			movements = 0;
			grid.restart();
		}
		
		public function roll():void
		{
			dice.roll();
		}
		
		public function move(movements:int, direction:int=0):void
		{
			this.movements = movements;
			this.direction = direction;
			checkMovements();
		}
		
		private function checkGoal():void
		{
			var scoredTeam:int = grid.checkGoal();
			if (scoredTeam > 0)
				dispatchEvent(new PitchEvent(PitchEvent.GOAL, scoredTeam));
			else
				checkMovements();
		}
		
		public function checkSpecialTile():int
		{
			return grid.checkSpecialTile();
		}
		
		private function checkMovements():void 
		{
			dispatchEvent(new PitchEvent(PitchEvent.MOVEMENT_COMPLETE));
			if (movements > 0)
			{
				movements --;
				grid.startMovement(direction);
			}
		}
		
		public function setStadiumAsset(asset:DisplayObject):void 
		{
			stadium.addChild(asset);
		}
		
		public function setBannerAsset(asset:DisplayObject):void 
		{
			banner.addChild(asset);
		}
	}
}