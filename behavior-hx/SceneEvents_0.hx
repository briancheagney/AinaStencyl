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
		_WCSTSpacing = asNumber(14);
		propertyChanged("_WCSTSpacing", _WCSTSpacing);
		_LineSpacing = asNumber(18);
		propertyChanged("_LineSpacing", _LineSpacing);
		_Line01Level = asNumber(60);
		propertyChanged("_Line01Level", _Line01Level);
		_Xvalue = asNumber(180);
		propertyChanged("_Xvalue", _Xvalue);
		_XvalueTF = asNumber((_Xvalue + 65));
		propertyChanged("_XvalueTF", _XvalueTF);
		_Xvalue02 = asNumber((_Xvalue + 135));
		propertyChanged("_Xvalue02", _Xvalue02);
		_Xvalue02TF = asNumber((_Xvalue02 + 70));
		propertyChanged("_Xvalue02TF", _Xvalue02TF);
		_Line02LevelName = asNumber((_Line01Level + _LineSpacing));
		propertyChanged("_Line02LevelName", _Line02LevelName);
		_Line03Set = asNumber((_Line02LevelName + _LineSpacing));
		propertyChanged("_Line03Set", _Line03Set);
		_Line04Date = asNumber((_Line03Set + _LineSpacing));
		propertyChanged("_Line04Date", _Line04Date);
		_Line05Time = asNumber((_Line04Date + _LineSpacing));
		propertyChanged("_Line05Time", _Line05Time);
		_Line06PercentCorrect = asNumber((_Line05Time + _LineSpacing));
		propertyChanged("_Line06PercentCorrect", _Line06PercentCorrect);
		_Line07Trialstarts = asNumber((_Line06PercentCorrect + (_LineSpacing + _LineSpacing)));
		propertyChanged("_Line07Trialstarts", _Line07Trialstarts);
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("StatsLevel") == 18) || (Engine.engine.getGameAttribute("StatsLevel") == 21)))
				{
					g.drawString("" + Engine.engine.getGameAttribute("Level  Names")[Std.int((Engine.engine.getGameAttribute("StatsLevel") - 1))], _Xvalue, (_Line01Level + (1 * _WCSTSpacing)));
				}
				else
				{
					g.drawString("" + Engine.engine.getGameAttribute("Level  Names")[Std.int((Engine.engine.getGameAttribute("StatsLevel") - 1))], _Xvalue, _Line02LevelName);
				}
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
					g.drawString("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if((Engine.engine.getGameAttribute("L01Date01").length >= 2))
					{
						if((Engine.engine.getGameAttribute("L01Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub")))
						{
							g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L01Date01").length - 1))))))), _Xvalue, _Line03Set);
							g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
							g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
							g.drawString("" + (("" + "# hits: ") + ("" + Engine.engine.getGameAttribute("L01Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)])), _Xvalue, _Line06PercentCorrect);
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
					g.drawString("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L02Date01").length >= 2) && (Engine.engine.getGameAttribute("L02Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L02Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L02Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L03Date01").length >= 2) && (Engine.engine.getGameAttribute("L03Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L03Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						_percentage = asNumber(0);
						propertyChanged("_percentage", _percentage);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
								if((Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))] == "T"))
								{
									_percentage = asNumber((_percentage + 1));
									propertyChanged("_percentage", _percentage);
								}
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								if((Engine.engine.getGameAttribute("L03Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))] == "T"))
								{
									_percentage = asNumber((_percentage + 1));
									propertyChanged("_percentage", _percentage);
								}
							}
						}
						if((_percentage > 0))
						{
							g.drawString("" + (("" + _percentage) + ("" + "0% Correct!")), _Xvalue, _Line06PercentCorrect);
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
					g.drawString("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("Lo4Date01").length >= 2) && (Engine.engine.getGameAttribute("Lo4Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("Lo4Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("Lo4Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 3))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L05Date01").length >= 2) && (Engine.engine.getGameAttribute("L05Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L05Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L05Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L06Date01").length >= 2) && (Engine.engine.getGameAttribute("L06Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L06Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L06Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L07Date01").length >= 2) && (Engine.engine.getGameAttribute("L07Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L07Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L07Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L08Date01").length >= 2) && (Engine.engine.getGameAttribute("L08Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L08Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L08Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L09Date01").length >= 2) && (Engine.engine.getGameAttribute("L09Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L09Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L09Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L10Date01").length >= 2) && (Engine.engine.getGameAttribute("L10Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L10Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L10Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L11Date01").length >= 2) && (Engine.engine.getGameAttribute("L11Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L11Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L11Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L12Date01").length >= 2) && (Engine.engine.getGameAttribute("L12Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L12Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L12Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L13Date01").length >= 2) && (Engine.engine.getGameAttribute("L13Date01").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L13Date01").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L13Date01")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L14Date")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L14Date").length >= 2) && (Engine.engine.getGameAttribute("L14Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L14Date").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L14Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L15Date")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L15Date").length >= 2) && (Engine.engine.getGameAttribute("L15Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L15Date").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L15Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L16Date")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L16Date").length >= 2) && (Engine.engine.getGameAttribute("L16Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L16Date").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L16Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.drawString("" + Engine.engine.getGameAttribute("L17Date")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L17Date").length >= 2) && (Engine.engine.getGameAttribute("L17Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L17Date").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L17Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
					g.setFont(getFont(259));
					g.drawString("" + Engine.engine.getGameAttribute("L18Date")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L18Date").length >= 2) && (Engine.engine.getGameAttribute("L18Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, (_Line01Level + (2 * _WCSTSpacing)));
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L18Date").length - 1))))))), 0, 0);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, (_Line01Level + (3 * _WCSTSpacing)));
						g.drawString("" + (("" + "# of Trials: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)])), _Xvalue, (_Line01Level + (4 * _WCSTSpacing)));
						g.drawString("" + (("" + "# Correct: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(4)])), _Xvalue, (_Line01Level + (5 * _WCSTSpacing)));
						g.drawString("" + (("" + "% Correct: ") + ("" + (("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(5)]) + ("" + "%")))), _Xvalue, (_Line01Level + (6 * _WCSTSpacing)));
						g.drawString("" + (("" + "Perseverative Errors: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(6)])), _Xvalue, (_Line01Level + (7 * _WCSTSpacing)));
						g.drawString("" + (("" + "% Perseverative Errors: ") + ("" + (("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(7)]) + ("" + "%")))), _Xvalue, (_Line01Level + (8 * _WCSTSpacing)));
						g.drawString("" + (("" + "Non-Perseverative Erros: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(8)])), _Xvalue, (_Line01Level + (9 * _WCSTSpacing)));
						g.drawString("" + (("" + "Total Errors: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(9)])), _Xvalue, (_Line01Level + (10 * _WCSTSpacing)));
						g.drawString("" + (("" + "% Errors: ") + ("" + (("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(10)]) + ("" + "%")))), _Xvalue, (_Line01Level + (11 * _WCSTSpacing)));
						g.drawString("" + (("" + "Trials to Complete First Category: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(11)])), _Xvalue, (_Line01Level + (12 * _WCSTSpacing)));
						g.drawString("" + (("" + "Categories Achieved: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(12)])), _Xvalue, (_Line01Level + (13 * _WCSTSpacing)));
						g.drawString("" + (("" + "%  Conceptual Level Responses: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(13)])), _Xvalue, (_Line01Level + (14 * _WCSTSpacing)));
						g.drawString("" + (("" + "Failures to Maintain Set: ") + ("" + Engine.engine.getGameAttribute("L18Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(14)])), _Xvalue, (_Line01Level + (15 * _WCSTSpacing)));
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
					g.drawString("" + Engine.engine.getGameAttribute("L19Date")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L19Date").length >= 2) && (Engine.engine.getGameAttribute("L19Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L19Date").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L19Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if((Engine.engine.getGameAttribute("StatsLevel") == 20))
				{
					g.setFont(getFont(17));
					g.drawString("" + Engine.engine.getGameAttribute("StatsLevel01sub"), 0, 0);
					g.drawString("" + Engine.engine.getGameAttribute("L20Date")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L20Date").length >= 2) && (Engine.engine.getGameAttribute("L20Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L20Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L20Date").length - 1))))))), _Xvalue, _Line03Set);
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L20Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, _Line04Date);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L20Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, _Line05Time);
						g.drawString("" + Engine.engine.getGameAttribute("L20Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)], _Xvalue, _Line06PercentCorrect);
						for(index0 in 0...Std.int(10))
						{
							if((index0 <= 4))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue, ((index0 * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L20Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _XvalueTF, ((index0 * _LineSpacing) + _Line07Trialstarts));
							}
							if((index0 >= 5))
							{
								g.drawString("" + (("" + (("" + "Trial ") + ("" + (index0 + 1)))) + ("" + ": ")), _Xvalue02, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
								g.drawString("" + Engine.engine.getGameAttribute("L20Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int((index0 + 4))], _Xvalue02TF, (((index0 - 5) * _LineSpacing) + _Line07Trialstarts));
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
				if((Engine.engine.getGameAttribute("StatsLevel") == 21))
				{
					g.setFont(getFont(259));
					g.drawString("" + Engine.engine.getGameAttribute("L21Date")[Std.int(0)], _Xvalue, _Line01Level);
					if(((Engine.engine.getGameAttribute("L21Date").length >= 2) && (Engine.engine.getGameAttribute("L21Date").length > Engine.engine.getGameAttribute("StatsLevel01sub"))))
					{
						g.drawString("" + (("" + "Date: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(0)])), _Xvalue, (_Line01Level + (2 * _WCSTSpacing)));
						g.drawString("" + (("" + "Set: ") + ("" + (("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(1)]) + ("" + (("" + "/") + ("" + (Engine.engine.getGameAttribute("L21Date").length - 1))))))), 0, 0);
						g.drawString("" + (("" + "Time: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(2)])), _Xvalue, (_Line01Level + (3 * _WCSTSpacing)));
						g.drawString("" + (("" + "# of Trials: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(3)])), _Xvalue, (_Line01Level + (4 * _WCSTSpacing)));
						g.drawString("" + (("" + "# Correct: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(4)])), _Xvalue, (_Line01Level + (5 * _WCSTSpacing)));
						g.drawString("" + (("" + "% Correct: ") + ("" + (("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(5)]) + ("" + "%")))), _Xvalue, (_Line01Level + (6 * _WCSTSpacing)));
						g.drawString("" + (("" + "Perseverative Errors: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(6)])), _Xvalue, (_Line01Level + (7 * _WCSTSpacing)));
						g.drawString("" + (("" + "% Perseverative Errors: ") + ("" + (("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(7)]) + ("" + "%")))), _Xvalue, (_Line01Level + (8 * _WCSTSpacing)));
						g.drawString("" + (("" + "Non-Perseverative Erros: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(8)])), _Xvalue, (_Line01Level + (9 * _WCSTSpacing)));
						g.drawString("" + (("" + "Total Errors: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(9)])), _Xvalue, (_Line01Level + (10 * _WCSTSpacing)));
						g.drawString("" + (("" + "% Errors: ") + ("" + (("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(10)]) + ("" + "%")))), _Xvalue, (_Line01Level + (11 * _WCSTSpacing)));
						g.drawString("" + (("" + "Trials to Complete First Category: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(11)])), _Xvalue, (_Line01Level + (12 * _WCSTSpacing)));
						g.drawString("" + (("" + "Categories Achieved: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(12)])), _Xvalue, (_Line01Level + (13 * _WCSTSpacing)));
						g.drawString("" + (("" + "%  Conceptual Level Responses: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(13)])), _Xvalue, (_Line01Level + (14 * _WCSTSpacing)));
						g.drawString("" + (("" + "Failures to Maintain Set: ") + ("" + Engine.engine.getGameAttribute("L21Date")[Std.int(Engine.engine.getGameAttribute("StatsLevel01sub"))][Std.int(14)])), _Xvalue, (_Line01Level + (15 * _WCSTSpacing)));
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}