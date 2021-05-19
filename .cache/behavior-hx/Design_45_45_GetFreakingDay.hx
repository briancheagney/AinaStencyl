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



class Design_45_45_GetFreakingDay extends ActorScript
{
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		
	}
	
	override public function init()
	{
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((Date.now().getMonth() == 0))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 6);
				}
				else if((Date.now().getMonth() == 1))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 2);
				}
				else if((Date.now().getMonth() == 2))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 2);
				}
				else if((Date.now().getMonth() == 3))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 5);
				}
				else if((Date.now().getMonth() == 4))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 0);
				}
				else if((Date.now().getMonth() == 5))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 3);
				}
				else if((Date.now().getMonth() == 6))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 5);
				}
				else if((Date.now().getMonth() == 7))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 1);
				}
				else if((Date.now().getMonth() == 8))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 4);
				}
				else if((Date.now().getMonth() == 9))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 6);
				}
				else if((Date.now().getMonth() == 10))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 2);
				}
				else if((Date.now().getMonth() == 11))
				{
					Engine.engine.setGameAttribute("GetDayMonth", 4);
				}
				Engine.engine.setGameAttribute("GetDayMonthBool", true);
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Date.now().getFullYear() - 2000) == 0))
				{
					Engine.engine.setGameAttribute("GetDayYear", 0);
				}
				else if((((Date.now().getFullYear() - 2000) / 4) == 1))
				{
					Engine.engine.setGameAttribute("GetDayYear", 5);
				}
				else if((((Date.now().getFullYear() - 2000) / 4) == 2))
				{
					Engine.engine.setGameAttribute("GetDayYear", 3);
				}
				else if((((Date.now().getFullYear() - 2000) / 4) == 3))
				{
					Engine.engine.setGameAttribute("GetDayYear", 1);
				}
				else if(((((Date.now().getFullYear() - 2000) / 4) > 3) && (((Date.now().getFullYear() - 2000) / 4) < 4)))
				{
					if((((Date.now().getFullYear() - 2000) / 4) == 3.25))
					{
						Engine.engine.setGameAttribute("GetDayYear", (1 + 1));
					}
					else if((((Date.now().getFullYear() - 2000) / 4) == 3.5))
					{
						Engine.engine.setGameAttribute("GetDayYear", (1 + 2));
					}
					else if((((Date.now().getFullYear() - 2000) / 4) == 3.75))
					{
						Engine.engine.setGameAttribute("GetDayYear", (1 + 3));
					}
				}
				else if((((Date.now().getFullYear() - 2000) / 4) == 4))
				{
					Engine.engine.setGameAttribute("GetDayYear", 6);
				}
				else if((((Date.now().getFullYear() - 2000) / 4) == 5))
				{
					Engine.engine.setGameAttribute("GetDayYear", 4);
				}
				else if((((Date.now().getFullYear() - 2000) / 4) == 6))
				{
					Engine.engine.setGameAttribute("GetDayYear", 2);
				}
				Engine.engine.setGameAttribute("GetDayYearBool", true);
				trace((Engine.engine.getGameAttribute("GetDayYear") : Float));
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				Engine.engine.setGameAttribute("GetDayDate", (Date.now().getDate() % 7));
				Engine.engine.setGameAttribute("GetDayDateBool", true);
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				while(!((((Engine.engine.getGameAttribute("GetDayMonthBool") : Bool) == true) && (((Engine.engine.getGameAttribute("GetDayDateBool") : Bool) == true) && ((Engine.engine.getGameAttribute("GetDayYearBool") : Bool) == true)))))
				{
					trace("waiting");
				}
				Engine.engine.setGameAttribute("GetFreakingDay", ((Engine.engine.getGameAttribute("GetDayDate") : Float) + ((Engine.engine.getGameAttribute("GetDayMonth") : Float) + (Engine.engine.getGameAttribute("GetDayYear") : Float))));
				trace((("Freaking Day =") + ("" + Engine.engine.getGameAttribute("GetFreakingDay"))));
				while(!(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) < 8)))
				{
					if(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) > 7))
					{
						Engine.engine.setGameAttribute("GetFreakingDay", ((Engine.engine.getGameAttribute("GetFreakingDay") : Float) - 7));
					}
				}
				trace((("Freaking Day =") + ("" + Engine.engine.getGameAttribute("GetFreakingDay"))));
				if(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) == 0))
				{
					Engine.engine.setGameAttribute("day", "Tuesday");
				}
				else if(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) == 1))
				{
					Engine.engine.setGameAttribute("day", "Wednesday");
				}
				else if(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) == 2))
				{
					Engine.engine.setGameAttribute("day", "Thursday");
				}
				else if(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) == 3))
				{
					Engine.engine.setGameAttribute("day", "Friday");
				}
				else if(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) == 4))
				{
					Engine.engine.setGameAttribute("day", "Saturday");
				}
				else if(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) == 5))
				{
					Engine.engine.setGameAttribute("day", "Sunday");
				}
				else if(((Engine.engine.getGameAttribute("GetFreakingDay") : Float) == 6))
				{
					Engine.engine.setGameAttribute("day", "Monday");
				}
				trace((("Freaking Day = ") + ((Engine.engine.getGameAttribute("day") : String))));
				Engine.engine.setGameAttribute("GetDayDateBool", false);
				Engine.engine.setGameAttribute("GetDayYearBool", false);
				Engine.engine.setGameAttribute("GetDayMonthBool", false);
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}