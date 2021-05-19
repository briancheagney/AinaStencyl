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



class SceneEvents_8 extends SceneScript
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
	public var _PercentRight:Float;
	public var _counter:Float;
	public var _Item:Array<Dynamic>;
	public var _DateHolder:String;
	public var _False:Actor;
	
	
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
		nameMap.set("PercentRight", "_PercentRight");
		_PercentRight = 0.0;
		nameMap.set("counter", "_counter");
		_counter = 0.0;
		nameMap.set("Item", "_Item");
		nameMap.set("DateHolder", "_DateHolder");
		_DateHolder = "";
		nameMap.set("False", "_False");
		
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
		Engine.engine.setGameAttribute("L04TotalNum", ((Engine.engine.getGameAttribute("L04TotalNum") : Float) + 1));
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Item = new Array<Dynamic>();
			_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (", "))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (" "))))) + ("" + Date.now().getDate()))) + (", "))) + ("" + Date.now().getFullYear()));
			_Item[1] = (Engine.engine.getGameAttribute("L04TotalNum") : Float);
			_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
			(Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L04TotalNum") : Float))] = _Item;
		}, null);
		
		/* ======================== When Creating ========================= */
		_PercentRight = 0;
		_counter = 0;
		_Item = new Array<Dynamic>();
		Engine.engine.setGameAttribute("LevelTrial", 0);
		_DateHolder = Date.now().toString();
		_False = getActor(13);
		
		/* ======================== When Creating ========================= */
		createRecycledActorOnLayer(getActorType(245), (Engine.engine.getGameAttribute("TargetX") : Float), (Engine.engine.getGameAttribute("TargetY") : Float), engine.getLayerById(2));
		_Target = getLastCreatedActor();
		_Target.setAnimation(("" + "NullClub"));
		createRecycledActorOnLayer(getActorType(245), (Engine.engine.getGameAttribute("MatchX") : Float), (Engine.engine.getGameAttribute("MatchY") : Float), engine.getLayerById(2));
		_Match = getLastCreatedActor();
		_Match.setAnimation(("" + "NullClub"));
		Engine.engine.setGameAttribute("Level04ActorAnim", 1);
		Engine.engine.setGameAttribute("Level04Canceler", false);
		Engine.engine.setGameAttribute("Level04Truable", true);
		Engine.engine.setGameAttribute("Level04Dingable", true);
		Engine.engine.setGameAttribute("Level4Falser", false);
		Engine.engine.setGameAttribute("FalseLeewayBoolGA", false);
		Engine.engine.setGameAttribute("FalseLeewayGA", 0);
		_FalseLeewayBool = false;
		_FalseLeeway = 0;
		_Target.disableActorDrawing();
		_Match.disableActorDrawing();
		_Target.growTo(95/100, 95/100, 0, Easing.linear);
		_Match.growTo(95/100, 95/100, 0, Easing.linear);
		_Target.setAnimation(("" + "NullClub"));
		
		/* ======================= After N seconds ======================== */
		runLater(1000 * 1, function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				trace("fade in now.");
				_Target.setAnimation(("" + "NullClub"));
				_Target.enableActorDrawing();
				_Target.growTo((Engine.engine.getGameAttribute("ButtonGrowPercentBig") : Float)/100, (Engine.engine.getGameAttribute("ButtonGrowPercentBig") : Float)/100, (Engine.engine.getGameAttribute("ButtonGrowTimer") : Float), Easing.linear);
				runLater(1000 * .1, function(timeTask:TimedTask):Void
				{
					_Target.growTo(100/100, 100/100, (Engine.engine.getGameAttribute("ButtonGrowTimer") : Float), Easing.linear);
					_Target.setAnimation("00Club");
				}, null);
			}
		}, null);
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(_Target, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				_Target.setAnimation(("" + "NullClub"));
				if(((Engine.engine.getGameAttribute("TargetPush") : Bool) == true))
				{
					Engine.engine.setGameAttribute("TargetPush", false);
					Engine.engine.setGameAttribute("Level4Falser", false);
					_Target.setFilter([createTintFilter(Utils.getColorRGB(0,0,0), (Engine.engine.getGameAttribute("Tint") : Float)/100)]);
					runLater(1000 * .25, function(timeTask:TimedTask):Void
					{
						_Match.enableActorDrawing();
						_Match.growTo(125/100, 125/100, .05, Easing.linear);
						runLater(1000 * .05, function(timeTask:TimedTask):Void
						{
							_Match.growTo(100/100, 100/100, .025, Easing.linear);
						}, null);
					}, null);
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(_Target, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("FalseLeewayBoolGA") : Bool) == false))
				{
					Engine.engine.setGameAttribute("FalseLeewayBoolGA", true);
					runPeriodically(1000 * 1, function(timeTask:TimedTask):Void
					{
						Engine.engine.setGameAttribute("FalseLeewayGA", ((Engine.engine.getGameAttribute("FalseLeewayGA") : Float) + 1));
						/* The following "FalseLeewayGA" variable is the number of seconds it will take before you can register a false match. This is so that if Roscoe double-taps, it won't register as a negative. */
						if(((Engine.engine.getGameAttribute("FalseLeewayGA") : Float) == 3))
						{
							Engine.engine.setGameAttribute("Level4Falser", true);
							timeTask.repeats = false;
							return;
						}
						if(((Engine.engine.getGameAttribute("Level04Canceler") : Bool) == true))
						{
							timeTask.repeats = false;
							return;
						}
					}, null);
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(_Match, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				playSound(getSound(57));
				_Target.setAnimation(("" + "NullClub"));
				Engine.engine.setGameAttribute("FalseLeewayBoolGA", false);
				Engine.engine.setGameAttribute("FalseLeewayGA", 0);
				if(((Engine.engine.getGameAttribute("Level04Truable") : Bool) == true))
				{
					Engine.engine.setGameAttribute("Level04Canceler", true);
					Engine.engine.setGameAttribute("Level04Truable", false);
					_PercentRight = (_PercentRight + 1);
					_counter = (_counter + 1);
					Engine.engine.setGameAttribute("LevelTrial", ((Engine.engine.getGameAttribute("LevelTrial") : Float) + 1));
					_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (", "))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (" "))))) + ("" + Date.now().getDate()))) + (", "))) + ("" + Date.now().getFullYear()));
					_Item[1] = (Engine.engine.getGameAttribute("L04TotalNum") : Float);
					_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
					_Item[3] = (("" + _PercentRight) + ("0%25Correct"));
					_Item[Std.int(((Engine.engine.getGameAttribute("LevelTrial") : Float) + 3))] = "T";
					(Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L04TotalNum") : Float))] = _Item;
					trace("True");
					trace((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>));
					if((_counter == 10))
					{
						recycleActor(_Target);
						recycleActor(_Match);
						switchScene(GameModel.get().scenes.get(46).getID(), null, createCrossfadeTransition(.5));
					}
					saveGame("mySave", function(success:Bool):Void
					{
						
					});
				}
				runLater(1000 * .25, function(timeTask:TimedTask):Void
				{
					_Target.disableActorDrawing();
					_Target.growTo(0/100, 0/100, 0, Easing.linear);
					_Match.growTo(0/100, 0/100, 0, Easing.linear);
					_Target.clearFilters();
					_tint = 0;
					if(((Engine.engine.getGameAttribute("Level04ActorAnim") : Float) == 1))
					{
						Engine.engine.setGameAttribute("Level04ActorAnim", 2);
					}
					else if(((Engine.engine.getGameAttribute("Level04ActorAnim") : Float) == 2))
					{
						Engine.engine.setGameAttribute("Level04ActorAnim", 1);
					}
				}, null);
				runLater(1000 * 1, function(timeTask:TimedTask):Void
				{
					_Target.enableActorDrawing();
					_Target.growTo(125/100, 125/100, .1, Easing.linear);
					runLater(1000 * .1, function(timeTask:TimedTask):Void
					{
						_Target.growTo(100/100, 100/100, .05, Easing.linear);
						Engine.engine.setGameAttribute("Level04Canceler", false);
						Engine.engine.setGameAttribute("TargetPush", true);
						Engine.engine.setGameAttribute("Level04Truable", true);
						Engine.engine.setGameAttribute("Level04Dingable", true);
					}, null);
				}, null);
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(getActor(13), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				_Target.setAnimation(("" + "NullClub"));
				if(((Engine.engine.getGameAttribute("Level4Falser") : Bool) == true))
				{
					if((_Match.isMouseOver() == false))
					{
						if(((Engine.engine.getGameAttribute("TargetPush") : Bool) == false))
						{
							Engine.engine.setGameAttribute("Level04Canceler", true);
							Engine.engine.setGameAttribute("FalseLeewayBoolGA", false);
							Engine.engine.setGameAttribute("FalseLeewayGA", 0);
							Engine.engine.setGameAttribute("Level4Falser", false);
							Engine.engine.setGameAttribute("Level04Truable", false);
							Engine.engine.setGameAttribute("Level04Dingable", false);
							_counter = (_counter + 1);
							Engine.engine.setGameAttribute("LevelTrial", ((Engine.engine.getGameAttribute("LevelTrial") : Float) + 1));
							_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (", "))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (" "))))) + ("" + Date.now().getDate()))) + (", "))) + ("" + Date.now().getFullYear()));
							_Item[1] = (Engine.engine.getGameAttribute("L04TotalNum") : Float);
							_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
							_Item[3] = (("" + _PercentRight) + ("0%25Correct"));
							_Item[Std.int(((Engine.engine.getGameAttribute("LevelTrial") : Float) + 3))] = "F";
							(Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L04TotalNum") : Float))] = _Item;
							trace("False");
							trace((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>));
							if((_counter == 10))
							{
								recycleActor(_Target);
								recycleActor(_Match);
								switchScene(GameModel.get().scenes.get(46).getID(), null, createCrossfadeTransition(.5));
							}
							else
							{
								runLater(1000 * .5, function(timeTask:TimedTask):Void
								{
									_Target.disableActorDrawing();
									_Match.disableActorDrawing();
									_Target.growTo(0/100, 0/100, 0, Easing.linear);
									_Match.growTo(0/100, 0/100, 0, Easing.linear);
									_Target.clearFilters();
									runLater(1000 * 1, function(timeTask:TimedTask):Void
									{
										_Target.enableActorDrawing();
										_Target.growTo(125/100, 125/100, .1, Easing.linear);
										runLater(1000 * .1, function(timeTask:TimedTask):Void
										{
											_Target.growTo(100/100, 100/100, .05, Easing.linear);
											Engine.engine.setGameAttribute("TargetPush", true);
											Engine.engine.setGameAttribute("Level4Falser", true);
											Engine.engine.setGameAttribute("Level04Truable", true);
											Engine.engine.setGameAttribute("Level04Dingable", true);
											Engine.engine.setGameAttribute("FalseLeewayBoolGA", false);
											Engine.engine.setGameAttribute("FalseLeewayGA", 0);
											Engine.engine.setGameAttribute("Level04Canceler", false);
										}, null);
									}, null);
								}, null);
							}
						}
					}
					saveGame("mySave", function(success:Bool):Void
					{
						
					});
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}