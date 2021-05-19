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



class ActorEvents_0 extends ActorScript
{
	public var _Pressed:Bool;
	public var _SizeW:Float;
	public var _SizeH:Float;
	public var _Small:String;
	public var _Medium:String;
	public var _Large:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Pressed", "_Pressed");
		_Pressed = false;
		nameMap.set("SizeW", "_SizeW");
		_SizeW = 0.0;
		nameMap.set("SizeH", "_SizeH");
		_SizeH = 0.0;
		nameMap.set("Small", "_Small");
		nameMap.set("Medium", "_Medium");
		nameMap.set("Large", "_Large");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		getActor(7).setX((((getScreenWidth() - 60) / 2) - (((.01 * (Engine.engine.getGameAttribute("SmallButtonSize") : Float)) * (getActor(7).getWidth())) / 2)));
		actor.setY(((getScreenHeight() / 2) - (((.01 * (Engine.engine.getGameAttribute("SmallButtonSize") : Float)) * (actor.getHeight())) / 2)));
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				getActor(7).setX((((getScreenWidth() - 60) / 2) - (((.01 * (Engine.engine.getGameAttribute("SmallButtonSize") : Float)) * ((getActor(7).getWidth()) / 2)) / 2)));
				actor.setY(((getScreenHeight() / 2) - (((.01 * (Engine.engine.getGameAttribute("SmallButtonSize") : Float)) * (actor.getHeight())) / 2)));
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("Level02ButtonSize") : Float) == 3))
				{
					actor.setAnimation(_Large);
				}
				else if(((Engine.engine.getGameAttribute("Level02ButtonSize") : Float) == 2))
				{
					actor.setAnimation(_Medium);
				}
				else if(((Engine.engine.getGameAttribute("Level02ButtonSize") : Float) == 1))
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