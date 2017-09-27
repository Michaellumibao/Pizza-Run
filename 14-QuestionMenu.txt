import fl.events.ComponentEvent;

//Stop on this frame
stop();


//Retry button
//btnRetry.addEventListener(ComponentEvent.BUTTON_DOWN, gameRetry);
playerHealth:Number;
coinCollected:Number;
//function to go back to the first frame
//function gameRetry(ev:ComponentEvent)
//{
//gotoAndStop(13);
//backgroundTimer.addEventListener(TimerEvent.TIMER,onTick2);
//}


//import required code;
import fl.motion.Color;
import flash.events.MouseEvent;
import flash.text.TextFormat;

//create event listeners
btnSelect1.addEventListener(MouseEvent.CLICK, checkAnswer1);
btnSelect2.addEventListener(MouseEvent.CLICK, checkAnswer2);
btnSelect3.addEventListener(MouseEvent.CLICK, checkAnswer3);
btnSelect4.addEventListener(MouseEvent.CLICK, checkAnswer4);
btnGetQuestion.addEventListener(MouseEvent.CLICK, pickL1Question);


var level1Questions:Level1Questions = new Level1Questions();


// return a random number between 1 and size (inclusive)
function rnd(size:int)
{
	if (size > 0)
	{
		return 1 + (Math.floor(Math.random()*size));
	}
	else
	{
		trace("WARNING: no elements to choose from!");
		return 0;
	}
}
// create variable for random location of the correct answer
var correctChoice:int;

//get questions and answers and place in random locations
function pickL1Question(event:MouseEvent)
{

	//Disable button
	//btnGetQuestion.enabled = false
	//Enable answer buttons
	btnSelect1.enabled = true;
	btnSelect2.enabled = true;
	btnSelect3.enabled = true;
	btnSelect4.enabled = true;
	btnGetQuestion.enabled = false;
	// pick a random question from text file
	var number:int = rnd(level1Questions.getNumberOfQuestions());
	var question:Question = level1Questions.getQuestion(number);
	trace("Question " + number + ": " + question.getQuestion());

	// display the question
	lblQuestion.text = question.getQuestion();

	// pick which spot will get the right answer
	correctChoice = rnd(4);
	trace("the correct choice is " + correctChoice);

	//create a variable to store wronf answer
	var wrongAnswer:int;

	// now fill in the other spots with wrong answers.
	// this method will pull a random wrong answer (if there are more than 3, then you will get
	// a different set of wrong answers each time the question appears),
	// and remove it from the pool so the wrong answer doesn't appear twice, for each wrong spot
	if (correctChoice == 1)
	{
		btnSelect1.label = question.getAnswer();
		//txtChoice1.textColor = 0x00FF00;
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect2.label = question.getWrongAnswer(wrongAnswer);
		question.removeWrongAnswer(wrongAnswer);
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect3.label = question.getWrongAnswer(wrongAnswer);
		question.removeWrongAnswer(wrongAnswer);
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect4.label = question.getWrongAnswer(wrongAnswer);
	}
	else if (correctChoice == 2)
	{
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect1.label = question.getWrongAnswer(wrongAnswer);
		question.removeWrongAnswer(wrongAnswer);
		btnSelect2.label = question.getAnswer();
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect3.label = question.getWrongAnswer(wrongAnswer);
		question.removeWrongAnswer(wrongAnswer);
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect4.label = question.getWrongAnswer(wrongAnswer);
	}
	else if (correctChoice == 3)
	{
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect1.label = question.getWrongAnswer(wrongAnswer);
		question.removeWrongAnswer(wrongAnswer);
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect2.label = question.getWrongAnswer(wrongAnswer);
		question.removeWrongAnswer(wrongAnswer);
		btnSelect3.label = question.getAnswer();
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect4.label = question.getWrongAnswer(wrongAnswer);
	}
	else
	{
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect1.label = question.getWrongAnswer(wrongAnswer);
		question.removeWrongAnswer(wrongAnswer);
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect2.label = question.getWrongAnswer(wrongAnswer);
		question.removeWrongAnswer(wrongAnswer);
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect3.label = question.getWrongAnswer(wrongAnswer);
		wrongAnswer = rnd(question.getNumberOfWrongAnswers());
		btnSelect4.label = question.getAnswer();
	}

	// choose a bigger font...
	var myFormat:TextFormat = new TextFormat();
	myFormat.size = 15;
	lblQuestion.setStyle("textFormat", myFormat);
	btnSelect1.setStyle("textFormat", myFormat);
	btnSelect2.setStyle("textFormat", myFormat);
	btnSelect3.setStyle("textFormat", myFormat);
	btnSelect4.setStyle("textFormat", myFormat);
}

