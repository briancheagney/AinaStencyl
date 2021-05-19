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



class ActorEvents_88 extends ActorScript
{
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		
	}
	
	override public function init()
	{
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 1))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 2))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 3))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 4))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 5))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 6))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 7))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 8))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 9))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 10))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 11))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 12))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 13))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 14))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 15))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 16))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 17))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 18))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>).length - 1));
				}
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 19))
				{
					Engine.engine.setGameAttribute("StatsLevel01sub", ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>).length - 1));
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}