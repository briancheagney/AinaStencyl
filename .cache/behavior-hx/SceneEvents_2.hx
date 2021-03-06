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
		getActor(23).setX(121);
		getActor(23).setY(214);
		getActor(24).setX(174);
		getActor(24).setY(214);
		getActor(25).setX(228);
		getActor(25).setY(214);
		getActor(26).setX(121);
		getActor(26).setY(267);
		getActor(27).setX(169);
		getActor(27).setY(261);
		getActor(28).setX(222);
		getActor(28).setY(261);
		getActor(30).setX(275);
		getActor(30).setY(261);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}