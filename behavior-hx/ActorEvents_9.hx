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



class ActorEvents_9 extends ActorScript
{
	public var _Item:Array<Dynamic>;
	public var _Day:String;
	public var _Month:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Item", "_Item");
		nameMap.set("Day", "_Day");
		_Day = "";
		nameMap.set("Month", "_Month");
		_Month = "";
		
	}
	
	override public function init()
	{
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				Engine.engine.setGameAttribute("LevelNumber", 1);
				for(index0 in 0...Std.int(1))
				{
					if((Date.now().getMonth() == 0))
					{
						_Month = "January";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 1))
					{
						_Month = "February";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 2))
					{
						_Month = "March";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 3))
					{
						_Month = "April";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 4))
					{
						_Month = "May";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 5))
					{
						_Month = "June";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 6))
					{
						_Month = "July";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 7))
					{
						_Month = "August";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 8))
					{
						_Month = "September";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 9))
					{
						_Month = "October";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 10))
					{
						_Month = "November";
						propertyChanged("_Month", _Month);
					}
					else if((Date.now().getMonth() == 11))
					{
						_Month = "December";
						propertyChanged("_Month", _Month);
					}
				}
				Engine.engine.setGameAttribute("L01NumPlayed", (Engine.engine.getGameAttribute("L01NumPlayed") + 1));
				Engine.engine.setGameAttribute("L01Score", 0);
				runLater(1000 * .1, function(timeTask:TimedTask):Void
				{
					_Item = new Array<Dynamic>();
					propertyChanged("_Item", _Item);
					_Item[Std.int(0)] = (("" + (("" + (("" + (("" + (("" + Engine.engine.getGameAttribute("day")) + ("" + ", "))) + ("" + (("" + _Month) + ("" + " "))))) + ("" + Date.now().getDate()))) + ("" + ", "))) + ("" + Date.now().getFullYear()));
					_Item[Std.int(1)] = Engine.engine.getGameAttribute("L01NumPlayed");
					_Item[Std.int(2)] = (("" + (("" + Date.now().getHours()) + ("" + ":"))) + ("" + (("" + (("" + Date.now().getMinutes()) + ("" + ":"))) + ("" + Date.now().getSeconds()))));
					_Item[Std.int(3)] = Engine.engine.getGameAttribute("L01Score");
					Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("L01NumPlayed"))] = _Item;
					switchScene(GameModel.get().scenes.get(1).getID(), createFadeOut(.5), createFadeIn(.5));
					trace("" + Engine.engine.getGameAttribute("L01Date01"));
					trace("" + (("" + "freaking day =") + ("" + Engine.engine.getGameAttribute("day"))));
				}, actor);
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}