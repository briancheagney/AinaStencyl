package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

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

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
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
				_TargetChooser = randomInt(1, 2);
			}
			else
			{
				_TargetChooser = 1;
			}
		}
		else
		{
			_TargetChooser = 2;
		}
		if((_TargetChooser == 1))
		{
			_Target.setAnimation("PinkClub01");
			_Match.setAnimation("PinkClub01");
			_NoMatch.setAnimation("PurpleClub01");
			_NoMatchGreen = true;
			_ClubPicker = (_ClubPicker + 1);
		}
		else if((_TargetChooser == 2))
		{
			_Target.setAnimation("PurpleClub01");
			_Match.setAnimation("PurpleClub01");
			_NoMatch.setAnimation("PinkClub01");
			_NoMatchRed = true;
			_MoonPicker = (_MoonPicker + 1);
		}
		_Target.setX((Engine.engine.getGameAttribute("TargetX") : Float));
		_Target.setY((Engine.engine.getGameAttribute("TargetY") : Float));
		_customEvent_ShowTarget();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ShowTarget():Void
	{
		trace("fade in now.");
		/* "This shtuff brings up the target card (pops up)" */ _Target.enableActorDrawing();
		_Target.growTo(105/100, 105/100, .075, Easing.linear);
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Target.growTo(100/100, 100/100, .025, Easing.linear);
		}, null);
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_SideSwitcher():Void
	{
		if((_LeftRightPicker == 1))
		{
			_LeftSideCounter = (_LeftSideCounter + 1);
			_RightSideCounter = 0;
		}
		else if((_LeftRightPicker == 2))
		{
			_RightSideCounter = (_RightSideCounter + 1);
			_LeftSideCounter = 0;
		}
		if((_LeftSideCounter > 2))
		{
			_LeftRightPicker = 2;
			_LeftSideCounter = 0;
			_RightSideCounter = (_RightSideCounter + 1);
		}
		else if((_RightSideCounter > 2))
		{
			_LeftRightPicker = 1;
			_RightSideCounter = 0;
			_LeftSideCounter = (_LeftSideCounter + 1);
		}
		_customEvent_SideSwitcher2();
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_SideSwitcher2():Void
	{
		/* LeftRightPicker: 1=left; 2=right. */
		if((_LeftRightPicker == 1))
		{
			_LeftyCount = (_LeftyCount + 1);
			_Match.setX((Engine.engine.getGameAttribute("MatchX01") : Float));
			_NoMatch.setX((Engine.engine.getGameAttribute("MatchX02") : Float));
		}
		else if((_LeftRightPicker == 2))
		{
			_RightyCount = (_RightyCount + 1);
			_Match.setX((Engine.engine.getGameAttribute("MatchX02") : Float));
			_NoMatch.setX((Engine.engine.getGameAttribute("MatchX01") : Float));
		}
		runLater(1000 * .25, function(timeTask:TimedTask):Void
		{
			_NoMatch.enableActorDrawing();
			_Match.enableActorDrawing();
			_NoMatch.growTo(105/100, 105/100, .075, Easing.linear);
			_Match.growTo(105/100, 105/100, .075, Easing.linear);
			runLater(1000 * .05, function(timeTask:TimedTask):Void
			{
				_NoMatch.growTo(100/100, 100/100, .025, Easing.linear);
				_Match.growTo(100/100, 100/100, .025, Easing.linear);
				_Matchable = true;
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
		for(index0 in 0...1)
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
		Engine.engine.setGameAttribute("L12ColSwNEWTotalNum", ((Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") : Float) + 1));
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Item = new Array<Dynamic>();
			_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (", "))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (" "))))) + ("" + Date.now().getDate()))) + (", "))) + ("" + Date.now().getFullYear()));
			_Item[1] = (Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") : Float);
			_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
			(Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") : Float))] = _Item;
		}, null);
		
		/* ======================== When Creating ========================= */
		/* LeftyCount will count how many times the match is on the left side of the screen. Once it gets to 5, the program will not let the random side become left again, in order to balance the sides. (same w/ Right) */
		_Matchable = false;
		_RightyCount = 0;
		_LeftyCount = 0;
		/* TrialCounter counts the trial to make sure left/right placement is even */
		_TrialCounter = 0;
		_Match = getActor(17);
		_PercentRight = 0;
		_counter = 0;
		_Item = new Array<Dynamic>();
		Engine.engine.setGameAttribute("LevelTrial", 0);
		/* LeftyCount will count how many times the match is on the left side of the screen. Once it gets to 5, the program will not let the random side become left again, in order to balance the sides. (same w/ Right) */
		_RightyCount = 0;
		_LeftyCount = 0;
		/* TrialCounter counts the trial to make sure left/right placement is even */
		_TrialCounter = 0;
		_PercentRight = 0;
		_counter = 0;
		_Item = new Array<Dynamic>();
		Engine.engine.setGameAttribute("LevelTrial", 0);
		_DateHolder = Date.now().toString();
		_ClubPicker = 0;
		_MoonPicker = 0;
		/* Create the target */
		createRecycledActor(getActorType(247), (Engine.engine.getGameAttribute("TargetX") : Float), (Engine.engine.getGameAttribute("TargetY") : Float), Script.FRONT);
		_Target = getLastCreatedActor();
		_Target.disableActorDrawing();
		/* create the match */
		createRecycledActor(getActorType(247), (Engine.engine.getGameAttribute("MatchX") : Float), (Engine.engine.getGameAttribute("MatchY") : Float), Script.FRONT);
		_Match = getLastCreatedActor();
		_Match.disableActorDrawing();
		/* create the NONmatch */
		createRecycledActor(getActorType(247), (Engine.engine.getGameAttribute("MatchX") : Float), (Engine.engine.getGameAttribute("MatchY") : Float), Script.FRONT);
		_NoMatch = getLastCreatedActor();
		_NoMatch.disableActorDrawing();
		/* The math below sets up the X coordinates for TWO match cards. */
		Engine.engine.setGameAttribute("MatchX01", ((((getScreenWidth() - (.1 * getScreenWidth())) / 2) + (60 / 2)) + (.1 * getScreenWidth())));
		Engine.engine.setGameAttribute("MatchX02", ((((getScreenWidth() - (.1 * getScreenWidth())) / 2) - ((60 / 2) + (_Match.getWidth()))) + (.1 * getScreenWidth())));
		
		/* ======================== When Creating ========================= */
		_Matchyvalue = 30;
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
					if(((Engine.engine.getGameAttribute("TargetPush") : Bool) == true))
					{
						_TrialCounter = (_TrialCounter + 1);
						Engine.engine.setGameAttribute("TargetPush", false);
						Engine.engine.setGameAttribute("Level05Falser", false);
						/* The black tint ends up greying the card out, to make the match more obvious. */
						_Target.setFilter([createTintFilter(Utils.getColorRGB(0,0,0), (Engine.engine.getGameAttribute("Tint") : Float)/100)]);
						if((_LeftyCount > 4))
						{
							_LeftRightPicker = 2;
						}
						else if((_RightyCount > 4))
						{
							_LeftRightPicker = 1;
						}
						else
						{
							_LeftRightPicker = randomInt(1, 2);
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
					playSound(getSound(57));
					_PercentRight = (_PercentRight + 1);
					_counter = (_counter + 1);
					Engine.engine.setGameAttribute("LevelTrial", ((Engine.engine.getGameAttribute("LevelTrial") : Float) + 1));
					_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (", "))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (" "))))) + ("" + Date.now().getDate()))) + (", "))) + ("" + Date.now().getFullYear()));
					_Item[1] = (Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") : Float);
					_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
					_Item[3] = (("" + _PercentRight) + ("0%25Correct"));
					_Item[Std.int(((Engine.engine.getGameAttribute("LevelTrial") : Float) + 3))] = "T";
					(Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") : Float))] = _Item;
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
							}
						}, null);
					}, null);
					_NoMatch.disableActorDrawing();
					_Match.disableActorDrawing();
					_Target.disableActorDrawing();
					_NoMatch.setX(-1200);
					_Match.setX(-1200);
					trace("True");
					trace((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>));
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
					_counter = (_counter + 1);
					Engine.engine.setGameAttribute("LevelTrial", ((Engine.engine.getGameAttribute("LevelTrial") : Float) + 1));
					_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (", "))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (" "))))) + ("" + Date.now().getDate()))) + (", "))) + ("" + Date.now().getFullYear()));
					_Item[1] = (Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") : Float);
					_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
					_Item[3] = (("" + _PercentRight) + ("0%25Correct"));
					_Item[Std.int(((Engine.engine.getGameAttribute("LevelTrial") : Float) + 3))] = "F";
					(Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") : Float))] = _Item;
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
							}
						}, null);
					}, null);
					_NoMatch.disableActorDrawing();
					_Match.disableActorDrawing();
					_Target.disableActorDrawing();
					trace("False");
					trace((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>));
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
				trace((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>));
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}