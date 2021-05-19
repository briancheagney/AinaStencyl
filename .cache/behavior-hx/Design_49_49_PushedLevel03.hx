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



class Design_49_49_PushedLevel03 extends ActorScript
{
	public var _Pressed:Bool;
	public var _SizeW:Float;
	public var _SizeH:Float;
	public var _Large:String;
	public var _Medium:String;
	public var _Small:String;
	public var _ranx:Float;
	public var _rany:Float;
	public var _ranxold:Float;
	public var _ranyold:Float;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Pressed", "_Pressed");
		_Pressed = false;
		nameMap.set("SizeW", "_SizeW");
		_SizeW = 0.0;
		nameMap.set("SizeH", "_SizeH");
		_SizeH = 0.0;
		nameMap.set("Large", "_Large");
		nameMap.set("Medium", "_Medium");
		nameMap.set("Small", "_Small");
		nameMap.set("ranx", "_ranx");
		_ranx = 0.0;
		nameMap.set("rany", "_rany");
		_rany = 0.0;
		nameMap.set("ranxold", "_ranxold");
		_ranxold = 0.0;
		nameMap.set("ranyold", "_ranyold");
		_ranyold = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("Level03Falsecounter", 0);
		Engine.engine.setGameAttribute("Level03Resetter2", false);
		Engine.engine.setGameAttribute("Level03Pushed", false);
		actor.growTo((Engine.engine.getGameAttribute("ButtonSizeL03") : Float)/100, (Engine.engine.getGameAttribute("ButtonSizeL03") : Float)/100, 0, Easing.linear);
		_Pressed = false;
		_SizeH = 100;
		_SizeW = 100;
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("Level03Pushed") : Bool) == false))
				{
					Engine.engine.setGameAttribute("Level03Pushed", true);
					Engine.engine.setGameAttribute("Level03Falser", true);
					actor.growTo((.9 * (Engine.engine.getGameAttribute("ButtonSizeL03") : Float))/100, (.9 * (Engine.engine.getGameAttribute("ButtonSizeL03") : Float))/100, .25, Easing.expoInOut);
					playSound(getSound(57));
					runLater(1000 * .01, function(timeTask:TimedTask):Void
					{
						actor.growTo(0/100, 0/100, 0, Easing.linear);
						actor.disableActorDrawing();
						while(!(((Math.abs((_ranx - _ranxold)) > 100) || (Math.abs((_rany - _ranyold)) > 100))))
						{
							_ranx = randomInt(65, 315);
							_rany = randomInt(0, 160);
						}
						actor.setX(_ranx);
						actor.setY(_rany);
						runLater(1000 * 1, function(timeTask:TimedTask):Void
						{
							actor.growTo(100/100, 100/100, 0, Easing.linear);
							actor.enableActorDrawing();
							_ranxold = _ranx;
							_ranyold = _rany;
							trace("X=");
							trace(actor.getX());
							trace("y=");
							trace(actor.getY());
							Engine.engine.setGameAttribute("Level03Pushed", false);
							Engine.engine.setGameAttribute("Level03Falser", true);
						}, actor);
					}, actor);
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("Level03ButtonSize") : Float) == 3))
				{
					actor.setAnimation(_Large);
				}
				else if(((Engine.engine.getGameAttribute("Level03ButtonSize") : Float) == 2))
				{
					actor.setAnimation(_Medium);
				}
				else if(((Engine.engine.getGameAttribute("Level03ButtonSize") : Float) == 1))
				{
					actor.setAnimation(_Small);
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}