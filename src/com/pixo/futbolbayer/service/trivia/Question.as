package com.pixo.futbolbayer.service.trivia
{

	public class Question
	{
		public var wording:String;
		private var answersArray:Array = new Array();
		private var answerCursor:int = 0;
		
		public function Question(questionObject:Object):void
		{
			wording = questionObject["wording"];
			for each(var answerObject:Object in questionObject["answers"])
				answersArray.push(new Answer(answerObject));
			answersArray.sort(randomSort);
		}
		
		public function getAnswer():Answer
		{
			answerCursor++;
			return answersArray[answerCursor-1];
		}
		
		private function randomSort(a:*, b:*):Number
		{
			if (Math.random() < 0.5) return -1;
			else return 1;
		}
	}
}