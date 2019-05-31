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



class SceneEvents_50 extends SceneScript
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
	public var _ATTLIST:Array<Dynamic>;
	public var _NumberGetters:Array<Dynamic>;
	public var _ColorsGetters:Array<Dynamic>;
	public var _ACCMF2:Float;
	public var _1X:Float;
	public var _2X:Float;
	public var _3X:Float;
	public var _ChooseColorTarget:String;
	public var _ChooseColorMatch:String;
	public var _ChooseColorNoMatch:String;
	public var _NoMatch2:Actor;
	public var _ChooseColorNoMatch2:String;
	public var _ASCMF2:Float;
	public var _TargetShape:String;
	public var _MatchShape:String;
	public var _MatchFalseShape:String;
	public var _MatchFalse2Shape:String;
	public var _ChooseShapeTarget:String;
	public var _ChooseShapeMatch:String;
	public var _ChooseShapeNoMatch:String;
	public var _ChooseShapeNoMatch2:String;
	public var _04getter:Float;
	public var _ANCT:Float;
	public var _ANCMF2:Float;
	public var _ANCM:Float;
	public var _ANCMF:Float;
	public var _XPos1:Float;
	public var _Xpos2:Float;
	public var _Xpos3:Float;
	public var _MiddyCount:Float;
	public var _MidSideCounter:Float;
	public var _MatchFPos:Float;
	public var _LRMorderPicker:Float;
	public var _Matchable:Bool;
	public var _CurrentRule:String;
	public var _RuleShapePick:Bool;
	public var _RuleColorPick:Bool;
	public var _RuleNumberPick:Bool;
	public var _RuleNumTimesShape:Float;
	public var _RuleNumTimesColor:Float;
	public var _RuleNumTimesNumber:Float;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_RuleChooser():Void
	{
		trace("" + "Rule Chooser Begin");
		/* rulechooser decides what rule: 1=shape; 2=color; 3=number. */
		_LeftSideCounter = asNumber(0);
		propertyChanged("_LeftSideCounter", _LeftSideCounter);
		_MidSideCounter = asNumber(0);
		propertyChanged("_MidSideCounter", _MidSideCounter);
		_RightSideCounter = asNumber(0);
		propertyChanged("_RightSideCounter", _RightSideCounter);
		_LeftRightPicker = asNumber(0);
		propertyChanged("_LeftRightPicker", _LeftRightPicker);
		_LeftyCount = asNumber(0);
		propertyChanged("_LeftyCount", _LeftyCount);
		_MiddyCount = asNumber(0);
		propertyChanged("_MiddyCount", _MiddyCount);
		_RightyCount = asNumber(0);
		propertyChanged("_RightyCount", _RightyCount);
		_RuleChooser = asNumber(randomInt(Math.floor(1), Math.floor(3)));
		propertyChanged("_RuleChooser", _RuleChooser);
		trace("" + _RuleChooser);
		if((_RuleChooser == 1))
		{
			if((_RuleShapePick == true))
			{
				_RuleShapePick = false;
				propertyChanged("_RuleShapePick", _RuleShapePick);
				_RuleColorPick = true;
				propertyChanged("_RuleColorPick", _RuleColorPick);
				_RuleNumberPick = true;
				propertyChanged("_RuleNumberPick", _RuleNumberPick);
			}
			else
			{
				_customEvent_RuleChooser();
			}
		}
		else if((_RuleChooser == 2))
		{
			if((_RuleColorPick == true))
			{
				_RuleShapePick = true;
				propertyChanged("_RuleShapePick", _RuleShapePick);
				_RuleColorPick = false;
				propertyChanged("_RuleColorPick", _RuleColorPick);
				_RuleNumberPick = true;
				propertyChanged("_RuleNumberPick", _RuleNumberPick);
			}
			else
			{
				_customEvent_RuleChooser();
			}
		}
		else
		{
			if((_RuleNumberPick == true))
			{
				_RuleShapePick = true;
				propertyChanged("_RuleShapePick", _RuleShapePick);
				_RuleColorPick = true;
				propertyChanged("_RuleColorPick", _RuleColorPick);
				_RuleNumberPick = false;
				propertyChanged("_RuleNumberPick", _RuleNumberPick);
			}
			else
			{
				_customEvent_RuleChooser();
			}
		}
		_customEvent_RuleChooser2();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_RuleChooser2():Void
	{
		trace("" + "RuleChooser2 Begin");
		trace("" + _RuleChooser);
		if((_RuleChooser == 1))
		{
			_CurrentRule = "Shape";
			propertyChanged("_CurrentRule", _CurrentRule);
			_customEvent_Rule1Setup();
		}
		if((_RuleChooser == 2))
		{
			_CurrentRule = "Color";
			propertyChanged("_CurrentRule", _CurrentRule);
			_customEvent_Rule2Setup();
		}
		if((_RuleChooser == 3))
		{
			_CurrentRule = "Number";
			propertyChanged("_CurrentRule", _CurrentRule);
			_customEvent_Rule3Setup();
		}
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule1Setup():Void
	{
		trace("" + "Rule1Setup Begins");
		/* ACC_T stands for "something" Color Chooser - Target
This is Rule 1 = shape matches! */
		Utils.clear(_NumberGetters);
		_NumberGetters.push(1);
		_NumberGetters.push(2);
		_NumberGetters.push(3);
		_NumberGetters.push(4);
		Utils.clear(_ColorsGetters);
		_ColorsGetters.push("Blue");
		_ColorsGetters.push("Orange");
		_ColorsGetters.push("Pink");
		_ColorsGetters.push("Purple");
		_ACCT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ACCT", _ACCT);
		_ACCMT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ACCMT", _ACCMT);
		if((_ACCT == _ACCMT))
		{
			_customEvent_Rule1Setup();
		}
		else
		{
			_ACCMF2 = asNumber(randomInt(Math.floor(1), Math.floor(4)));
			propertyChanged("_ACCMF2", _ACCMF2);
			if(((_ACCMF2 == _ACCT) || (_ACCMF2 == _ACCMT)))
			{
				_customEvent_Rule1Setup();
			}
			else
			{
				_customEvent_Rule1Setup2();
			}
		}
		/* Next, we need the first MatchFalse to be the SAME color as the Target, since we're doing three variables. */
		_ACCMF = asNumber(_ACCT);
		propertyChanged("_ACCMF", _ACCMF);
		trace("" + "Rule1Setup Finished");
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule1Setup2():Void
	{
		trace("" + "Rule1Setup2 Begun");
		/* First, we're going to set the color of the Target */
		if((_ACCT == 1))
		{
			_ChooseColorTarget = "Blue";
			propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			_ChooseColorNoMatch = "Blue";
			propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
		}
		else if((_ACCT == 2))
		{
			_ChooseColorTarget = "Orange";
			propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			_ChooseColorNoMatch = "Orange";
			propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
		}
		else if((_ACCT == 3))
		{
			_ChooseColorTarget = "Pink";
			propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			_ChooseColorNoMatch = "Pink";
			propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
		}
		else if((_ACCT == 4))
		{
			_ChooseColorTarget = "Purple";
			propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			_ChooseColorNoMatch = "Purple";
			propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
		}
		if((_ACCMT == 1))
		{
			_ChooseColorMatch = "Blue";
			propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
		}
		else if((_ACCMT == 2))
		{
			_ChooseColorMatch = "Orange";
			propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
		}
		else if((_ACCMT == 3))
		{
			_ChooseColorMatch = "Pink";
			propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
		}
		else if((_ACCMT == 4))
		{
			_ChooseColorMatch = "Purple";
			propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
		}
		_customEvent_Rule1Setup3();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule1Setup3():Void
	{
		trace("" + "Rule1Setup3 Begun");
		/* Next, we're going to set the color of the Match True AND MatchFalse2. After this step, we should have ALL of the proper colored cards determined for the Target, Match, MatchF1 and MatchF2. */
		if((!(_ACCMT == 1) && (!(_ACCMF == 1) && !(_ACCT == 1))))
		{
			_ACCMF2 = asNumber(1);
			propertyChanged("_ACCMF2", _ACCMF2);
			_ChooseColorNoMatch2 = "Blue";
			propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
		}
		else if((!(_ACCMT == 2) && (!(_ACCMF == 2) && !(_ACCT == 2))))
		{
			_ACCMF2 = asNumber(2);
			propertyChanged("_ACCMF2", _ACCMF2);
			_ChooseColorNoMatch2 = "Orange";
			propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
		}
		else if((!(_ACCMT == 3) && (!(_ACCMF == 3) && !(_ACCT == 3))))
		{
			_ACCMF2 = asNumber(3);
			propertyChanged("_ACCMF2", _ACCMF2);
			_ChooseColorNoMatch2 = "Pink";
			propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
		}
		else
		{
			_ACCMF2 = asNumber(4);
			propertyChanged("_ACCMF2", _ACCMF2);
			_ChooseColorNoMatch2 = "Purple";
			propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
		}
		trace("" + (("" + ("" + "ACC_T = ")) + ("" + ("" + _Target))));
		trace("" + (("" + ("" + "ACC_MT = ")) + ("" + ("" + _Match))));
		trace("" + (("" + ("" + "ACC_MF = ")) + ("" + ("" + _NoMatch))));
		trace("" + (("" + ("" + "ACC_MF2 = ")) + ("" + ("" + _NoMatch2))));
		_customEvent_Rule1Setup4();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule1Setup4():Void
	{
		trace("" + "Rule1Setup4 Begun");
		/* What we're doing here is determining which SHAPE everything has to be. Since we're on Rule 1, the Target Shape has to match the MatchT Shape. The other two shapes are random. */
		_ASCT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ASCT", _ASCT);
		_ASCMF = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ASCMF", _ASCMF);
		if((_ASCT == _ASCMF))
		{
			_customEvent_Rule1Setup4();
			trace("" + "ASC_T = ASC_MF");
			return;
		}
		else
		{
			_ASCMF2 = asNumber(randomInt(Math.floor(1), Math.floor(4)));
			propertyChanged("_ASCMF2", _ASCMF2);
			if(((_ASCMF2 == _ASCT) || (_ASCMF2 == _ASCMF)))
			{
				_customEvent_Rule1Setup4();
				trace("" + "ASC_MF2 = ASC_T OR ASC_MF2 = ASC_MF");
				return;
			}
			else
			{
				if((_ASCT == 1))
				{
					_ChooseShapeTarget = "Club";
					propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
					_ChooseShapeMatch = "Club";
					propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
				}
				else if((_ASCT == 2))
				{
					_ChooseShapeTarget = "Diamond";
					propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
					_ChooseShapeMatch = "Diamond";
					propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
				}
				else if((_ASCT == 3))
				{
					_ChooseShapeTarget = "Heart";
					propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
					_ChooseShapeMatch = "Heart";
					propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
				}
				else
				{
					_ChooseShapeTarget = "Moon";
					propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
					_ChooseShapeMatch = "Moon";
					propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
				}
				if((_ASCMF == 1))
				{
					_ChooseShapeNoMatch = "Club";
					propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
				}
				else if((_ASCMF == 2))
				{
					_ChooseShapeNoMatch = "Diamond";
					propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
				}
				else if((_ASCMF == 3))
				{
					_ChooseShapeNoMatch = "Heart";
					propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
				}
				else
				{
					_ChooseShapeNoMatch = "Moon";
					propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
				}
				if((_ASCMF2 == 1))
				{
					_ChooseShapeNoMatch2 = "Club";
					propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
				}
				else if((_ASCMF2 == 2))
				{
					_ChooseShapeNoMatch2 = "Diamond";
					propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
				}
				else if((_ASCMF2 == 3))
				{
					_ChooseShapeNoMatch2 = "Heart";
					propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
				}
				else
				{
					_ChooseShapeNoMatch2 = "Moon";
					propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
				}
				trace("" + (("" + ("" + "TargetShape = ")) + ("" + ("" + _ChooseShapeTarget))));
				trace("" + (("" + ("" + "MatchShape = ")) + ("" + ("" + _ChooseShapeMatch))));
				trace("" + (("" + ("" + "Match False Shape = ")) + ("" + ("" + _ChooseShapeNoMatch))));
				trace("" + (("" + ("" + "Match False 2 Shape = ")) + ("" + ("" + _ChooseShapeNoMatch2))));
				/* Since we just chose shape, we now need to choose the numbers for each card. We'll do that next. */
				_customEvent_Rule1Setup5();
			}
		}
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule1Setup5():Void
	{
		trace("" + "Rule1Setup5 Begun");
		/* So, in order to choose 1-4 for Target, then for Match, then for... I set up the numbers 1-4 into a list of numbers. After each random number is selected, it is removed from list. No repeats! */
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(3)));
		propertyChanged("_04getter", _04getter);
		_ANCT = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCT", _ANCT);
		_ANCMF2 = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCMF2", _ANCMF2);
		_NumberGetters.splice(Std.int(_04getter), 1);
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(2)));
		propertyChanged("_04getter", _04getter);
		_ANCM = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCM", _ANCM);
		_NumberGetters.splice(Std.int(_04getter), 1);
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(1)));
		propertyChanged("_04getter", _04getter);
		_ANCMF = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCMF", _ANCMF);
		trace("" + (("" + ("" + "Target Number = ")) + ("" + ("" + _ANCT))));
		trace("" + (("" + ("" + "MatchNumber = ")) + ("" + ("" + _ANCM))));
		trace("" + (("" + ("" + "Match False Number = ")) + ("" + ("" + _ANCMF))));
		trace("" + (("" + ("" + "Match False 2 Number = ")) + ("" + ("" + _ANCMF2))));
		/* Since we just chose shape, we now need to choose the numbers for each card. We'll do that next. */
		_customEvent_Rule1Setup6();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule1Setup6():Void
	{
		trace("" + "Rule1Setup6 Begins");
		_Target.setAnimation("" + (("" + (("" + _ChooseColorTarget) + ("" + _ChooseShapeTarget))) + ("" + (("" + "0") + ("" + _ANCT)))));
		_Match.setAnimation("" + (("" + (("" + _ChooseColorMatch) + ("" + _ChooseShapeMatch))) + ("" + (("" + "0") + ("" + _ANCM)))));
		_NoMatch.setAnimation("" + (("" + (("" + _ChooseColorNoMatch) + ("" + _ChooseShapeNoMatch))) + ("" + (("" + "0") + ("" + _ANCMF)))));
		_NoMatch2.setAnimation("" + (("" + (("" + _ChooseColorNoMatch2) + ("" + _ChooseShapeNoMatch2))) + ("" + (("" + "0") + ("" + _ANCMF2)))));
		_customEvent_ShowTargetEvent();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule2Setup():Void
	{
		trace("" + "Rule2Setup Begins");
		/* Rule 1 chooses Colors first. Since this is going to have the SAME color, let's just reverse it - choose Shape here, THEN make sure Color matches, next. */
		/* This is Rule 2 = COLOR matches! */
		Utils.clear(_NumberGetters);
		_NumberGetters.push(1);
		_NumberGetters.push(2);
		_NumberGetters.push(3);
		_NumberGetters.push(4);
		Utils.clear(_ColorsGetters);
		_ColorsGetters.push("Blue");
		_ColorsGetters.push("Orange");
		_ColorsGetters.push("Pink");
		_ColorsGetters.push("Purple");
		/* ACC_T = Color Chooser (Target)
ACC_MT = Color Chooser (Match True) */
		_ASCT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ASCT", _ASCT);
		_ASCMT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ASCMT", _ASCMT);
		if((_ASCT == _ASCMT))
		{
			_customEvent_Rule2Setup();
		}
		else
		{
			_ASCMF2 = asNumber(randomInt(Math.floor(1), Math.floor(4)));
			propertyChanged("_ASCMF2", _ASCMF2);
			if(((_ASCMF2 == _ASCT) || (_ASCMF2 == _ASCMT)))
			{
				_customEvent_Rule2Setup();
			}
			else
			{
				_ASCMF = asNumber(_ASCT);
				propertyChanged("_ASCMF", _ASCMF);
				_customEvent_Rule2Setup2();
			}
		}
		/* Next, we need the first MatchFalse to be the SAME shape as the Target, since we're doing three variables. */
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule2Setup2():Void
	{
		trace("" + "Rule2Setup2 Begun");
		/* First, we're going to set the shape of the Target */
		if((_ASCT == 1))
		{
			_ChooseShapeTarget = "Club";
			propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			_ChooseShapeNoMatch = "Club";
			propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
		}
		else if((_ASCT == 2))
		{
			_ChooseShapeTarget = "Diamond";
			propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			_ChooseShapeNoMatch = "Diamond";
			propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
		}
		else if((_ASCT == 3))
		{
			_ChooseShapeTarget = "Heart";
			propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			_ChooseShapeNoMatch = "Heart";
			propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
		}
		else if((_ASCT == 4))
		{
			_ChooseShapeTarget = "Moon";
			propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			_ChooseShapeNoMatch = "Moon";
			propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
		}
		if((_ASCMT == 1))
		{
			_ChooseShapeMatch = "Club";
			propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
		}
		else if((_ASCMT == 2))
		{
			_ChooseShapeMatch = "Diamond";
			propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
		}
		else if((_ASCMT == 3))
		{
			_ChooseShapeMatch = "Heart";
			propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
		}
		else if((_ASCMT == 4))
		{
			_ChooseShapeMatch = "Moon";
			propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
		}
		_customEvent_Rule2Setup3();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule2Setup3():Void
	{
		trace("" + "Rule2Setup3 Begun");
		/* Next, we're going to set the shape of the Match True AND MatchFalse2. After this step, we should have ALL of the proper shaped cards determined for the Target, Match, MatchF1 and MatchF2. */
		if((!(_ASCMT == 1) && (!(_ASCMF == 1) && !(_ASCT == 1))))
		{
			_ASCMF2 = asNumber(1);
			propertyChanged("_ASCMF2", _ASCMF2);
			_ChooseShapeNoMatch2 = "Club";
			propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
		}
		else if((!(_ASCMT == 2) && (!(_ASCMF == 2) && !(_ASCT == 2))))
		{
			_ASCMF2 = asNumber(2);
			propertyChanged("_ASCMF2", _ASCMF2);
			_ChooseShapeNoMatch2 = "Diamond";
			propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
		}
		else if((!(_ASCMT == 3) && (!(_ASCMF == 3) && !(_ASCT == 3))))
		{
			_ASCMF2 = asNumber(3);
			propertyChanged("_ASCMF2", _ASCMF2);
			_ChooseShapeNoMatch2 = "Heart";
			propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
		}
		else
		{
			_ASCMF2 = asNumber(4);
			propertyChanged("_ASCMF2", _ASCMF2);
			_ChooseShapeNoMatch2 = "Moon";
			propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
		}
		trace("" + (("" + ("" + "ASC_T = ")) + ("" + ("" + _Target))));
		trace("" + (("" + ("" + "ASC_MT = ")) + ("" + ("" + _Match))));
		trace("" + (("" + ("" + "ASC_MF = ")) + ("" + ("" + _NoMatch))));
		trace("" + (("" + ("" + "ASC_MF2 = ")) + ("" + ("" + _NoMatch2))));
		_customEvent_Rule2Setup4();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule2Setup4():Void
	{
		trace("" + "Rule2Setup4 Begun");
		/* What we're doing here is determining which COLOR everything has to be. Since we're on Rule 2, the Target COLOR has to match the MatchT COLOR. The other two shapes are random. */
		_ACCT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ACCT", _ACCT);
		_ACCMF = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ACCMF", _ACCMF);
		if((_ACCT == _ACCMF))
		{
			_customEvent_Rule2Setup4();
			trace("" + "ACC_T = ACC_MF");
			return;
		}
		else
		{
			_ACCMF2 = asNumber(randomInt(Math.floor(1), Math.floor(4)));
			propertyChanged("_ACCMF2", _ACCMF2);
			if(((_ACCMF2 == _ACCT) || (_ACCMF2 == _ACCMF)))
			{
				_customEvent_Rule2Setup4();
				trace("" + "ACC_MF2 = ACC_T OR ACC_MF2 = ACC_MF");
				return;
			}
			else
			{
				if((_ACCT == 1))
				{
					_ChooseColorTarget = "Blue";
					propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
					_ChooseColorMatch = "Blue";
					propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
				}
				else if((_ACCT == 2))
				{
					_ChooseColorTarget = "Orange";
					propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
					_ChooseColorMatch = "Orange";
					propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
				}
				else if((_ACCT == 3))
				{
					_ChooseColorTarget = "Pink";
					propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
					_ChooseColorMatch = "Pink";
					propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
				}
				else
				{
					_ChooseColorTarget = "Purple";
					propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
					_ChooseColorMatch = "Purple";
					propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
				}
				if((_ACCMF == 1))
				{
					_ChooseColorNoMatch = "Blue";
					propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
				}
				else if((_ACCMF == 2))
				{
					_ChooseColorNoMatch = "Orange";
					propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
				}
				else if((_ACCMF == 3))
				{
					_ChooseColorNoMatch = "Pink";
					propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
				}
				else
				{
					_ChooseColorNoMatch = "Purple";
					propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
				}
				if((_ACCMF2 == 1))
				{
					_ChooseColorNoMatch2 = "Blue";
					propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
				}
				else if((_ACCMF2 == 2))
				{
					_ChooseColorNoMatch2 = "Orange";
					propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
				}
				else if((_ACCMF2 == 3))
				{
					_ChooseColorNoMatch2 = "Pink";
					propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
				}
				else
				{
					_ChooseColorNoMatch2 = "Purple";
					propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
				}
				trace("" + (("" + ("" + "TargetColor = ")) + ("" + ("" + _ChooseColorTarget))));
				trace("" + (("" + ("" + "MatchColor = ")) + ("" + ("" + _ChooseColorMatch))));
				trace("" + (("" + ("" + "Match False Color = ")) + ("" + ("" + _ChooseColorNoMatch))));
				trace("" + (("" + ("" + "Match False 2 Color = ")) + ("" + ("" + _ChooseColorNoMatch2))));
				/* Since we just chose Color, we now need to choose the numbers for each card. We'll do that next. */
				_customEvent_Rule2Setup5();
			}
		}
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule2Setup5():Void
	{
		trace("" + "Rule2Setup5 Begun");
		/* So, in order to choose 1-4 for Target, then for Match, then for... I set up the numbers 1-4 into a list of numbers. After each random number is selected, it is removed from list. No repeats! */
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(3)));
		propertyChanged("_04getter", _04getter);
		_ANCT = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCT", _ANCT);
		_ANCMF2 = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCMF2", _ANCMF2);
		_NumberGetters.splice(Std.int(_04getter), 1);
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(2)));
		propertyChanged("_04getter", _04getter);
		_ANCM = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCM", _ANCM);
		_NumberGetters.splice(Std.int(_04getter), 1);
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(1)));
		propertyChanged("_04getter", _04getter);
		_ANCMF = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCMF", _ANCMF);
		trace("" + (("" + ("" + "Target Number = ")) + ("" + ("" + _ANCT))));
		trace("" + (("" + ("" + "MatchNumber = ")) + ("" + ("" + _ANCM))));
		trace("" + (("" + ("" + "Match False Number = ")) + ("" + ("" + _ANCMF))));
		trace("" + (("" + ("" + "Match False 2 Number = ")) + ("" + ("" + _ANCMF2))));
		_customEvent_Rule2Setup6();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule2Setup6():Void
	{
		trace("" + "Rule2Setup6 Begins");
		_Target.setAnimation("" + (("" + (("" + _ChooseColorTarget) + ("" + _ChooseShapeTarget))) + ("" + (("" + "0") + ("" + _ANCT)))));
		_Match.setAnimation("" + (("" + (("" + _ChooseColorMatch) + ("" + _ChooseShapeMatch))) + ("" + (("" + "0") + ("" + _ANCM)))));
		_NoMatch.setAnimation("" + (("" + (("" + _ChooseColorNoMatch) + ("" + _ChooseShapeNoMatch))) + ("" + (("" + "0") + ("" + _ANCMF)))));
		_NoMatch2.setAnimation("" + (("" + (("" + _ChooseColorNoMatch2) + ("" + _ChooseShapeNoMatch2))) + ("" + (("" + "0") + ("" + _ANCMF2)))));
		_customEvent_ShowTargetEvent();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule3Setup():Void
	{
		trace("" + "Rule3Setup Begun");
		/* First, let's erase everything from number/colors getter and then reset them. */
		Utils.clear(_NumberGetters);
		_NumberGetters.push(1);
		_NumberGetters.push(2);
		_NumberGetters.push(3);
		_NumberGetters.push(4);
		Utils.clear(_ColorsGetters);
		_ColorsGetters.push("Blue");
		_ColorsGetters.push("Orange");
		_ColorsGetters.push("Pink");
		_ColorsGetters.push("Purple");
		/* So, in order to choose 1-4 for Target, then for Match, then for... I set up the numbers 1-4 into a list of numbers. After each random number is selected, it is removed from list. No repeats! */
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(3)));
		propertyChanged("_04getter", _04getter);
		_ANCT = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCT", _ANCT);
		_ANCM = asNumber(_ANCT);
		propertyChanged("_ANCM", _ANCM);
		_NumberGetters.splice(Std.int(_04getter), 1);
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(2)));
		propertyChanged("_04getter", _04getter);
		_ANCMF2 = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCMF2", _ANCMF2);
		_NumberGetters.splice(Std.int(_04getter), 1);
		_04getter = asNumber(randomInt(Math.floor(0), Math.floor(1)));
		propertyChanged("_04getter", _04getter);
		_ANCMF = asNumber(_NumberGetters[Std.int(_04getter)]);
		propertyChanged("_ANCMF", _ANCMF);
		_NumberGetters.splice(Std.int(_04getter), 1);
		trace("" + (("" + ("" + "Target Number = ")) + ("" + ("" + _ANCT))));
		trace("" + (("" + ("" + "MatchNumber = ")) + ("" + ("" + _ANCM))));
		trace("" + (("" + ("" + "Match False Number = ")) + ("" + ("" + _ANCMF))));
		trace("" + (("" + ("" + "Match False 2 Number = ")) + ("" + ("" + _ANCMF2))));
		/* Next, we'll set up the colors. Color for Target and Target False should be set to the same. */
		_customEvent_Rule3Setup2();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule3Setup2():Void
	{
		_ACCT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ACCT", _ACCT);
		_ACCMT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ACCMT", _ACCMT);
		if((_ACCT == _ACCMT))
		{
			_customEvent_Rule3Setup2();
		}
		else
		{
			_ACCMF2 = asNumber(randomInt(Math.floor(1), Math.floor(4)));
			propertyChanged("_ACCMF2", _ACCMF2);
			if(((_ACCMF2 == _ACCT) || (_ACCMF2 == _ACCMT)))
			{
				_customEvent_Rule3Setup2();
			}
			else
			{
				/* Next, we need the first MatchFalse to be the SAME color as the Target, since we're doing three variables. */
				_ACCMF = asNumber(_ACCT);
				propertyChanged("_ACCMF", _ACCMF);
				trace("" + "Rule3Setup2 Finished");
				_customEvent_Rule3Setup3();
			}
		}
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule3Setup3():Void
	{
		trace("" + "Rule3Setup3 Begun");
		/* First, we're going to set the color of the Target */
		if((_ACCT == 1))
		{
			_ChooseColorTarget = "Blue";
			propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			_ChooseColorNoMatch = "Blue";
			propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
		}
		else if((_ACCT == 2))
		{
			_ChooseColorTarget = "Orange";
			propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			_ChooseColorNoMatch = "Orange";
			propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
		}
		else if((_ACCT == 3))
		{
			_ChooseColorTarget = "Pink";
			propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			_ChooseColorNoMatch = "Pink";
			propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
		}
		else if((_ACCT == 4))
		{
			_ChooseColorTarget = "Purple";
			propertyChanged("_ChooseColorTarget", _ChooseColorTarget);
			_ChooseColorNoMatch = "Purple";
			propertyChanged("_ChooseColorNoMatch", _ChooseColorNoMatch);
		}
		if((_ACCMT == 1))
		{
			_ChooseColorMatch = "Blue";
			propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
		}
		else if((_ACCMT == 2))
		{
			_ChooseColorMatch = "Orange";
			propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
		}
		else if((_ACCMT == 3))
		{
			_ChooseColorMatch = "Pink";
			propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
		}
		else if((_ACCMT == 4))
		{
			_ChooseColorMatch = "Purple";
			propertyChanged("_ChooseColorMatch", _ChooseColorMatch);
		}
		if((_ACCMF2 == 1))
		{
			_ChooseColorNoMatch2 = "Blue";
			propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
		}
		else if((_ACCMF2 == 2))
		{
			_ChooseColorNoMatch2 = "Orange";
			propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
		}
		else if((_ACCMF2 == 3))
		{
			_ChooseColorNoMatch2 = "Pink";
			propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
		}
		else if((_ACCMF2 == 4))
		{
			_ChooseColorNoMatch2 = "Purple";
			propertyChanged("_ChooseColorNoMatch2", _ChooseColorNoMatch2);
		}
		_customEvent_Rule3Setup4();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule3Setup4():Void
	{
		trace("" + "Rule3Setup4 Begins");
		/* ACC_T = Color Chooser (Target)
ACC_MT = Color Chooser (Match True) */
		_ASCT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ASCT", _ASCT);
		_ASCMT = asNumber(randomInt(Math.floor(1), Math.floor(4)));
		propertyChanged("_ASCMT", _ASCMT);
		if((_ASCT == _ASCMT))
		{
			_customEvent_Rule3Setup4();
		}
		else
		{
			_ASCMF = asNumber(randomInt(Math.floor(1), Math.floor(4)));
			propertyChanged("_ASCMF", _ASCMF);
			if(((_ASCMF == _ASCT) || (_ASCMF == _ASCMT)))
			{
				_customEvent_Rule3Setup4();
			}
			else
			{
				_ASCMF2 = asNumber(_ASCT);
				propertyChanged("_ASCMF2", _ASCMF2);
				_customEvent_Rule3Setup5();
			}
		}
		/* Next, we need the first MatchFalse to be the SAME shape as the Target, since we're doing three variables. */
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule3Setup5():Void
	{
		trace("" + "Rule3Setup5 Begun");
		/* First, we're going to set the shape of the Target */
		if((_ASCT == 1))
		{
			_ChooseShapeTarget = "Club";
			propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			_ChooseShapeNoMatch2 = "Club";
			propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
		}
		else if((_ASCT == 2))
		{
			_ChooseShapeTarget = "Diamond";
			propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			_ChooseShapeNoMatch2 = "Diamond";
			propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
		}
		else if((_ASCT == 3))
		{
			_ChooseShapeTarget = "Heart";
			propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			_ChooseShapeNoMatch2 = "Heart";
			propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
		}
		else if((_ASCT == 4))
		{
			_ChooseShapeTarget = "Moon";
			propertyChanged("_ChooseShapeTarget", _ChooseShapeTarget);
			_ChooseShapeNoMatch2 = "Moon";
			propertyChanged("_ChooseShapeNoMatch2", _ChooseShapeNoMatch2);
		}
		if((_ASCMT == 1))
		{
			_ChooseShapeMatch = "Club";
			propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
		}
		else if((_ASCMT == 2))
		{
			_ChooseShapeMatch = "Diamond";
			propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
		}
		else if((_ASCMT == 3))
		{
			_ChooseShapeMatch = "Heart";
			propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
		}
		else if((_ASCMT == 4))
		{
			_ChooseShapeMatch = "Moon";
			propertyChanged("_ChooseShapeMatch", _ChooseShapeMatch);
		}
		if((_ASCMF == 1))
		{
			_ChooseShapeNoMatch = "Club";
			propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
		}
		else if((_ASCMF == 2))
		{
			_ChooseShapeNoMatch = "Diamond";
			propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
		}
		else if((_ASCMF == 3))
		{
			_ChooseShapeNoMatch = "Heart";
			propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
		}
		else if((_ASCMF == 4))
		{
			_ChooseShapeNoMatch = "Moon";
			propertyChanged("_ChooseShapeNoMatch", _ChooseShapeNoMatch);
		}
		_customEvent_Rule3Setup6();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Rule3Setup6():Void
	{
		trace("" + "Rule3Setup6 Begins");
		_Target.setAnimation("" + (("" + (("" + _ChooseColorTarget) + ("" + _ChooseShapeTarget))) + ("" + (("" + "0") + ("" + _ANCT)))));
		_Match.setAnimation("" + (("" + (("" + _ChooseColorMatch) + ("" + _ChooseShapeMatch))) + ("" + (("" + "0") + ("" + _ANCM)))));
		_NoMatch.setAnimation("" + (("" + (("" + _ChooseColorNoMatch) + ("" + _ChooseShapeNoMatch))) + ("" + (("" + "0") + ("" + _ANCMF)))));
		_NoMatch2.setAnimation("" + (("" + (("" + _ChooseColorNoMatch2) + ("" + _ChooseShapeNoMatch2))) + ("" + (("" + "0") + ("" + _ANCMF2)))));
		trace("" + (("" + "Target = ") + ("" + (("" + (("" + _ChooseColorTarget) + ("" + _ChooseShapeTarget))) + ("" + (("" + "0") + ("" + _ANCT)))))));
		trace("" + (("" + "Match = ") + ("" + (("" + (("" + _ChooseColorMatch) + ("" + _ChooseShapeMatch))) + ("" + (("" + "0") + ("" + _ANCM)))))));
		trace("" + (("" + "NoMatch = ") + ("" + (("" + (("" + _ChooseColorNoMatch) + ("" + _ChooseShapeNoMatch))) + ("" + (("" + "0") + ("" + _ANCMF)))))));
		trace("" + (("" + "NoMatch2 = ") + ("" + (("" + (("" + _ChooseColorNoMatch2) + ("" + _ChooseShapeNoMatch2))) + ("" + (("" + "0") + ("" + _ANCMF2)))))));
		_customEvent_ShowTargetEvent();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ShowTargetEvent():Void
	{
		trace("" + "Show Target - fade in now.");
		/* "This shtuff brings up the target card (pops up)" */ _Target.setX(Engine.engine.getGameAttribute("TargetX"));
		_Target.setY(Engine.engine.getGameAttribute("TargetY"));
		_Target.enableActorDrawing();
		_Target.growTo(125/100, 125/100, .1, Linear.easeNone);
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Target.growTo(100/100, 100/100, .05, Linear.easeNone);
		}, null);
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_SideChooser():Void
	{
		trace("" + "SideChooserBegins");
		if((_LeftyCount > 4))
		{
			if((_RightyCount > 4))
			{
				_LeftRightPicker = asNumber(2);
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
			}
			else if((_MiddyCount > 4))
			{
				_LeftRightPicker = asNumber(3);
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
			}
			else
			{
				_LeftRightPicker = asNumber(randomInt(Math.floor(1.5), Math.floor(3.5)));
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
			}
		}
		else if((_MiddyCount > 4))
		{
			if((_RightyCount > 4))
			{
				_LeftRightPicker = asNumber(1);
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
			}
			else if((_LeftyCount > 4))
			{
				_LeftRightPicker = asNumber(3);
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
			}
			else
			{
				_LeftRightPicker = asNumber(randomInt(Math.floor(1.5), Math.floor(3.5)));
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
				if((_LeftRightPicker == 2))
				{
					_LeftRightPicker = asNumber(1);
					propertyChanged("_LeftRightPicker", _LeftRightPicker);
				}
				else
				{
					_LeftRightPicker = asNumber(3);
					propertyChanged("_LeftRightPicker", _LeftRightPicker);
				}
			}
		}
		else if((_RightyCount > 4))
		{
			if((_LeftyCount > 4))
			{
				_LeftRightPicker = asNumber(2);
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
			}
			else if((_MiddyCount > 4))
			{
				_LeftRightPicker = asNumber(1);
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
			}
			else
			{
				_LeftRightPicker = asNumber(randomInt(Math.floor(0.5), Math.floor(2.5)));
				propertyChanged("_LeftRightPicker", _LeftRightPicker);
			}
		}
		else
		{
			_LeftRightPicker = asNumber(randomInt(Math.floor(1), Math.floor(3.5)));
			propertyChanged("_LeftRightPicker", _LeftRightPicker);
			trace("" + _LeftRightPicker);
		}
		_customEvent_SideSwitcher();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_SideSwitcher():Void
	{
		trace("" + "SideSwitcher Begins");
		if((_LeftRightPicker == 1))
		{
			if((_LeftSideCounter > 2))
			{
				trace("" + "1");
				_customEvent_SideChooser();
				return;
			}
			else
			{
				_LeftSideCounter = asNumber((_LeftSideCounter + 1));
				propertyChanged("_LeftSideCounter", _LeftSideCounter);
				_MidSideCounter = asNumber(0);
				propertyChanged("_MidSideCounter", _MidSideCounter);
				_RightSideCounter = asNumber(0);
				propertyChanged("_RightSideCounter", _RightSideCounter);
				_customEvent_CardPlacer();
			}
		}
		else if((_LeftRightPicker == 2))
		{
			if((_MidSideCounter > 2))
			{
				trace("" + "2");
				_customEvent_SideChooser();
				return;
			}
			else
			{
				_LeftSideCounter = asNumber(0);
				propertyChanged("_LeftSideCounter", _LeftSideCounter);
				_MidSideCounter = asNumber((_MidSideCounter + 1));
				propertyChanged("_MidSideCounter", _MidSideCounter);
				_RightSideCounter = asNumber(0);
				propertyChanged("_RightSideCounter", _RightSideCounter);
				_customEvent_CardPlacer();
			}
		}
		else if((_LeftRightPicker == 3))
		{
			if((_RightSideCounter > 2))
			{
				trace("" + "3");
				_customEvent_SideChooser();
				return;
			}
			else
			{
				_LeftSideCounter = asNumber(0);
				propertyChanged("_LeftSideCounter", _LeftSideCounter);
				_MidSideCounter = asNumber(0);
				propertyChanged("_MidSideCounter", _MidSideCounter);
				_RightSideCounter = asNumber((_RightSideCounter + 1));
				propertyChanged("_RightSideCounter", _RightSideCounter);
				_customEvent_CardPlacer();
			}
		}
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_CardPlacer():Void
	{
		trace("" + "CardPlacer Begins");
		/* LeftRightPicker: 1=left; 2=right. */
		if((_LeftRightPicker == 1))
		{
			_LeftyCount = asNumber((_LeftyCount + 1));
			propertyChanged("_LeftyCount", _LeftyCount);
			_Match.setX(_XPos1);
			_MatchFPos = asNumber(randomInt(Math.floor(0), Math.floor(1)));
			propertyChanged("_MatchFPos", _MatchFPos);
			if((_MatchFPos == 0))
			{
				_NoMatch.setX(_Xpos2);
				_NoMatch2.setX(_Xpos3);
			}
			else
			{
				_NoMatch2.setX(_Xpos2);
				_NoMatch.setX(_Xpos3);
			}
		}
		else if((_LeftRightPicker == 2))
		{
			_MiddyCount = asNumber((_MiddyCount + 1));
			propertyChanged("_MiddyCount", _MiddyCount);
			_Match.setX(_Xpos2);
			_MatchFPos = asNumber(randomInt(Math.floor(0), Math.floor(1)));
			propertyChanged("_MatchFPos", _MatchFPos);
			if((_MatchFPos == 0))
			{
				_NoMatch.setX(_XPos1);
				_NoMatch2.setX(_Xpos3);
			}
			else
			{
				_NoMatch2.setX(_XPos1);
				_NoMatch.setX(_Xpos3);
			}
		}
		else if((_LeftRightPicker == 3))
		{
			_RightyCount = asNumber((_RightyCount + 1));
			propertyChanged("_RightyCount", _RightyCount);
			_Match.setX(_Xpos3);
			_MatchFPos = asNumber(randomInt(Math.floor(0), Math.floor(1)));
			propertyChanged("_MatchFPos", _MatchFPos);
			if((_MatchFPos == 0))
			{
				_NoMatch.setX(_XPos1);
				_NoMatch2.setX(_Xpos2);
			}
			else
			{
				_NoMatch2.setX(_XPos1);
				_NoMatch.setX(_Xpos2);
			}
		}
		runLater(1000 * .25, function(timeTask:TimedTask):Void
		{
			_NoMatch2.enableActorDrawing();
			_NoMatch.enableActorDrawing();
			_Match.enableActorDrawing();
			_NoMatch2.growTo(125/100, 125/100, .05, Linear.easeNone);
			_NoMatch.growTo(125/100, 125/100, .05, Linear.easeNone);
			_Match.growTo(125/100, 125/100, .05, Linear.easeNone);
			runLater(1000 * .25, function(timeTask:TimedTask):Void
			{
				_NoMatch2.growTo(100/100, 100/100, .025, Linear.easeNone);
				_NoMatch.growTo(100/100, 100/100, .025, Linear.easeNone);
				_Match.growTo(100/100, 100/100, .025, Linear.easeNone);
			}, null);
		}, null);
		Engine.engine.setGameAttribute("MatchPushable", true);
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
		nameMap.set("ATTLIST", "_ATTLIST");
		nameMap.set("NumberGetters", "_NumberGetters");
		_NumberGetters = [1.0, 2.0, 3.0, 4.0];
		nameMap.set("ColorsGetters", "_ColorsGetters");
		_ColorsGetters = ["Brown", "Pink", "Purple", "Orange"];
		nameMap.set("ACC_MF2", "_ACCMF2");
		_ACCMF2 = 0.0;
		nameMap.set("1X", "_1X");
		_1X = 0.0;
		nameMap.set("2X", "_2X");
		_2X = 0.0;
		nameMap.set("3X", "_3X");
		_3X = 0.0;
		nameMap.set("ChooseColorTarget", "_ChooseColorTarget");
		_ChooseColorTarget = "";
		nameMap.set("ChooseColorMatch", "_ChooseColorMatch");
		_ChooseColorMatch = "";
		nameMap.set("ChooseColorNoMatch", "_ChooseColorNoMatch");
		_ChooseColorNoMatch = "";
		nameMap.set("NoMatch2", "_NoMatch2");
		nameMap.set("ChooseColorNoMatch2", "_ChooseColorNoMatch2");
		_ChooseColorNoMatch2 = "";
		nameMap.set("ASC_MF2", "_ASCMF2");
		_ASCMF2 = 0.0;
		nameMap.set("TargetShape", "_TargetShape");
		_TargetShape = "";
		nameMap.set("MatchShape", "_MatchShape");
		_MatchShape = "";
		nameMap.set("MatchFalseShape", "_MatchFalseShape");
		_MatchFalseShape = "";
		nameMap.set("MatchFalse2Shape", "_MatchFalse2Shape");
		_MatchFalse2Shape = "";
		nameMap.set("ChooseShapeTarget", "_ChooseShapeTarget");
		_ChooseShapeTarget = "";
		nameMap.set("ChooseShapeMatch", "_ChooseShapeMatch");
		_ChooseShapeMatch = "";
		nameMap.set("ChooseShapeNoMatch", "_ChooseShapeNoMatch");
		_ChooseShapeNoMatch = "";
		nameMap.set("ChooseShapeNoMatch2", "_ChooseShapeNoMatch2");
		_ChooseShapeNoMatch2 = "";
		nameMap.set("04getter", "_04getter");
		_04getter = 0.0;
		nameMap.set("ANC_T", "_ANCT");
		_ANCT = 0.0;
		nameMap.set("ANC_MF2", "_ANCMF2");
		_ANCMF2 = 0.0;
		nameMap.set("ANC_M", "_ANCM");
		_ANCM = 0.0;
		nameMap.set("ANC_MF", "_ANCMF");
		_ANCMF = 0.0;
		nameMap.set("XPos1", "_XPos1");
		_XPos1 = 0.0;
		nameMap.set("Xpos2", "_Xpos2");
		_Xpos2 = 0.0;
		nameMap.set("Xpos3", "_Xpos3");
		_Xpos3 = 0.0;
		nameMap.set("MiddyCount", "_MiddyCount");
		_MiddyCount = 0.0;
		nameMap.set("MidSideCounter", "_MidSideCounter");
		_MidSideCounter = 0.0;
		nameMap.set("MatchFPos", "_MatchFPos");
		_MatchFPos = 0.0;
		nameMap.set("LRMorderPicker", "_LRMorderPicker");
		_LRMorderPicker = 0.0;
		nameMap.set("Matchable", "_Matchable");
		_Matchable = false;
		nameMap.set("CurrentRule", "_CurrentRule");
		_CurrentRule = "";
		nameMap.set("RuleShapePick", "_RuleShapePick");
		_RuleShapePick = false;
		nameMap.set("RuleColorPick", "_RuleColorPick");
		_RuleColorPick = false;
		nameMap.set("RuleNumberPick", "_RuleNumberPick");
		_RuleNumberPick = false;
		nameMap.set("RuleNumTimesShape", "_RuleNumTimesShape");
		_RuleNumTimesShape = 0.0;
		nameMap.set("RuleNumTimesColor", "_RuleNumTimesColor");
		_RuleNumTimesColor = 0.0;
		nameMap.set("RuleNumTimesNumber", "_RuleNumTimesNumber");
		_RuleNumTimesNumber = 0.0;
		
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
		Engine.engine.setGameAttribute("L21TotalNum", (Engine.engine.getGameAttribute("L21TotalNum") + 1));
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Item = new Array<Dynamic>();
			propertyChanged("_Item", _Item);
			_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
			_Item[Std.int(1)] = Engine.engine.getGameAttribute("L21TotalNum");
			_Item[Std.int(2)] = (("" + (("" + Date.now().getHours()) + ("" + ":"))) + ("" + (("" + (("" + Date.now().getMinutes()) + ("" + ":"))) + ("" + Date.now().getSeconds()))));
			Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("L21TotalNum"))] = _Item;
		}, null);
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("LevelNumber", 21);
		/* LeftyCount will count how many times the match is on the left side of the screen. Once it gets to 5, the program will not let the random side become left again, in order to balance the sides. (same w/ Right) */
		_Matchable = false;
		propertyChanged("_Matchable", _Matchable);
		_RightyCount = asNumber(0);
		propertyChanged("_RightyCount", _RightyCount);
		_MiddyCount = asNumber(0);
		propertyChanged("_MiddyCount", _MiddyCount);
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
		/* create the NONmatch2 */
		createRecycledActor(getActorType(247), Engine.engine.getGameAttribute("MatchX"), Engine.engine.getGameAttribute("MatchY"), Script.FRONT);
		_NoMatch2 = getLastCreatedActor();
		propertyChanged("_NoMatch2", _NoMatch2);
		_NoMatch2.disableActorDrawing();
		trace("" + "created01 Done");
		/* LRMorderPicker determines if match is Left, Right, or Middle. */
		_LRMorderPicker = asNumber(0);
		propertyChanged("_LRMorderPicker", _LRMorderPicker);
		_XPos1 = asNumber(((((getScreenWidth() - (.1 * getScreenWidth())) / 2) - ((_Match.getWidth()) * 1.25)) + ((.1 * getScreenWidth()) / 2)));
		propertyChanged("_XPos1", _XPos1);
		_Xpos2 = asNumber((((getScreenWidth() - (.1 * getScreenWidth())) / 2) + ((.1 * getScreenWidth()) / 2)));
		propertyChanged("_Xpos2", _Xpos2);
		_Xpos3 = asNumber(((((getScreenWidth() - (.1 * getScreenWidth())) / 2) + ((_Match.getWidth()) * 1.25)) + ((.1 * getScreenWidth()) / 2)));
		propertyChanged("_Xpos3", _Xpos3);
		/* The following booleans are designed to pick rules, so that a rule isn't repeated. */
		_RuleShapePick = true;
		propertyChanged("_RuleShapePick", _RuleShapePick);
		_RuleColorPick = true;
		propertyChanged("_RuleColorPick", _RuleColorPick);
		_RuleNumberPick = true;
		propertyChanged("_RuleNumberPick", _RuleNumberPick);
		trace("" + "Created01 Finished");
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("MatchPushable", false);
		_Matchyvalue = asNumber(30);
		propertyChanged("_Matchyvalue", _Matchyvalue);
		Engine.engine.setGameAttribute("FalseLeewayBoolGA", false);
		Engine.engine.setGameAttribute("FalseLeewayGA", 0);
		trace("" + "Created02 Finished");
		_customEvent_RuleChooser();
		
		/* ============================ Click ============================= */
		addMousePressedListener(function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				trace("" + "Click on Target Begins");
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
						_customEvent_SideChooser();
					}
				}
			}
		});
		
		/* ============================ Click ============================= */
		addMousePressedListener(function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("MatchPushable") == true))
				{
					if((_NoMatch.isMouseDown() || _NoMatch2.isMouseDown()))
					{
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
										_NoMatch2.setY(_Matchyvalue);
										_NoMatch2.disableActorDrawing();
									}
									else if((_LeftRightPicker == 2))
									{
										_NoMatch.setY(_Matchyvalue);
										_NoMatch.disableActorDrawing();
										_NoMatch2.setY(_Matchyvalue);
										_NoMatch2.disableActorDrawing();
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
										_NoMatch2.setY(_Matchyvalue);
										_NoMatch2.disableActorDrawing();
									}
									else if((_LeftRightPicker == 2))
									{
										_NoMatch.setY(_Matchyvalue);
										_NoMatch.disableActorDrawing();
										_NoMatch2.setY(_Matchyvalue);
										_NoMatch2.disableActorDrawing();
									}
									_NoMatchRed = false;
									propertyChanged("_NoMatchRed", _NoMatchRed);
								}
							}, null);
						}, null);
						_NoMatch2.disableActorDrawing();
						_NoMatch.disableActorDrawing();
						_Match.disableActorDrawing();
						_Target.disableActorDrawing();
						_NoMatch2.setX(1200);
						_NoMatch.setX(-1200);
						_Match.setX(-1200);
						_NPE = asNumber((_TotalWrong - _PE));
						propertyChanged("_NPE", _NPE);
						_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
						_Item[Std.int(1)] = Engine.engine.getGameAttribute("L21TotalNum");
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
						Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("L21TotalNum"))] = _Item;
						if((_counter == 100))
						{
							switchScene(GameModel.get().scenes.get(46).getID(), null, createCrossfadeTransition(.25));
						}
						else
						{
							runLater(1000 * .5, function(timeTask:TimedTask):Void
							{
								_Target.clearFilters();
								_customEvent_RuleChooser2();
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
			}
		});
		
		/* ============================ Click ============================= */
		addMousePressedListener(function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(_Match.isMousePressed())
				{
					if((Engine.engine.getGameAttribute("MatchPushable") == true))
					{
						trace("" + "Correct!!!!!!!!!!!!");
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
										_NoMatch2.setY(_Matchyvalue);
										_NoMatch2.disableActorDrawing();
									}
									else if((_LeftRightPicker == 2))
									{
										_Match.setY(_Matchyvalue);
										_Match.disableActorDrawing();
										_NoMatch2.setY(_Matchyvalue);
										_NoMatch2.disableActorDrawing();
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
										_NoMatch2.setY(_Matchyvalue);
										_NoMatch2.disableActorDrawing();
									}
									else if((_LeftRightPicker == 2))
									{
										_Match.setY(_Matchyvalue);
										_Match.disableActorDrawing();
										_NoMatch2.setY(_Matchyvalue);
										_NoMatch2.disableActorDrawing();
									}
									_NoMatchRed = false;
									propertyChanged("_NoMatchRed", _NoMatchRed);
								}
							}, null);
						}, null);
						_NoMatch2.disableActorDrawing();
						_NoMatch.disableActorDrawing();
						_Match.disableActorDrawing();
						_Target.disableActorDrawing();
						_NoMatch2.setX(1200);
						_NoMatch.setX(-1200);
						_Match.setX(-1200);
						/* This used to go to the If/Then statement "IF REMAINDER OF CONS.... */
						_NPE = asNumber((_TotalWrong - _PE));
						propertyChanged("_NPE", _NPE);
						_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
						_Item[Std.int(1)] = Engine.engine.getGameAttribute("L21TotalNum");
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
						Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("L21TotalNum"))] = _Item;
						trace("" + (("" + "Consecutive Right Counter = ") + ("" + _ConsecutiveRightCounter)));
						trace("" + (("" + "Rule Switch Count = ") + ("" + _RuleSwitchCount)));
						trace("" + (("" + "0") + ("" + "0")));
						if(((_ConsecutiveRightCounter % 10) == 0))
						{
							if((_RuleSwitchCount == 0))
							{
								_TtCFC = asNumber(_counter);
								propertyChanged("_TtCFC", _TtCFC);
							}
							_RuleSwitchCount = asNumber((_RuleSwitchCount + 1));
							propertyChanged("_RuleSwitchCount", _RuleSwitchCount);
							_Item[Std.int(12)] = _RuleSwitchCount;
							if((_RuleSwitchCount == 4))
							{
								switchScene(GameModel.get().scenes.get(46).getID(), null, createCrossfadeTransition(.25));
							}
							else
							{
								runLater(1000 * .5, function(timeTask:TimedTask):Void
								{
									_Target.clearFilters();
									_customEvent_RuleChooser();
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
						else
						{
							runLater(1000 * .5, function(timeTask:TimedTask):Void
							{
								_Target.clearFilters();
								_customEvent_RuleChooser2();
								runLater(1000 * .1, function(timeTask:TimedTask):Void
								{
									Engine.engine.setGameAttribute("TargetPush", true);
								}, null);
							}, null);
						}
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
				g.drawString("" + (Engine.engine.getGameAttribute("L21Date").length - 1), 0, 5);
				g.setFont(getFont(102));
				g.drawString("" + "Trial: ", 0, 50);
				g.setFont(getFont(101));
				g.drawString("" + (Engine.engine.getGameAttribute("LevelTrial") + 1), 0, 50);
				g.setFont(getFont(102));
				g.drawString("" + "Rule:", 0, 90);
				g.setFont(getFont(102));
				g.drawString("" + _CurrentRule, 0, 105);
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