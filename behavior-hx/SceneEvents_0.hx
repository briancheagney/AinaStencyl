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



class SceneEvents_0 extends SceneScript
{
	public var _percentage:Float;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("percentage", "_percentage");
		_percentage = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.drawString("" + "Level", 100, 140);
				g.drawString("" + Engine.engine.getGameAttribute("StatsLevel"), 100, 160);
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 1))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(0)], 250, 100);
					if((Engine.engine.getGameAttribute("L01Date01").length >= 2))
					{
						if((Engine.engine.getGameAttribute("L01Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub")))
						{
							g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L01Date01").length - 1))))))), 250, 120);
							g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 250, 140);
							g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 250, 160);
							g.drawString("" + (("" + "# hits: ") + ("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)])), 250, 200);
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 2))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L02Date01").length >= 2) && (Engine.engine.getGameAttribute("L02Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L02Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 3))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L03Date01").length >= 2) && (Engine.engine.getGameAttribute("L03Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L03Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						_percentage = asNumber(0);
						propertyChanged("_percentage", _percentage);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
								if((Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))] == "T"))
								{
									_percentage = asNumber((_percentage + 1));
									propertyChanged("_percentage", _percentage);
								}
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
								if((Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))] == "T"))
								{
									_percentage = asNumber((_percentage + 1));
									propertyChanged("_percentage", _percentage);
								}
							}
						}
						if((_percentage > 0))
						{
							g.drawString("" + (("" + _percentage) + ("" + "0% Correct!")), 210, 150);
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 4))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("Lo4Date01").length >= 2) && (Engine.engine.getGameAttribute("Lo4Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("Lo4Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 3))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 5))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L05Date01").length >= 2) && (Engine.engine.getGameAttribute("L05Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L05Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 6))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L06Date01").length >= 2) && (Engine.engine.getGameAttribute("L06Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L06Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 7))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L07Date01").length >= 2) && (Engine.engine.getGameAttribute("L07Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L07Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 8))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L08Date01").length >= 2) && (Engine.engine.getGameAttribute("L08Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L08Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 9))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L09Date01").length >= 2) && (Engine.engine.getGameAttribute("L09Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L09Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 10))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L10Date01").length >= 2) && (Engine.engine.getGameAttribute("L10Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L10Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 11))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L11Date01").length >= 2) && (Engine.engine.getGameAttribute("L11Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L11Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 12))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L12Date01").length >= 2) && (Engine.engine.getGameAttribute("L12Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L12Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 13))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L13Date01").length >= 2) && (Engine.engine.getGameAttribute("L13Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L13Date01").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 14))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L14Date")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L14Date").length >= 2) && (Engine.engine.getGameAttribute("L14Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L14Date").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 15))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L15Date")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L15Date").length >= 2) && (Engine.engine.getGameAttribute("L15Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L15Date").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 16))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L16Date")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L16Date").length >= 2) && (Engine.engine.getGameAttribute("L16Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L16Date").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 17))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L17Date")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L17Date").length >= 2) && (Engine.engine.getGameAttribute("L17Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L17Date").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 18))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("L18Date")[Std.int(0)], 210, 50);
					if(((Engine.engine.getGameAttribute("L18Date").length >= 2) && (Engine.engine.getGameAttribute("L18Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 70);
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L18Date").length - 1))))))), 0, 0);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 90);
						g.drawString("" + (("" + "# of Trials: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)])), 210, 110);
						g.drawString("" + (("" + "# Correct: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(4)])), 210, 130);
						g.drawString("" + (("" + "% Correct: ") + ("" + (("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(5)]) + ("" + "%")))), 210, 150);
						g.drawString("" + (("" + "Perseverative Errors: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(6)])), 210, 170);
						g.drawString("" + (("" + "% Perseverative Errors: ") + ("" + (("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(7)]) + ("" + "%")))), 210, 190);
						g.drawString("" + (("" + "Non-Perseverative Erros: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(8)])), 210, 210);
						g.drawString("" + (("" + "Total Errors: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(9)])), 210, 230);
						g.drawString("" + (("" + "% Errors: ") + ("" + (("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(10)]) + ("" + "%")))), 210, 250);
						g.drawString("" + (("" + "Trials to Complete First Category: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(11)])), 210, 270);
						g.drawString("" + (("" + "Categories Achieved: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(12)])), 210, 290);
						g.drawString("" + (("" + "%  Conceptual Level Responses: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(13)])), 210, 310);
						g.drawString("" + (("" + "Failures to Maintain Set: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(14)])), 210, 330);
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("StatsLevel") == 19))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L19Date")[Std.int(0)], 210, 70);
					if(((Engine.engine.getGameAttribute("L19Date").length >= 2) && (Engine.engine.getGameAttribute("L19Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L19Date").length - 1))))))), 210, 90);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), 210, 110);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), 210, 130);
						g.drawString("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], 210, 150);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 210, ((index0 * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 275, ((index0 * 20) + 190));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), 345, (((index0 - 5) * 20) + 190));
								g.drawString("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], 418, (((index0 - 5) * 20) + 190));
							}
						}
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}