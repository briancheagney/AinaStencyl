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



class Design_208_208_02SmallSaver extends SceneScript
{
	public var _PercentRight:Float;
	public var _SmallCounter:Float;
	public var _Item:Array<Dynamic>;
	public var _DateHolder:String;
	public var _BigButton:Actor;
	public var _False:Actor;
	public var _Button:Actor;
	public var _counter:Float;
	public var _Month:String;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("PercentRight", "_PercentRight");
		_PercentRight = 0.0;
		nameMap.set("SmallCounter", "_SmallCounter");
		_SmallCounter = 0.0;
		nameMap.set("Item", "_Item");
		_Item = ["test"];
		nameMap.set("DateHolder", "_DateHolder");
		_DateHolder = "";
		nameMap.set("BigButton", "_BigButton");
		nameMap.set("False", "_False");
		nameMap.set("Button", "_Button");
		nameMap.set("counter", "_counter");
		_counter = 0.0;
		nameMap.set("Month", "_Month");
		_Month = "";
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_PercentRight = 0;
		Engine.engine.setGameAttribute("Level03FalseLeewayGA", 0);
		Engine.engine.setGameAttribute("Level03FalseLeewayBool", false);
		Engine.engine.setGameAttribute("Level03Canceler", false);
		Engine.engine.setGameAttribute("Level03Falser", true);
		_SmallCounter = 0;
		_Item = new Array<Dynamic>();
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
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(_False, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("Level03Pushed") : Bool) == false))
				{
					if(((Engine.engine.getGameAttribute("Level03Falser") : Bool) == true))
					{
						if((_BigButton.isMouseOver() == false))
						{
							Engine.engine.setGameAttribute("Level03Falser", false);
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
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}