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



class SceneEvents_36 extends SceneScript
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
	public var _Matchable:Bool;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ChooseTarget():Void
	{
		/* We first need to determine if the target is going to be a moon or a club. */
		if((_ClubPicker <= 4))
		{
			if((_MoonPicker <= 4))
			{
				_TargetChooser = asNumber(randomInt(Math.floor(1), Math.floor(2)));
				propertyChanged("_TargetChooser", _TargetChooser);
			}
			else
			{
				_TargetChooser = asNumber(1);
				propertyChanged("_TargetChooser", _TargetChooser);
			}
		}
		else
		{
			_TargetChooser = asNumber(2);
			propertyChanged("_TargetChooser", _TargetChooser);
		}
		if((_TargetChooser == 1))
		{
			_Target.setAnimation("" + "PinkClub01");
			_Match.setAnimation("" + "PinkClub01");
			_NoMatch.setAnimation("" + "PurpleClub01");
			_NoMatchGreen = true;
			propertyChanged("_NoMatchGreen", _NoMatchGreen);
			_ClubPicker = asNumber((_ClubPicker + 1));
			propertyChanged("_ClubPicker", _ClubPicker);
		}
		else if((_TargetChooser == 2))
		{
			_Target.setAnimation("" + "PurpleClub01");
			_Match.setAnimation("" + "PurpleClub01");
			_NoMatch.setAnimation("" + "PinkClub01");
			_NoMatchRed = true;
			propertyChanged("_NoMatchRed", _NoMatchRed);
			_MoonPicker = asNumber((_MoonPicker + 1));
			propertyChanged("_MoonPicker", _MoonPicker);
		}
		_Target.setX(Engine.engine.getGameAttribute("TargetX"));
		_Target.setY(Engine.engine.getGameAttribute("TargetY"));
		_customEvent_ShowTarget();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ShowTarget():Void
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
		_customEvent_SideSwitcher2();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_SideSwitcher2():Void
	{
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
				_Matchable = true;
				propertyChanged("_Matchable", _Matchable);
			}, null);
		}, null);
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
		Engine.engine.setGameAttribute("L12ColSwNEWTotalNum", (Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") + 1));
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Item = new Array<Dynamic>();
			propertyChanged("_Item", _Item);
			_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
			_Item[Std.int(1)] = Engine.engine.getGameAttribute("L12ColSwNEWTotalNum");
			_Item[Std.int(2)] = (("" + (("" + Date.now().getHours()) + ("" + ":"))) + ("" + (("" + (("" + Date.now().getMinutes()) + ("" + ":"))) + ("" + Date.now().getSeconds()))));
			Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("L12ColSwNEWTotalNum"))] = _Item;
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
		_Match = getActor(17);
		propertyChanged("_Match", _Match);
		_PercentRight = asNumber(0);
		propertyChanged("_PercentRight", _PercentRight);
		_counter = asNumber(0);
		propertyChanged("_counter", _counter);
		_Item = new Array<Dynamic>();
		propertyChanged("_Item", _Item);
		Engine.engine.setGameAttribute("LevelTrial", 0);
		/* LeftyCount will count how many times the match is on the left side of the screen. Once it gets to 5, the program will not let the random side become left again, in order to balance the sides. (same w/ Right) */
		_RightyCount = asNumber(0);
		propertyChanged("_RightyCount", _RightyCount);
		_LeftyCount = asNumber(0);
		propertyChanged("_LeftyCount", _LeftyCount);
		/* TrialCounter counts the trial to make sure left/right placement is even */
		_TrialCounter = asNumber(0);
		propertyChanged("_TrialCounter", _TrialCounter);
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
		/* The math below sets up the X coordinates for TWO match cards. */
		Engine.engine.setGameAttribute("MatchX01", ((((getScreenWidth() - (.1 * getScreenWidth())) / 2) + (60 / 2)) + (.1 * getScreenWidth())));
		Engine.engine.setGameAttribute("MatchX02", ((((getScreenWidth() - (.1 * getScreenWidth())) / 2) - ((60 / 2) + (_Match.getWidth()))) + (.1 * getScreenWidth())));
		
		/* ======================== When Creating ========================= */
		_Matchyvalue = asNumber(30);
		propertyChanged("_Matchyvalue", _Matchyvalue);
		Engine.engine.setGameAttribute("FalseLeewayBoolGA", false);
		Engine.engine.setGameAttribute("FalseLeewayGA", 0);
		_customEvent_ChooseTarget();
		
		/* ============================ Click ============================= */
		addMousePressedListener(function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(_Target.isMousePressed())
				{
					if((Engine.engine.getGameAttribute("TargetPush") == true))
					{
						_TrialCounter = asNumber((_TrialCounter + 1));
						propertyChanged("_TrialCounter", _TrialCounter);
						Engine.engine.setGameAttribute("TargetPush", false);
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
					playSound(getSound(57));
					_PercentRight = asNumber((_PercentRight + 1));
					propertyChanged("_PercentRight", _PercentRight);
					_counter = asNumber((_counter + 1));
					propertyChanged("_counter", _counter);
					Engine.engine.setGameAttribute("LevelTrial", (Engine.engine.getGameAttribute("LevelTrial") + 1));
					_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
					_Item[Std.int(1)] = Engine.engine.getGameAttribute("L12ColSwNEWTotalNum");
					_Item[Std.int(2)] = (("" + (("" + Date.now().getHours()) + ("" + ":"))) + ("" + (("" + (("" + Date.now().getMinutes()) + ("" + ":"))) + ("" + Date.now().getSeconds()))));
					_Item[Std.int(3)] = (("" + _PercentRight) + ("" + "0%25Correct"));
					_Item[Std.int((Engine.engine.getGameAttribute("LevelTrial") + 3))] = "T";
					Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("L12ColSwNEWTotalNum"))] = _Item;
					runLater(1000 * .01, function(timeTask:TimedTask):Void
					{
						runLater(1000 * .5, function(timeTask:TimedTask):Void
						{
							if((_NoMatchGreen == true))
							{
								if((_LeftRightPicker == 1))
								{
									
								}
								else if((_LeftRightPicker == 2))
								{
									
								}
								_NoMatchGreen = false;
								propertyChanged("_NoMatchGreen", _NoMatchGreen);
							}
							else if((_NoMatchRed == true))
							{
								if((_LeftRightPicker == 1))
								{
									
								}
								else if((_LeftRightPicker == 2))
								{
									
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
					trace("" + Engine.engine.getGameAttribute("L12Date01"));
					if((_counter == 10))
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
							Engine.engine.setGameAttribute("TargetPush", true);
							_customEvent_ChooseTarget();
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
					_counter = asNumber((_counter + 1));
					propertyChanged("_counter", _counter);
					Engine.engine.setGameAttribute("LevelTrial", (Engine.engine.getGameAttribute("LevelTrial") + 1));
					_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + Engine.engine.getGameAttribute("Month")) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
					_Item[Std.int(1)] = Engine.engine.getGameAttribute("L12ColSwNEWTotalNum");
					_Item[Std.int(2)] = (("" + (("" + Date.now().getHours()) + ("" + ":"))) + ("" + (("" + (("" + Date.now().getMinutes()) + ("" + ":"))) + ("" + Date.now().getSeconds()))));
					_Item[Std.int(3)] = (("" + _PercentRight) + ("" + "0%25Correct"));
					_Item[Std.int((Engine.engine.getGameAttribute("LevelTrial") + 3))] = "F";
					Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("L12ColSwNEWTotalNum"))] = _Item;
					runLater(1000 * .01, function(timeTask:TimedTask):Void
					{
						runLater(1000 * .5, function(timeTask:TimedTask):Void
						{
							if((_NoMatchGreen == true))
							{
								if((_LeftRightPicker == 1))
								{
									
								}
								else if((_LeftRightPicker == 2))
								{
									
								}
								_NoMatchGreen = false;
								propertyChanged("_NoMatchGreen", _NoMatchGreen);
							}
							else if((_NoMatchRed == true))
							{
								if((_LeftRightPicker == 1))
								{
									
								}
								else if((_LeftRightPicker == 2))
								{
									
								}
								_NoMatchRed = false;
								propertyChanged("_NoMatchRed", _NoMatchRed);
							}
						}, null);
					}, null);
					_NoMatch.disableActorDrawing();
					_Match.disableActorDrawing();
					_Target.disableActorDrawing();
					trace("" + "False");
					trace("" + Engine.engine.getGameAttribute("L12Date01"));
					if((_counter == 10))
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
							Engine.engine.setGameAttribute("TargetPush", true);
							_customEvent_ChooseTarget();
						}, null);
					}
				}
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("up", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				trace("" + Engine.engine.getGameAttribute("L12Date01"));
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}