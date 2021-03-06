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



class ActorEvents_241 extends ActorScript
{
	public var _pushnum:Float;
	public var _Item:Array<Dynamic>;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("pushnum", "_pushnum");
		_pushnum = 0.0;
		nameMap.set("Item", "_Item");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_pushnum = 0;
		
		/* ======================= Every N seconds ======================== */
		runPeriodically(1000 * 2, function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				_pushnum = 0;
			}
		}, actor);
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				_pushnum = (_pushnum + 1);
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((_pushnum >= 3))
				{
					_pushnum = 0;
					if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 2))
					{
						switchScene(GameModel.get().scenes.get(3).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 3))
					{
						switchScene(GameModel.get().scenes.get(5).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 4))
					{
						switchScene(GameModel.get().scenes.get(8).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 5))
					{
						switchScene(GameModel.get().scenes.get(11).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 6))
					{
						switchScene(GameModel.get().scenes.get(14).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 7))
					{
						switchScene(GameModel.get().scenes.get(15).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 8))
					{
						switchScene(GameModel.get().scenes.get(35).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 9))
					{
						switchScene(GameModel.get().scenes.get(25).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 10))
					{
						switchScene(GameModel.get().scenes.get(26).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 11))
					{
						switchScene(GameModel.get().scenes.get(20).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 12))
					{
						switchScene(GameModel.get().scenes.get(36).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 13))
					{
						switchScene(GameModel.get().scenes.get(28).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 14))
					{
						switchScene(GameModel.get().scenes.get(30).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 15))
					{
						switchScene(GameModel.get().scenes.get(38).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 16))
					{
						switchScene(GameModel.get().scenes.get(37).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 17))
					{
						switchScene(GameModel.get().scenes.get(39).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 18))
					{
						switchScene(GameModel.get().scenes.get(41).getID(), null, createCrossfadeTransition(.5));
					}
					else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 19))
					{
						switchScene(GameModel.get().scenes.get(44).getID(), null, createCrossfadeTransition(.5));
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}