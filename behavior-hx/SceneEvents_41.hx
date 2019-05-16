package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_41 extends SceneScript
{
	public var _Target:Actor;
	public var _Match:Actor;
	public var _tint:Float;
	public var _Pressed:Bool;
	public var _SizeW:Float;
	public var _SizeH:Float;
	public var _FalseLeeway:Float;
	public var _FalseLeewayBool:Bool;
	public var _TargetAnim:String;
	public var _MatchAnim:String;
	public var _CardPicker:Float;
	public var _NoMatch:Actor;
	public var _LeftRightPicker:Float;
	public var _Matchyvalue:Float;
	public var _counter:Float;
	public var _Item:Array<Dynamic>;
	public var _PercentRight:Float;
	public var _DateHolder:String;
	public var _LeftyCount:Float;
	public var _TrialCounter:Float;
	public var _RightyCount:Float;
	public var _TargetChooser:Float;
	public var _ClubPicker:Float;
	public var _MoonPicker:Float;
	public var _2Picker:Float;
	public var _NoMatchRed:Bool;
	public var _NoMatchGreen:Bool;
	public var _LeftSideCounter:Float;
	public var _RightSideCounter:Float;
	public var _COLRedPicker:Float;
	public var _ColGreenPicker:Float;
	public var _ColOrangePicker:Float;
	public var _ColPurplePicker:Float;
	public var _COL0ColorPicker:Float;
	public var _ShapeChooser:Float;
	public var _ASCT:Float;
	public var _ASCMT:Float;
	public var _ASCMF:Float;
	public var _ACCT:Float;
	public var _ACCMT:Float;
	public var _ACCMF:Float;
	public var _RuleChooser:Float;
	public var _RuleSwitchCount:Float;
	public var _ConsecutiveRightCounter:Float;
	public var _NumCorrect:Float;
	public var _PE:Float;
	public var _TotalWrong:Float;
	public var _TtCFC:Float;
	public var _CLR:Float;
	public var _PCLR:Float;
	public var _FtMS:Float;
	public var _NPE:Float;
	public var _ChooseColorTarget:String;
	public var _ChooseColorMatch:String;
	public var _ChooseColorNoMatch:String;
	public var _ChooseShapeTarget:String;
	public var _ChooseShapeMatch:String;
	public var _ChooseShapeNoMatch:String;
	public var _Matchable:Bool;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ChooseTargetColorNew():Void
	{
		/* ACC_T stands for "something" Color Chooser - Target */
		if((_RuleChooser == 0))
		{
			_ACCT = asNumber(randomInt(Math.floor(1), Math.floor(2)));
			propertyChanged("_ACCT", _ACCT);
			if((_ACCT == 1))
			{
				_ChooseColorTarget = "Pink";
				propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			}
			else if((_ACCT == 2))
			{
				_ChooseColorTarget = "Purple";
				propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			}
		}
		else
		{
			_ACCT = asNumber(randomInt(Math.floor(1), Math.floor(2)));
			propertyChanged("_ACCT", _ACCT);
			if((_ACCT == 1))
			{
				_ChooseColorTarget = "Pink";
				propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			}
			else if((_ACCT == 2))
			{
				_ChooseColorTarget = "Purple";
				propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			}
		}
		trace("" + "01-ChosenTargetColor");
		_customEvent_ChooseTargetShapeNew();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ChooseTargetShapeNew():Void
	{
		/* ASC_T = Shape Chooser - Target */
		if((_RuleChooser == 0))
		{
			_ASCT = asNumber(randomInt(Math.floor(1), Math.floor(2)));
			propertyChanged("_ASCT", _ASCT);
			if((_ASCT == 1))
			{
				_ChooseShapeTarget = "Heart";
				propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			}
			else if((_ASCT == 2))
			{
				_ChooseShapeTarget = "Diamond";
				propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			}
		}
		else
		{
			_ASCT = asNumber(randomInt(Math.floor(1), Math.floor(2)));
			propertyChanged("_ASCT", _ASCT);
			if((_ASCT == 1))
			{
				_ChooseShapeTarget = "Heart";
				propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			}
			else if((_ASCT == 2))
			{
				_ChooseShapeTarget = "Diamond";
				propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			}
		}
		trace("" + "02-ChosenTargetShape");
		trace("" + _Target.getAnimation());
		_customEvent_ChooseMatchTColorNew();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ChooseMatchTColorNew():Void
	{
		/* Fixed for level 16 shape matching. */
		if((_RuleChooser == 0))
		{
			_ACCMT = asNumber(randomInt(Math.floor(1), Math.floor(2)));
			propertyChanged("_ACCMT", _ACCMT);
			if((_ACCT == _ACCMT))
			{
				_customEvent_ChooseMatchTColorNew();
			}
			if((_ACCMT == 1))
			{
				_ChooseColorMatch = "Pink";
				propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
			}
			else if((_ACCMT == 2))
			{
				_ChooseColorMatch = "Purple";
				propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
			}
		}
		else
		{
			if((_ACCT == 1))
			{
				_ACCMT = asNumber(1);
				propertyChanged("_ACCMT", _ACCMT);
				_ChooseColorMatch = "Pink";
				propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
			}
			else if((_ACCT == 2))
			{
				_ACCMT = asNumber(2);
				propertyChanged("_ACCMT", _ACCMT);
				_ChooseColorMatch = "Purple";
				propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
			}
		}
		trace("" + "04-ChosenMatchTShape");
		trace("" + (("" + "ACC_MT   =   ") + ("" + _ACCMT)));
		_customEvent_ChooseMatchTShapeNew();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ChooseMatchTShapeNew():Void
	{
		if((_RuleChooser == 0))
		{
			if((_ASCT == 1))
			{
				_ASCMT = asNumber(1);
				propertyChanged("_ASCMT", _ASCMT);
				_ChooseShapeMatch = "Heart";
				propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
			}
			else if((_ASCT == 2))
			{
				_ASCMT = asNumber(2);
				propertyChanged("_ASCMT", _ASCMT);
				_ChooseShapeMatch = "Diamond";
				propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
			}
		}
		else
		{
			_ASCMT = asNumber(randomInt(Math.floor(1), Math.floor(2)));
			propertyChanged("_ASCMT", _ASCMT);
			if((_ASCT == _ASCMT))
			{
				_customEvent_ChooseMatchTShapeNew();
			}
			if((_ASCMT == 1))
			{
				_ChooseShapeMatch = "Heart";
				propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
			}
			else if((_ASCMT == 2))
			{
				_ChooseShapeMatch = "Diamond";
				propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
			}
		}
		trace("" + "03-ChosenTMatchTColor");
		_customEvent_ChooseMatchFColorNew();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ChooseMatchFColorNew():Void
	{
		if((_RuleChooser == 0))
		{
			_ACCMF = asNumber(_ACCT);
			propertyChanged("_ACCMF", _ACCMF);
			if((_ACCMF == 1))
			{
				_ChooseColorNoMatch = "Pink";
				propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
			}
			else if((_ACCMF == 2))
			{
				_ChooseColorNoMatch = "Purple";
				propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
			}
		}
		else
		{
			_ACCMF = asNumber(randomInt(Math.floor(1), Math.floor(2)));
			propertyChanged("_ACCMF", _ACCMF);
			if((_ACCT == _ACCMF))
			{
				_customEvent_ChooseMatchFColorNew();
				return;
			}
			if((_ACCMF == 1))
			{
				_ChooseColorNoMatch = "Pink";
				propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
			}
			else if((_ACCMF == 2))
			{
				_ChooseColorNoMatch = "Purple";
				propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
			}
		}
		trace("" + "05-ChosenMatchFColor");
		_customEvent_ChooseMatchFShapeNew();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ChooseMatchFShapeNew():Void
	{
		if((_RuleChooser == 0))
		{
			_ASCMF = asNumber(randomInt(Math.floor(1), Math.floor(2)));
			propertyChanged("_ASCMF", _ASCMF);
			if((_ASCT == _ASCMF))
			{
				_customEvent_ChooseMatchFShapeNew();
				return;
			}
			if((_ASCMF == 1))
			{
				_ChooseShapeNoMatch = "Heart";
				propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
			}
			else if((_ASCMF == 2))
			{
				_ChooseShapeNoMatch = "Diamond";
				propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
			}
		}
		else
		{
			if((_ASCT == 1))
			{
				_ASCMF = asNumber(1);
				propertyChanged("_ASCMF", _ASCMF);
				_ChooseShapeNoMatch = "Heart";
				propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
			}
			else if((_ASCT == 2))
			{
				_ASCMF = asNumber(2);
				propertyChanged("_ASCMF", _ASCMF);
				_ChooseShapeNoMatch = "Diamond";
				propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
			}
		}
		trace("" + "06-ChosenMatchFShape");
		_customEvent_SetThemAll();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_SetThemAll():Void
	{
		_Target.setAnimation("" + ("" + (("" + (("" + _ChooseColorTarget) + ("" + _ChooseShapeTarget))) + ("" + "01"))));
		_Match.setAnimation("" + ("" + (("" + (("" + _ChooseColorMatch) + ("" + _ChooseShapeMatch))) + ("" + "01"))));
		_NoMatch.setAnimation("" + ("" + (("" + (("" + _ChooseColorNoMatch) + ("" + _ChooseShapeNoMatch))) + ("" + "01"))));
		_customEvent_ShowTargetEvent();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ShowTargetEvent():Void
	{
		trace("" + "fade in now.");
		/* "This shtuff brings up the target card (pops up)" */ _Target.enableActorDrawing();
		_Target.growTo(125/100, 125/100, .1, Linear.easeNone);
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Target.growTo(100/100, 100/100, .05, Linear.easeNone);
		}, null);
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_SideSwitcher():Void
	{
		if((_LeftRightPicker == 1))
		{
			_LeftSideCounter = asNumber((_LeftSideCounter + 1));
			propertyChanged("_LeftSideCounter", _LeftSideCounter);
			_RightSideCounter = asNumber(0);
			propertyChanged("_RightSideCounter", _RightSideCounter);
		}
		else if((_LeftRightPicker == 2))
		{
			_RightSideCounter = asNumber((_RightSideCounter + 1));
			propertyChanged("_RightSideCounter", _RightSideCounter);
			_LeftSideCounter = asNumber(0);
			propertyChanged("_LeftSideCounter", _LeftSideCounter);
		}
		if((_LeftSideCounter > 2))
		{
			_LeftRightPicker = asNumber(2);
			propertyChanged("_LeftRightPicker", _LeftRightPicker);
			_LeftSideCounter = asNumber(0);
			propertyChanged("_LeftSideCounter", _LeftSideCounter);
			_RightSideCounter = asNumber((_RightSideCounter + 1));
			propertyChanged("_RightSideCounter", _RightSideCounter);
		}
		else if((_RightSideCounter > 2))
		{
			_LeftRightPicker = asNumber(1);
			propertyChanged("_LeftRightPicker", _LeftRightPicker);
			_RightSideCounter = asNumber(0);
			propertyChanged("_RightSideCounter", _RightSideCounter);
			_LeftSideCounter = asNumber((_LeftSideCounter + 1));
			propertyChanged("_LeftSideCounter", _LeftSideCounter);
		}
		_Matchable = true;
		propertyChanged("_Matchable", _Matchable);
	}
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Target", "_Target");
		nameMap.set("Match", "_Match");
		nameMap.set("tint", "_tint");
		_tint = 0.0;
		nameMap.set("Pressed", "_Pressed");
		_Pressed = false;
		nameMap.set("SizeW", "_SizeW");
		_SizeW = 0.0;
		nameMap.set("SizeH", "_SizeH");
		_SizeH = 0.0;
		nameMap.set("FalseLeeway", "_FalseLeeway");
		_FalseLeeway = 0.0;
		nameMap.set("FalseLeewayBool", "_FalseLeewayBool");
		_FalseLeewayBool = false;
		nameMap.set("TargetAnim", "_TargetAnim");
		nameMap.set("MatchAnim", "_MatchAnim");
		nameMap.set("CardPicker", "_CardPicker");
		_CardPicker = 0.0;
		nameMap.set("NoMatch", "_NoMatch");
		nameMap.set("LeftRightPicker", "_LeftRightPicker");
		_LeftRightPicker = 0.0;
		nameMap.set("Matchyvalue", "_Matchyvalue");
		_Matchyvalue = 0.0;
		nameMap.set("counter", "_counter");
		_counter = 0.0;
		nameMap.set("Item", "_Item");
		nameMap.set("PercentRight", "_PercentRight");
		_PercentRight = 0.0;
		nameMap.set("DateHolder", "_DateHolder");
		_DateHolder = "";
		nameMap.set("LeftyCount", "_LeftyCount");
		_LeftyCount = 0.0;
		nameMap.set("TrialCounter", "_TrialCounter");
		_TrialCounter = 0.0;
		nameMap.set("RightyCount", "_RightyCount");
		_RightyCount = 0.0;
		nameMap.set("TargetChooser", "_TargetChooser");
		_TargetChooser = 0.0;
		nameMap.set("ClubPicker", "_ClubPicker");
		_ClubPicker = 0.0;
		nameMap.set("MoonPicker", "_MoonPicker");
		_MoonPicker = 0.0;
		nameMap.set("2Picker", "_2Picker");
		_2Picker = 0.0;
		nameMap.set("NoMatchRed", "_NoMatchRed");
		_NoMatchRed = false;
		nameMap.set("NoMatchGreen", "_NoMatchGreen");
		_NoMatchGreen = false;
		nameMap.set("LeftSideCounter", "_LeftSideCounter");
		_LeftSideCounter = 0.0;
		nameMap.set("RightSideCounter", "_RightSideCounter");
		_RightSideCounter = 0.0;
		nameMap.set("COLRedPicker", "_COLRedPicker");
		_COLRedPicker = 0.0;
		nameMap.set("ColGreenPicker", "_ColGreenPicker");
		_ColGreenPicker = 0.0;
		nameMap.set("ColOrangePicker", "_ColOrangePicker");
		_ColOrangePicker = 0.0;
		nameMap.set("ColPurplePicker", "_ColPurplePicker");
		_ColPurplePicker = 0.0;
		nameMap.set("COL0ColorPicker", "_COL0ColorPicker");
		_COL0ColorPicker = 0.0;
		nameMap.set("ShapeChooser", "_ShapeChooser");
		_ShapeChooser = 0.0;
		nameMap.set("ASC_T", "_ASCT");
		_ASCT = 0.0;
		nameMap.set("ASC_MT", "_ASCMT");
		_ASCMT = 0.0;
		nameMap.set("ASC_MF", "_ASCMF");
		_ASCMF = 0.0;
		nameMap.set("ACC_T", "_ACCT");
		_ACCT = 0.0;
		nameMap.set("ACC_MT", "_ACCMT");
		_ACCMT = 0.0;
		nameMap.set("ACC_MF", "_ACCMF");
		_ACCMF = 0.0;
		nameMap.set("RuleChooser", "_RuleChooser");
		_RuleChooser = 0.0;
		nameMap.set("RuleSwitchCount", "_RuleSwitchCount");
		_RuleSwitchCount = 0.0;
		nameMap.set("ConsecutiveRightCounter", "_ConsecutiveRightCounter");
		_ConsecutiveRightCounter = 0.0;
		nameMap.set("NumCorrect", "_NumCorrect");
		_NumCorrect = 0.0;
		nameMap.set("PE", "_PE");
		_PE = 0.0;
		nameMap.set("TotalWrong", "_TotalWrong");
		_TotalWrong = 0.0;
		nameMap.set("TtCFC", "_TtCFC");
		_TtCFC = 0.0;
		nameMap.set("CLR", "_CLR");
		_CLR = 0.0;
		nameMap.set("PCLR", "_PCLR");
		_PCLR = 0.0;
		nameMap.set("FtMS", "_FtMS");
		_FtMS = 0.0;
		nameMap.set("NPE", "_NPE");
		_NPE = 0.0;
		nameMap.set("ChooseColorTarget", "_ChooseColorTarget");
		_ChooseColorTarget = "";
		nameMap.set("ChooseColorMatch", "_ChooseColorMatch");
		_ChooseColorMatch = "";
		nameMap.set("ChooseColorNoMatch", "_ChooseColorNoMatch");
		_ChooseColorNoMatch = "";
		nameMap.set("ChooseShapeTarget", "_ChooseShapeTarget");
		_ChooseShapeTarget = "";
		nameMap.set("ChooseShapeMatch", "_ChooseShapeMatch");
		_ChooseShapeMatch = "";
		nameMap.set("ChooseShapeNoMatch", "_ChooseShapeNoMatch");
		_ChooseShapeNoMatch = "";
		nameMap.set("Matchable", "_Matchable");
		_Matchable = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		for(index0 in 0...Std.int(1))
		{
			if((Date.now().getMonth() == 0))
			{
				Engine.engine.setGameAttribute("Month", "January");
			}
			else if((Date.now().getMonth() == 1))
			{
				Engine.engine.setGameAttribute("Month", "February");
			}
			else if((Date.now().getMonth() == 2))
			{
				Engine.engine.setGameAttribute("Month", "March");
			}
			else if((Date.now().getMonth() == 3))
			{
				Engine.engine.setGameAttribute("Month", "April");
			}
			else if((Date.now().getMonth() == 4))
			{
				Engine.engine.setGameAttribute("Month", "May");
			}
			else if((Date.now().getMonth() == 5))
			{
				Engine.engine.setGameAttribute("Month", "June");
			}
			else if((Date.now().getMonth() == 6))
			{
				Engine.engine.setGameAttribute("Month", "July");
			}
			else if((Date.now().getMonth() == 7))
			{
				Engine.engine.setGameAttribute("Month", "August");
			}
			else if((Date.now().getMonth() == 8))
			{
				Engine.engine.setGameAttribute("Month", "September");
			}
			else if((Date.now().getMonth() == 9))
			{
				Engine.engine.setGameAttribute("Month", "October");
			}
			else if((Date.now().getMonth() == 10))
			{
				Engine.engine.setGameAttribute("Month", "November");
			}
			else if((Date.now().getMonth() == 11))
			{
				Engine.engine.setGameAttribute("Month", "December");
			}
		}
		Engine.engine.setGameAttribute("L18TotalNum", (Engine.engine.getGameAttribute("L18TotalNum") + 1));
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Item = new Array<Dynamic>();
			propertyChanged("_Item", _Item);
			_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
			_Item[Std.int(1)] = Engine.engine.getGameAttribute("L18TotalNum");
			_Item[Std.int(2)] = (("" + (("" + Date.now().getHours()) + ("" + ":"))) + ("" + (("" + (("" + Date.now().getMinutes()) + ("" + ":"))) + ("" + Date.now().getSeconds()))));
			Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("L18TotalNum"))] = _Item;
		}, null);
		
		/* ======================== When Creating ========================= */
		/* LeftyCount will count how many times the match is on the left side of the screen. Once it gets to 5, the program will not let the random side become left again, in order to balance the sides. (same w/ Right) */
		_Matchable = false;
		propertyChanged("_Matchable", _Matchable);
		_RightyCount = asNumber(0);
		propertyChanged("_RightyCount", _RightyCount);
		_LeftyCount = asNumber(0);
		propertyChanged("_LeftyCount", _LeftyCount);
		/* TrialCounter counts the trial to make sure left/right placement is even */
		_TrialCounter = asNumber(0);
		propertyChanged("_TrialCounter", _TrialCounter);
		_NumCorrect = asNumber(0);
		propertyChanged("_NumCorrect", _NumCorrect);
		_PercentRight = asNumber(0);
		propertyChanged("_PercentRight", _PercentRight);
		_counter = asNumber(0);
		propertyChanged("_counter", _counter);
		_Item = new Array<Dynamic>();
		propertyChanged("_Item", _Item);
		Engine.engine.setGameAttribute("LevelTrial", 0);
		_DateHolder = Date.now().toString();
		propertyChanged("_DateHolder", _DateHolder);
		_ClubPicker = asNumber(0);
		propertyChanged("_ClubPicker", _ClubPicker);
		_MoonPicker = asNumber(0);
		propertyChanged("_MoonPicker", _MoonPicker);
		/* The following variables have to do with picking the proper color, and ensuring that no one color is picked more than three times. */
		_COL0ColorPicker = asNumber(0);
		propertyChanged("_COL0ColorPicker", _COL0ColorPicker);
		_ColGreenPicker = asNumber(0);
		propertyChanged("_ColGreenPicker", _ColGreenPicker);
		_ColOrangePicker = asNumber(0);
		propertyChanged("_ColOrangePicker", _ColOrangePicker);
		_ColPurplePicker = asNumber(0);
		propertyChanged("_ColPurplePicker", _ColPurplePicker);
		_COLRedPicker = asNumber(0);
		propertyChanged("_COLRedPicker", _COLRedPicker);
		_TargetChooser = asNumber(0);
		propertyChanged("_TargetChooser", _TargetChooser);
		/* Create the target */
		createRecycledActor(getActorType(247), Engine.engine.getGameAttribute("TargetX"), Engine.engine.getGameAttribute("TargetY"), Script.FRONT);
		_Target = getLastCreatedActor();
		propertyChanged("_Target", _Target);
		_Target.disableActorDrawing();
		/* create the match */
		createRecycledActor(getActorType(247), Engine.engine.getGameAttribute("MatchX"), Engine.engine.getGameAttribute("MatchY"), Script.FRONT);
		_Match = getLastCreatedActor();
		propertyChanged("_Match", _Match);
		_Match.disableActorDrawing();
		/* create the NONmatch */
		createRecycledActor(getActorType(247), Engine.engine.getGameAttribute("MatchX"), Engine.engine.getGameAttribute("MatchY"), Script.FRONT);
		_NoMatch = getLastCreatedActor();
		propertyChanged("_NoMatch", _NoMatch);
		_NoMatch.disableActorDrawing();
		trace("" + "created01 Done");
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("MatchPushable", false);
		_Matchyvalue = asNumber(30);
		propertyChanged("_Matchyvalue", _Matchyvalue);
		Engine.engine.setGameAttribute("FalseLeewayBoolGA", false);
		Engine.engine.setGameAttribute("FalseLeewayGA", 0);
		_RuleChooser = asNumber(randomInt(Math.floor(0), Math.floor(1)));
		propertyChanged("_RuleChooser", _RuleChooser);
		_customEvent_ChooseTargetColorNew();
		
		/* ============================ Click ============================= */
		addMousePressedListener(function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(_Target.isMousePressed())
				{
					if((Engine.engine.getGameAttribute("TargetPush") == true))
					{
						Engine.engine.setGameAttribute("TargetPush", false);
						_TrialCounter = asNumber((_TrialCounter + 1));
						propertyChanged("_TrialCounter", _TrialCounter);
						Engine.engine.setGameAttribute("Level05Falser", false);
						/* The black tint ends up greying the card out, to make the match more obvious. */
						_Target.setFilter([createTintFilter(Utils.getColorRGB(0,0,0), Engine.engine.getGameAttribute("Tint")/100)]);
						if((_LeftyCount > 4))
						{
							_LeftRightPicker = asNumber(2);
							propertyChanged("_LeftRightPicker", _LeftRightPicker);
						}
						else if((_RightyCount > 4))
						{
							_LeftRightPicker = asNumber(1);
							propertyChanged("_LeftRightPicker", _LeftRightPicker);
						}
						else
						{
							_LeftRightPicker = asNumber(randomInt(Math.floor(1), Math.floor(2)));
							propertyChanged("_LeftRightPicker", _LeftRightPicker);
						}
						_customEvent_SideSwitcher();
						/* LeftRightPicker: 1=left; 2=right. */
						if((_LeftRightPicker == 1))
						{
							_LeftyCount = asNumber((_LeftyCount + 1));
							propertyChanged("_LeftyCount", _LeftyCount);
							_Match.setX(Engine.engine.getGameAttribute("MatchX01"));
							_NoMatch.setX(Engine.engine.getGameAttribute("MatchX02"));
						}
						else if((_LeftRightPicker == 2))
						{
							_RightyCount = asNumber((_RightyCount + 1));
							propertyChanged("_RightyCount", _RightyCount);
							_Match.setX(Engine.engine.getGameAttribute("MatchX02"));
							_NoMatch.setX(Engine.engine.getGameAttribute("MatchX01"));
						}
						runLater(1000 * .25, function(timeTask:TimedTask):Void
						{
							_NoMatch.enableActorDrawing();
							_Match.enableActorDrawing();
							_NoMatch.growTo(125/100, 125/100, .05, Linear.easeNone);
							_Match.growTo(125/100, 125/100, .05, Linear.easeNone);
							runLater(1000 * .05, function(timeTask:TimedTask):Void
							{
								_NoMatch.growTo(100/100, 100/100, .025, Linear.easeNone);
								_Match.growTo(100/100, 100/100, .025, Linear.easeNone);
								_Match.setAnimation("" + "Match");
								_NoMatch.setAnimation("" + "Match");
							}, null);
						}, null);
						Engine.engine.setGameAttribute("MatchPushable", true);
					}
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(_Match, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((_Matchable == true))
				{
					_Matchable = false;
					propertyChanged("_Matchable", _Matchable);
					Engine.engine.setGameAttribute("MatchPushable", false);
					playSound(getSound(57));
					_counter = asNumber((_counter + 1));
					propertyChanged("_counter", _counter);
					_NumCorrect = asNumber((_NumCorrect + 1));
					propertyChanged("_NumCorrect", _NumCorrect);
					_PercentRight = asNumber(Math.round(((_NumCorrect / _counter) * 100)));
					propertyChanged("_PercentRight", _PercentRight);
					_ConsecutiveRightCounter = asNumber((_ConsecutiveRightCounter + 1));
					propertyChanged("_ConsecutiveRightCounter", _ConsecutiveRightCounter);
					if((_ConsecutiveRightCounter >= 3))
					{
						_CLR = asNumber((_CLR + 1));
						propertyChanged("_CLR", _CLR);
					}
					_PCLR = asNumber(Math.round(((_CLR / _counter) * 100)));
					propertyChanged("_PCLR", _PCLR);
					Engine.engine.setGameAttribute("LevelTrial", (Engine.engine.getGameAttribute("LevelTrial") + 1));
					runLater(1000 * .01, function(timeTask:TimedTask):Void
					{
						runLater(1000 * .5, function(timeTask:TimedTask):Void
						{
							if((_NoMatchGreen == true))
							{
								if((_LeftRightPicker == 1))
								{
									_Match.setY(_Matchyvalue);
									_Match.disableActorDrawing();
								}
								else if((_LeftRightPicker == 2))
								{
									_Match.setY(_Matchyvalue);
									_Match.disableActorDrawing();
								}
								_NoMatchGreen = false;
								propertyChanged("_NoMatchGreen", _NoMatchGreen);
							}
							else if((_NoMatchRed == true))
							{
								if((_LeftRightPicker == 1))
								{
									_Match.setY(_Matchyvalue);
									_Match.disableActorDrawing();
								}
								else if((_LeftRightPicker == 2))
								{
									_Match.setY(_Matchyvalue);
									_Match.disableActorDrawing();
								}
								_NoMatchRed = false;
								propertyChanged("_NoMatchRed", _NoMatchRed);
							}
						}, null);
					}, null);
					_NoMatch.disableActorDrawing();
					_Match.disableActorDrawing();
					_Target.disableActorDrawing();
					_NoMatch.setX(-1200);
					_Match.setX(-1200);
					trace("" + "True");
					trace("" + Engine.engine.getGameAttribute("L18Date"));
					if(((_ConsecutiveRightCounter % 10) == 0))
					{
						if((_RuleSwitchCount == 0))
						{
							_TtCFC = asNumber(_counter);
							propertyChanged("_TtCFC", _TtCFC);
						}
						_RuleSwitchCount = asNumber((_RuleSwitchCount + 1));
						propertyChanged("_RuleSwitchCount", _RuleSwitchCount);
						if((_RuleChooser == 0))
						{
							_RuleChooser = asNumber(1);
							propertyChanged("_RuleChooser", _RuleChooser);
						}
						else
						{
							_RuleChooser = asNumber(0);
							propertyChanged("_RuleChooser", _RuleChooser);
						}
					}
					_NPE = asNumber((_TotalWrong - _PE));
					propertyChanged("_NPE", _NPE);
					_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
					_Item[Std.int(1)] = Engine.engine.getGameAttribute("L18TotalNum");
					_Item[Std.int(2)] = (("" + (("" + Date.now().getHours()) + ("" + ":"))) + ("" + (("" + (("" + Date.now().getMinutes()) + ("" + ":"))) + ("" + Date.now().getSeconds()))));
					_Item[Std.int(3)] = _counter;
					_Item[Std.int(4)] = _NumCorrect;
					_Item[Std.int(5)] = _PercentRight;
					_Item[Std.int(6)] = _PE;
					_Item[Std.int(7)] = Math.round(((_PE / _TotalWrong) * 100));
					_Item[Std.int(8)] = _NPE;
					_Item[Std.int(9)] = _TotalWrong;
					_Item[Std.int(10)] = (100 - _PercentRight);
					_Item[Std.int(11)] = _TtCFC;
					_Item[Std.int(12)] = _RuleSwitchCount;
					_Item[Std.int(13)] = _PCLR;
					_Item[Std.int(14)] = _FtMS;
					Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("L18TotalNum"))] = _Item;
					if((_RuleSwitchCount == 4))
					{
						switchScene(GameModel.get().scenes.get(46).getID(), null, createCrossfadeTransition(.5));
						saveGame("mySave", function(success:Bool):Void
						{
							
						});
					}
					else
					{
						runLater(1000 * 1, function(timeTask:TimedTask):Void
						{
							_Target.clearFilters();
							_customEvent_ChooseTargetColorNew();
							runLater(1000 * .1, function(timeTask:TimedTask):Void
							{
								Engine.engine.setGameAttribute("TargetPush", true);
							}, null);
						}, null);
						saveGame("mySave", function(success:Bool):Void
						{
							
						});
					}
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(_NoMatch, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((_Matchable == true))
				{
					_Matchable = false;
					propertyChanged("_Matchable", _Matchable);
					Engine.engine.setGameAttribute("MatchPushable", false);
					_counter = asNumber((_counter + 1));
					propertyChanged("_counter", _counter);
					_TotalWrong = asNumber((_TotalWrong + 1));
					propertyChanged("_TotalWrong", _TotalWrong);
					_PercentRight = asNumber(Math.round(((_NumCorrect / _counter) * 100)));
					propertyChanged("_PercentRight", _PercentRight);
					if(((_ConsecutiveRightCounter == 0) && (_counter > 0)))
					{
						_PE = asNumber((_PE + 1));
						propertyChanged("_PE", _PE);
					}
					if((_ConsecutiveRightCounter >= 5))
					{
						_FtMS = asNumber((_FtMS + 1));
						propertyChanged("_FtMS", _FtMS);
					}
					_ConsecutiveRightCounter = asNumber(0);
					propertyChanged("_ConsecutiveRightCounter", _ConsecutiveRightCounter);
					Engine.engine.setGameAttribute("LevelTrial", (Engine.engine.getGameAttribute("LevelTrial") + 1));
					runLater(1000 * .01, function(timeTask:TimedTask):Void
					{
						runLater(1000 * .5, function(timeTask:TimedTask):Void
						{
							if((_NoMatchGreen == true))
							{
								if((_LeftRightPicker == 1))
								{
									_NoMatch.setY(_Matchyvalue);
									_NoMatch.disableActorDrawing();
								}
								else if((_LeftRightPicker == 2))
								{
									_NoMatch.setY(_Matchyvalue);
									_NoMatch.disableActorDrawing();
								}
								_NoMatchGreen = false;
								propertyChanged("_NoMatchGreen", _NoMatchGreen);
							}
							else if((_NoMatchRed == true))
							{
								if((_LeftRightPicker == 1))
								{
									_NoMatch.setY(_Matchyvalue);
									_NoMatch.disableActorDrawing();
								}
								else if((_LeftRightPicker == 2))
								{
									_NoMatch.setY(_Matchyvalue);
									_NoMatch.disableActorDrawing();
								}
								_NoMatchRed = false;
								propertyChanged("_NoMatchRed", _NoMatchRed);
							}
						}, null);
					}, null);
					_NoMatch.disableActorDrawing();
					_Match.disableActorDrawing();
					_Target.disableActorDrawing();
					_NoMatch.setX(-1200);
					_Match.setX(-1200);
					trace("" + "False");
					trace("" + Engine.engine.getGameAttribute("L18Date"));
					_NPE = asNumber((_TotalWrong - _PE));
					propertyChanged("_NPE", _NPE);
					_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
					_Item[Std.int(1)] = Engine.engine.getGameAttribute("L18TotalNum");
					_Item[Std.int(2)] = (("" + (("" + Date.now().getHours()) + ("" + ":"))) + ("" + (("" + (("" + Date.now().getMinutes()) + ("" + ":"))) + ("" + Date.now().getSeconds()))));
					_Item[Std.int(3)] = _counter;
					_Item[Std.int(4)] = _NumCorrect;
					_Item[Std.int(5)] = _PercentRight;
					_Item[Std.int(6)] = _PE;
					_Item[Std.int(7)] = Math.round(((_PE / _TotalWrong) * 100));
					_Item[Std.int(8)] = _NPE;
					_Item[Std.int(9)] = _TotalWrong;
					_Item[Std.int(10)] = (100 - _PercentRight);
					_Item[Std.int(11)] = _TtCFC;
					_Item[Std.int(12)] = _RuleSwitchCount;
					_Item[Std.int(13)] = _PCLR;
					_Item[Std.int(14)] = _FtMS;
					Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("L18TotalNum"))] = _Item;
					if((_counter == 100))
					{
						switchScene(GameModel.get().scenes.get(46).getID(), null, createCrossfadeTransition(.5));
						saveGame("mySave", function(success:Bool):Void
						{
							
						});
					}
					else
					{
						runLater(1000 * 1, function(timeTask:TimedTask):Void
						{
							_Target.clearFilters();
							_customEvent_ChooseTargetColorNew();
							runLater(1000 * .1, function(timeTask:TimedTask):Void
							{
								Engine.engine.setGameAttribute("TargetPush", true);
							}, null);
						}, null);
						saveGame("mySave", function(success:Bool):Void
						{
							
						});
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(102));
				g.drawString("" + "Set: ", 0, 5);
				g.setFont(getFont(101));
				g.drawString("" + (Engine.engine.getGameAttribute("L18Date").length - 1), 0, 5);
				g.setFont(getFont(102));
				g.drawString("" + "Trial: ", 0, 50);
				g.setFont(getFont(101));
				g.drawString("" + (Engine.engine.getGameAttribute("LevelTrial") + 1), 0, 50);
				g.setFont(getFont(102));
				g.drawString("" + "Rule:", 0, 90);
				g.setFont(getFont(102));
				if((_RuleChooser == 0))
				{
					g.drawString("" + "Shape", 0, 105);
				}
				else
				{
					g.drawString("" + "Color", 0, 105);
				}
				g.setFont(getFont(102));
				g.drawString("" + "# Correct:", 0, 120);
				g.setFont(getFont(101));
				g.drawString("" + _NumCorrect, 0, 120);
				g.setFont(getFont(102));
				g.drawString("" + "# Wrong:", 0, 160);
				g.setFont(getFont(101));
				g.drawString("" + _TotalWrong, 0, 160);
				g.setFont(getFont(102));
				g.drawString("" + "# Correct", 0, 200);
				g.drawString("" + "In A Row:", 0, 215);
				g.setFont(getFont(101));
				g.drawString("" + _ConsecutiveRightCounter, 0, 215);
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}