//check if answer 1 is correct;
function checkAnswer1(event:MouseEvent)
{
	if (correctChoice == 1)
	{
		if (Level1selected == true)
		{
			gotoAndStop(13);
		}
		else if (Level2selected == true)
		{
			gotoAndStop(16);
		}
		else if (Level3selected == true)
		{
			gotoAndStop(17);
		}
	}
	else
	{
		playerHealth = playerHealth - 1;
		if (playerHealth < -3)
		{
			gotoAndStop(9);
		}
		else
		{
			if (Level1selected == true)
			{
				gotoAndStop(13);
			}
			else if (Level2selected == true)
			{
				gotoAndStop(16);
			}
			else if (Level3selected == true)
			{
				gotoAndStop(17);
			}
		}
	}
}
//check if answer 2 is correct
function checkAnswer2(event:MouseEvent)
{
	if (correctChoice == 2)
	{
		if (Level1selected == true)
		{
			gotoAndStop(13);
		}
		else if (Level2selected == true)
		{
			gotoAndStop(16);
		}
		else if (Level3selected == true)
		{
			gotoAndStop(17);
		}
	}
	else
	{
		playerHealth = playerHealth - 1;
		if (playerHealth < -3)
		{
			gotoAndStop(9);
		}
		else
		{
			if (Level1selected == true)
			{
				gotoAndStop(13);
			}
			else if (Level2selected == true)
			{
				gotoAndStop(16);
			}
			else if (Level3selected == true)
			{
				gotoAndStop(17);
			}
		}
	}
}
//check if answer 3 is correct
function checkAnswer3(event:MouseEvent)
{
	if (correctChoice == 3)
	{
		if (Level1selected = true)
		{
			gotoAndStop(13);
		}
		else if (Level2selected == true)
		{
			gotoAndStop(16);
		}
		else if (Level3selected == true)
		{
			gotoAndStop(17);
		}
	}
	else
	{
		playerHealth = playerHealth - 1;
		if (playerHealth < -3)
		{
			gotoAndStop(9);
		}
		else
		{
			if (Level1selected == true)
			{
				gotoAndStop(13);
			}
			else if (Level2selected == true)
			{
				gotoAndStop(16);
			}
			else if (Level3selected == true)
			{
				gotoAndStop(17);
			}
		}
	}
}
//check if answer 4 is correct
function checkAnswer4(event:MouseEvent)
{
	if (correctChoice == 4)
	{
		if (Level1selected == true)
		{
			gotoAndStop(13);
		}
		else if (Level2selected == true)
		{
			gotoAndStop(16);
		}
		else if (Level3selected == true)
		{
			gotoAndStop(17);
		}
	}
	else
	{
		playerHealth = playerHealth - 1;
		if (playerHealth < -3)
		{
			gotoAndStop(9);
		}
		else
		{
			if (Level1selected == true)
			{
				gotoAndStop(13);
			}
			else if (Level2selected == true)
			{
				gotoAndStop(16);
			}
			else if (Level3selected == true)
			{
				gotoAndStop(17);
			}
		}
	}
}

trace(Level1selected);