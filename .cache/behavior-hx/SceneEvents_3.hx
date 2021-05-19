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



class SceneEvents_3 extends SceneScript
{
	public var _Small:String;
	public var _Medium:String;
	public var _Large:String;
	public var _Item:Array<Dynamic>;
	public var _SmallCounter:Float;
	public var _PercentRight:Float;
	public var _counter:Float;
	public var _DateHolder:String;
	public var _BigButton:Actor;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_WaitForFalse():Void
	{
		if(((Engine.engine.getGameAttribute("WaitingForFalse") : Bool) == false))
		{
			Engine.engine.setGameAttribute("WaitingForFalse", true);
			runLater(1000 * 1.5, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("Level03Falser", true);
				Engine.engine.setGameAttribute("WaitingForFalse", false);
			}, null);
		}
	}
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Small", "_Small");
		nameMap.set("Medium", "_Medium");
		nameMap.set("Large", "_Large");
		nameMap.set("Item", "_Item");
		nameMap.set("SmallCounter", "_SmallCounter");
		_SmallCounter = 0.0;
		nameMap.set("PercentRight", "_PercentRight");
		_PercentRight = 0.0;
		nameMap.set("counter", "_counter");
		_counter = 0.0;
		nameMap.set("DateHolder", "_DateHolder");
		_DateHolder = "";
		nameMap.set("BigButton", "_BigButton");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
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
		Engine.engine.setGameAttribute("L02TotalNum", ((Engine.engine.getGameAttribute("L02TotalNum") : Float) + 1));
		runLater(1000 * .1, function(timeTask:TimedTask):Void
		{
			_Item = new Array<Dynamic>();
			_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (","))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (","))))) + ("" + Date.now().getDate()))) + (","))) + ("" + Date.now().getFullYear()));
			_Item[1] = (Engine.engine.getGameAttribute("L02TotalNum") : Float);
			_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
			(Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L02TotalNum") : Float))] = _Item;
		}, null);
		
		/* ======================== When Creating ========================= */
		_PercentRight = 0;
		Engine.engine.setGameAttribute("Level03FalseLeewayGA", 0);
		Engine.engine.setGameAttribute("Level03FalseLeewayBool", false);
		Engine.engine.setGameAttribute("Level03Canceler", false);
		Engine.engine.setGameAttribute("WaitingForFalse", false);
		Engine.engine.setGameAttribute("Level03Falser", false);
		_SmallCounter = 0;
		Engine.engine.setGameAttribute("LevelTrial", 0);
		_DateHolder = Date.now().toString();
		for(actorOfType in getActorsOfType(getActorType(0)))
		{
			if(actorOfType != null && !actorOfType.dead && !actorOfType.recycled){
				_BigButton = actorOfType;
			}
		}
		runLater(1000 * 2, function(timeTask:TimedTask):Void
		{
			Engine.engine.setGameAttribute("Level03Falser", true);
		}, null);
		getActor(7).setX((((getScreenWidth() - 60) / 2) - (((.01 * (Engine.engine.getGameAttribute("SmallButtonSize") : Float)) * (getActor(7).getWidth())) / 2)));
		getActor(7).setY(((getScreenHeight() / 2) - (((.01 * (Engine.engine.getGameAttribute("SmallButtonSize") : Float)) * (getActor(7).getHeight())) / 2)));
		Engine.engine.setGameAttribute("Level03CounterFalsie", 0);
		Engine.engine.setGameAttribute("Level03CountFalsie", true);
		trace("Step0");
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("SmallButtonSizer") : Bool) == true))
				{
					getActor(15).enableActorDrawing();
					getActor(14).enableActorDrawing();
					getActor(13).enableActorDrawing();
					getActor(11).enableActorDrawing();
					getActor(7).growTo((Engine.engine.getGameAttribute("SmallButtonSize") : Float)/100, (Engine.engine.getGameAttribute("SmallButtonSize") : Float)/100, .1, Easing.linear);
				}
				if(((Engine.engine.getGameAttribute("SmallButtonSizer") : Bool) == false))
				{
					getActor(11).disableActorDrawing();
					getActor(15).disableActorDrawing();
					getActor(14).disableActorDrawing();
					getActor(13).disableActorDrawing();
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(getActor(7), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				trace("TRUE-01");
				/* This will only work if the button hasn't been pushed yet... */
				if(((Engine.engine.getGameAttribute("Level03Pushed") : Bool) == false))
				{
					trace("PUSHERTRUE-02");
					Engine.engine.setGameAttribute("Level03StopGap", true);
					Engine.engine.setGameAttribute("Level03Falser", false);
					_customEvent_WaitForFalse();
					_PercentRight = (_PercentRight + 1);
					_SmallCounter = (_SmallCounter + 1);
					Engine.engine.setGameAttribute("LevelTrial", ((Engine.engine.getGameAttribute("LevelTrial") : Float) + 1));
					_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (", "))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (" "))))) + ("" + Date.now().getDate()))) + (", "))) + ("" + Date.now().getFullYear()));
					_Item[1] = (Engine.engine.getGameAttribute("L02TotalNum") : Float);
					_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
					_Item[3] = (("" + _PercentRight) + ("0%25Correct"));
					_Item[Std.int(((Engine.engine.getGameAttribute("LevelTrial") : Float) + 3))] = "T";
					(Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L02TotalNum") : Float))] = _Item;
					if((_SmallCounter == 10))
					{
						saveGame("mySave", function(success:Bool):Void
						{
							switchScene(GameModel.get().scenes.get(46).getID(), null, createCrossfadeTransition(.5));
						});
					}
					saveGame("mySave", function(success:Bool):Void
					{
						Engine.engine.setGameAttribute("Level03CounterFalsie", 0);
						Engine.engine.setGameAttribute("Level03CountFalsie", true);
					});
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(getActor(12), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("Level03Falser") : Bool) == true))
				{
					if((getActor(7).isMouseOver() == false))
					{
						Engine.engine.setGameAttribute("Level03Falser", false);
						_customEvent_WaitForFalse();
						_SmallCounter = (_SmallCounter + 1);
						Engine.engine.setGameAttribute("LevelTrial", ((Engine.engine.getGameAttribute("LevelTrial") : Float) + 1));
						_Item[0] = (((((((((((Engine.engine.getGameAttribute("day") : String)) + (", "))) + ((((Engine.engine.getGameAttribute("Month") : String)) + (" "))))) + ("" + Date.now().getDate()))) + (", "))) + ("" + Date.now().getFullYear()));
						_Item[1] = (Engine.engine.getGameAttribute("L02TotalNum") : Float);
						_Item[2] = (((("" + Date.now().getHours()) + (":"))) + ((((("" + Date.now().getMinutes()) + (":"))) + ("" + Date.now().getSeconds()))));
						_Item[3] = (("" + _PercentRight) + ("0%25Correct"));
						_Item[Std.int(((Engine.engine.getGameAttribute("LevelTrial") : Float) + 3))] = "F";
						(Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("L02TotalNum") : Float))] = _Item;
						if((_SmallCounter == 10))
						{
							saveGame("mySave", function(success:Bool):Void
							{
								switchScene(GameModel.get().scenes.get(46).getID(), null, createCrossfadeTransition(.5));
							});
						}
					}
				}
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("ONE", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				trace((Engine.engine.getGameAttribute("L02TotalNum") : Float));
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}