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



class SceneEvents_42 extends SceneScript
{
	public var _info:String;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("info", "_info");
		_info = "";
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		postToURL("https://linus.highpoint.edu/~brolison/process.php", "fname=Jim&lname=Smith", function(event:Event):Void
		{
			for(item in cast((cast(event.target, URLLoader).data).split(" "), Array<Dynamic>))
			{
				_info = "" + item;
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(17));
				g.drawString("" + (Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[0], 250, 100);
				if(((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length >= 2))
				{
					if(((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float)))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length - 1))))))), 250, 120);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), 250, 140);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), 250, 160);
						g.drawString("" + (("# hits: ") + ("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3])), 250, 200);
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}