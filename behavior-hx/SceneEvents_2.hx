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



class SceneEvents_2 extends SceneScript
{
	public var _Target:Actor;
	public var _deletedatalist:Array<Dynamic>;
	public var _KeepText:String;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Target", "_Target");
		nameMap.set("deletedatalist", "_deletedatalist");
		nameMap.set("KeepText", "_KeepText");
		_KeepText = "";
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		createRecycledActor(getActorType(247), -1200, -1200, Script.FRONT);
		_Target = getLastCreatedActor();
		propertyChanged("_Target", _Target);
		Engine.engine.setGameAttribute("TargetX", ((((getScreenWidth() - (.1 * getScreenWidth())) / 2) + (.1 * getScreenWidth())) - ((_Target.getWidth()) / 2)));
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("ONE", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				trace("" + "1111111111111111111");
				if(isKeyDown("down"))
				{
					trace("" + "22222222222222222222222222222");
					if(isKeyDown("THREE"))
					{
						trace("" + "3333333333333333333333333333");
						if(isKeyDown("FOUR"))
						{
							trace("" + "4444444444444444444444444444");
							trace("" + "trying to delete");
							_deletedatalist = new Array<Dynamic>();
							propertyChanged("_deletedatalist", _deletedatalist);
							Engine.engine.setGameAttribute("L01Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L02Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L03Date01", _deletedatalist);
							Engine.engine.setGameAttribute("Lo4Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L05Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L06Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L07Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L08Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L09Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L10Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L11Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L12Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L13Date01", _deletedatalist);
							Engine.engine.setGameAttribute("L14Date", _deletedatalist);
							Engine.engine.setGameAttribute("L15Date", _deletedatalist);
							Engine.engine.setGameAttribute("L16Date", _deletedatalist);
							Engine.engine.setGameAttribute("L17Date", _deletedatalist);
							Engine.engine.setGameAttribute("L18Date", _deletedatalist);
							Engine.engine.setGameAttribute("L19Date", _deletedatalist);
							Engine.engine.setGameAttribute("L20Date", _deletedatalist);
							Engine.engine.setGameAttribute("L21Date", _deletedatalist);
						}
					}
				}
				/* All of these 1,2,3,4 are just for debugging purposes. */
				trace("" + Engine.engine.getGameAttribute("L01Date01"));
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("TWO", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				trace("" + Engine.engine.getGameAttribute("L02Date01"));
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("THREE", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				trace("" + Engine.engine.getGameAttribute("L03Date01"));
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("FOUR", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				trace("" + Engine.engine.getGameAttribute("Lo4Date01"));
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((isKeyDown("ONE") && isKeyDown("TWO")) && (isKeyDown("THREE") && isKeyDown("FOUR"))))
				{
					trace("" + "4444444444444444444444444444");
					trace("" + "trying to delete");
					_deletedatalist = new Array<Dynamic>();
					propertyChanged("_deletedatalist", _deletedatalist);
					_KeepText = Engine.engine.getGameAttribute("L01Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L01Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L01Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L02Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L02Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L02Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L03Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L03Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L03Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("Lo4Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("Lo4Date01", _deletedatalist);
					Engine.engine.getGameAttribute("Lo4Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L05Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L05Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L05Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L06Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L06Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L06Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L07Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L07Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L07Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L08Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L08Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L08Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L09Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L09Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L09Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L10Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L10Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L10Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L11Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L11Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L11Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L12Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L12Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L12Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L13Date01")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L13Date01", _deletedatalist);
					Engine.engine.getGameAttribute("L13Date01")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L14Date")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L14Date", _deletedatalist);
					Engine.engine.getGameAttribute("L14Date")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L15Date")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L15Date", _deletedatalist);
					Engine.engine.getGameAttribute("L15Date")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L16Date")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L16Date", _deletedatalist);
					Engine.engine.getGameAttribute("L16Date")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L17Date")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L17Date", _deletedatalist);
					Engine.engine.getGameAttribute("L17Date")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L18Date")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L18Date", _deletedatalist);
					Engine.engine.getGameAttribute("L18Date")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L19Date")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L19Date", _deletedatalist);
					Engine.engine.getGameAttribute("L19Date")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L20Date")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L20Date", _deletedatalist);
					Engine.engine.getGameAttribute("L20Date")[Std.int(0)] = _KeepText;
					_KeepText = Engine.engine.getGameAttribute("L21Date")[Std.int(0)][Std.int(0)];
					propertyChanged("_KeepText", _KeepText);
					Engine.engine.setGameAttribute("L21Date", _deletedatalist);
					Engine.engine.getGameAttribute("L21Date")[Std.int(0)] = _KeepText;
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}