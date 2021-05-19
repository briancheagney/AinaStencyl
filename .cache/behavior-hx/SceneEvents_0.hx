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



class SceneEvents_0 extends SceneScript
{
	public var _percentage:Float;
	public var _Line01Level:Float;
	public var _Line02LevelName:Float;
	public var _Line03Set:Float;
	public var _Line04Date:Float;
	public var _Line05Time:Float;
	public var _Line06PercentCorrect:Float;
	public var _Line07Trialstarts:Float;
	public var _LineSpacing:Float;
	public var _Xvalue:Float;
	public var _XvalueTF:Float;
	public var _Xvalue02:Float;
	public var _Xvalue02TF:Float;
	public var _WCSTSpacing:Float;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("percentage", "_percentage");
		_percentage = 0.0;
		nameMap.set("Line01_Level", "_Line01Level");
		_Line01Level = 0.0;
		nameMap.set("Line02_LevelName", "_Line02LevelName");
		_Line02LevelName = 0.0;
		nameMap.set("Line03_Set", "_Line03Set");
		_Line03Set = 0.0;
		nameMap.set("Line04_Date", "_Line04Date");
		_Line04Date = 0.0;
		nameMap.set("Line05_Time", "_Line05Time");
		_Line05Time = 0.0;
		nameMap.set("Line06_PercentCorrect", "_Line06PercentCorrect");
		_Line06PercentCorrect = 0.0;
		nameMap.set("Line07_Trialstarts", "_Line07Trialstarts");
		_Line07Trialstarts = 0.0;
		nameMap.set("LineSpacing", "_LineSpacing");
		_LineSpacing = 0.0;
		nameMap.set("Xvalue", "_Xvalue");
		_Xvalue = 0.0;
		nameMap.set("XvalueTF", "_XvalueTF");
		_XvalueTF = 0.0;
		nameMap.set("Xvalue02", "_Xvalue02");
		_Xvalue02 = 0.0;
		nameMap.set("Xvalue02TF", "_Xvalue02TF");
		_Xvalue02TF = 0.0;
		nameMap.set("WCSTSpacing", "_WCSTSpacing");
		_WCSTSpacing = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		/* I'm going to present all of the Y coordinates for each line. */
		_WCSTSpacing = 14;
		_LineSpacing = 18;
		_Line01Level = 60;
		_Xvalue = 180;
		_XvalueTF = (_Xvalue + 65);
		_Xvalue02 = (_Xvalue + 135);
		_Xvalue02TF = (_Xvalue02 + 70);
		_Line02LevelName = (_Line01Level + _LineSpacing);
		_Line03Set = (_Line02LevelName + _LineSpacing);
		_Line04Date = (_Line03Set + _LineSpacing);
		_Line05Time = (_Line04Date + _LineSpacing);
		_Line06PercentCorrect = (_Line05Time + _LineSpacing);
		_Line07Trialstarts = (_Line06PercentCorrect + (_LineSpacing + _LineSpacing));
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((((Engine.engine.getGameAttribute("StatsLevel") : Float) == 18) || ((Engine.engine.getGameAttribute("StatsLevel") : Float) == 21)) || ((Engine.engine.getGameAttribute("StatsLevel") : Float) == 22)))
				{
					g.drawString("" + (Engine.engine.getGameAttribute("Level  Names") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("StatsLevel") : Float) - 1))], _Xvalue, (_Line01Level + (1 * _WCSTSpacing)));
				}
				else
				{
					g.drawString("" + (Engine.engine.getGameAttribute("Level  Names") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("StatsLevel") : Float) - 1))], _Xvalue, _Line02LevelName);
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 1))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length >= 2))
					{
						if(((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float)))
						{
							g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
							g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
							g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
							g.drawString("" + (("# hits: ") + ("" + ((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3])), _Xvalue, _Line06PercentCorrect);
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 2))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 3))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						_percentage = 0;
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
								if((((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)] == "T"))
								{
									_percentage = (_percentage + 1);
								}
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								if((((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)] == "T"))
								{
									_percentage = (_percentage + 1);
								}
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 4))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 3)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 5))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 6))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 7))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 8))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 9))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 10))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 11))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 12))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 13))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 14))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 15))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 16))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 17))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 18))
				{
					g.setFont(getFont(259));
					g.drawString("" + (Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, (_Line01Level + (2 * _WCSTSpacing)));
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>).length - 1))))))), 0, 0);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, (_Line01Level + (3 * _WCSTSpacing)));
						g.drawString("" + (("# of Trials: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3])), _Xvalue, (_Line01Level + (4 * _WCSTSpacing)));
						g.drawString("" + (("# Correct: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[4])), _Xvalue, (_Line01Level + (5 * _WCSTSpacing)));
						g.drawString("" + (("% Correct: ") + ((("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[5]) + ("%")))), _Xvalue, (_Line01Level + (6 * _WCSTSpacing)));
						g.drawString("" + (("Perseverative Errors: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[6])), _Xvalue, (_Line01Level + (7 * _WCSTSpacing)));
						g.drawString("" + (("% Perseverative Errors: ") + ((("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[7]) + ("%")))), _Xvalue, (_Line01Level + (8 * _WCSTSpacing)));
						g.drawString("" + (("Non-Perseverative Erros: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[8])), _Xvalue, (_Line01Level + (9 * _WCSTSpacing)));
						g.drawString("" + (("Total Errors: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[9])), _Xvalue, (_Line01Level + (10 * _WCSTSpacing)));
						g.drawString("" + (("% Errors: ") + ((("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[10]) + ("%")))), _Xvalue, (_Line01Level + (11 * _WCSTSpacing)));
						g.drawString("" + (("Trials to Complete First Category: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[11])), _Xvalue, (_Line01Level + (12 * _WCSTSpacing)));
						g.drawString("" + (("Categories Achieved: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[12])), _Xvalue, (_Line01Level + (13 * _WCSTSpacing)));
						g.drawString("" + (("%  Conceptual Level Responses: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[13])), _Xvalue, (_Line01Level + (14 * _WCSTSpacing)));
						g.drawString("" + (("Failures to Maintain Set: ") + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[14])), _Xvalue, (_Line01Level + (15 * _WCSTSpacing)));
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 19))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 20))
				{
					g.setFont(getFont(17));
					g.drawString("" + (Engine.engine.getGameAttribute("StatsLevel01sub") : Float), 0, 0);
					g.drawString("" + (Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>).length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, _Line04Date);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, _Line05Time);
						g.drawString("" + ((("" + ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(0, 3)) + (((" ") + (("" + ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3]).substring(5, 12))))), _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...10)
						{
							if((index0 <= 4))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (((("Trial ") + ("" + (index0 + 1)))) + (": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + ((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[(index0 + 4)], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 21))
				{
					g.setFont(getFont(259));
					g.drawString("" + (Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, (_Line01Level + (2 * _WCSTSpacing)));
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>).length - 1))))))), 0, 0);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, (_Line01Level + (3 * _WCSTSpacing)));
						g.drawString("" + (("# of Trials: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3])), _Xvalue, (_Line01Level + (4 * _WCSTSpacing)));
						g.drawString("" + (("# Correct: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[4])), _Xvalue, (_Line01Level + (5 * _WCSTSpacing)));
						g.drawString("" + (("% Correct: ") + ((("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[5]) + ("%")))), _Xvalue, (_Line01Level + (6 * _WCSTSpacing)));
						g.drawString("" + (("Perseverative Errors: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[6])), _Xvalue, (_Line01Level + (7 * _WCSTSpacing)));
						g.drawString("" + (("% Perseverative Errors: ") + ((("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[7]) + ("%")))), _Xvalue, (_Line01Level + (8 * _WCSTSpacing)));
						g.drawString("" + (("Non-Perseverative Erros: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[8])), _Xvalue, (_Line01Level + (9 * _WCSTSpacing)));
						g.drawString("" + (("Total Errors: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[9])), _Xvalue, (_Line01Level + (10 * _WCSTSpacing)));
						g.drawString("" + (("% Errors: ") + ((("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[10]) + ("%")))), _Xvalue, (_Line01Level + (11 * _WCSTSpacing)));
						g.drawString("" + (("Trials to Complete First Category: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[11])), _Xvalue, (_Line01Level + (12 * _WCSTSpacing)));
						g.drawString("" + (("Categories Achieved: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[12])), _Xvalue, (_Line01Level + (13 * _WCSTSpacing)));
						g.drawString("" + (("%  Conceptual Level Responses: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[13])), _Xvalue, (_Line01Level + (14 * _WCSTSpacing)));
						g.drawString("" + (("Failures to Maintain Set: ") + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[14])), _Xvalue, (_Line01Level + (15 * _WCSTSpacing)));
					}
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("StatsLevel") : Float) == 22))
				{
					g.setFont(getFont(259));
					g.drawString("" + (Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[0], _Xvalue, _Line01Level);
					if((((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>).length >= 2) && ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>).length > (Engine.engine.getGameAttribute("StatsLevel01sub") : Float))))
					{
						g.drawString("" + (("Date: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[0])), _Xvalue, (_Line01Level + (2 * _WCSTSpacing)));
						g.drawString("" + (("Set: ") + ((("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[1]) + ((("/") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>).length - 1))))))), 0, 0);
						g.drawString("" + (("Time: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[2])), _Xvalue, (_Line01Level + (3 * _WCSTSpacing)));
						g.drawString("" + (("# of Trials: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[3])), _Xvalue, (_Line01Level + (4 * _WCSTSpacing)));
						g.drawString("" + (("# Correct: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[4])), _Xvalue, (_Line01Level + (5 * _WCSTSpacing)));
						g.drawString("" + (("% Correct: ") + ((("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[5]) + ("%")))), _Xvalue, (_Line01Level + (6 * _WCSTSpacing)));
						g.drawString("" + (("Perseverative Errors: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[6])), _Xvalue, (_Line01Level + (7 * _WCSTSpacing)));
						g.drawString("" + (("% Perseverative Errors: ") + ((("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[7]) + ("%")))), _Xvalue, (_Line01Level + (8 * _WCSTSpacing)));
						g.drawString("" + (("Non-Perseverative Erros: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[8])), _Xvalue, (_Line01Level + (9 * _WCSTSpacing)));
						g.drawString("" + (("Total Errors: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[9])), _Xvalue, (_Line01Level + (10 * _WCSTSpacing)));
						g.drawString("" + (("% Errors: ") + ((("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[10]) + ("%")))), _Xvalue, (_Line01Level + (11 * _WCSTSpacing)));
						g.drawString("" + (("Trials to Complete First Category: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[11])), _Xvalue, (_Line01Level + (12 * _WCSTSpacing)));
						g.drawString("" + (("Categories Achieved: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[12])), _Xvalue, (_Line01Level + (13 * _WCSTSpacing)));
						g.drawString("" + (("%  Conceptual Level Responses: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[13])), _Xvalue, (_Line01Level + (14 * _WCSTSpacing)));
						g.drawString("" + (("Failures to Maintain Set: ") + ("" + ((Engine.engine.getGameAttribute("L22Date") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("StatsLevel01sub") : Float))] : Array<Dynamic>)[14])), _Xvalue, (_Line01Level + (15 * _WCSTSpacing)));
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}