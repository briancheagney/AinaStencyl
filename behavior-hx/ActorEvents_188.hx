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



class ActorEvents_188 extends ActorScript
{
	public var _mailto:String;
	public var _subject:String;
	public var _space:String;
	public var _tworeturns:String;
	public var _Level01Data:String;
	public var _onereturn:String;
	public var _Level02Data:String;
	public var _Level03Data:String;
	public var _Level02percentage:Float;
	public var _cc:String;
	public var _Level04Data:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("mailto", "_mailto");
		_mailto = "";
		nameMap.set("subject", "_subject");
		_subject = "";
		nameMap.set("space", "_space");
		_space = "";
		nameMap.set("tworeturns", "_tworeturns");
		_tworeturns = "";
		nameMap.set("Level01Data", "_Level01Data");
		_Level01Data = "";
		nameMap.set("onereturn", "_onereturn");
		_onereturn = "";
		nameMap.set("Level02Data", "_Level02Data");
		_Level02Data = "";
		nameMap.set("Level03Data", "_Level03Data");
		_Level03Data = "";
		nameMap.set("Level02percentage", "_Level02percentage");
		_Level02percentage = 0.0;
		nameMap.set("cc", "_cc");
		_cc = "";
		nameMap.set("Level04Data", "_Level04Data");
		_Level04Data = "";
		
	}
	
	override public function init()
	{
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((Engine.engine.getGameAttribute("Sound") == true))
				{
					Engine.engine.setGameAttribute("Sound", false);
					setVolumeForAllSounds(0/100);
					actor.setAnimation("" + "SoundOff");
				}
				else if((Engine.engine.getGameAttribute("Sound") == false))
				{
					Engine.engine.setGameAttribute("Sound", true);
					setVolumeForAllSounds(100/100);
					actor.setAnimation("" + "SoundOn");
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}