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



class Design_200_200_STATSetup extends SceneScript
{
	public var _CurrentList:Array<Dynamic>;
	public var _PercentRight:Float;
	public var _LevelTotalNum:Float;
	public var _GUIsetter:Bool;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("CurrentList", "_CurrentList");
		nameMap.set("PercentRight", "_PercentRight");
		_PercentRight = 0.0;
		nameMap.set("LevelTotalNum", "_LevelTotalNum");
		_LevelTotalNum = 0.0;
		nameMap.set("GUIsetter", "_GUIsetter");
		_GUIsetter = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		if((Engine.engine.getGameAttribute("LevelNumber") == 1))
		{
			_CurrentList = Engine.engine.getGameAttribute("L01Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L01Score"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 2))
		{
			_CurrentList = Engine.engine.getGameAttribute("L02Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L02TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 3))
		{
			_CurrentList = Engine.engine.getGameAttribute("L03Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L03TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 4))
		{
			_CurrentList = Engine.engine.getGameAttribute("Lo4Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L04TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 5))
		{
			_CurrentList = Engine.engine.getGameAttribute("L05Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L05TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 6))
		{
			_CurrentList = Engine.engine.getGameAttribute("L06Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L06TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 7))
		{
			_CurrentList = Engine.engine.getGameAttribute("L07Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L07TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 8))
		{
			_CurrentList = Engine.engine.getGameAttribute("L08Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L08TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 9))
		{
			_CurrentList = Engine.engine.getGameAttribute("L09Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L09Col01TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 10))
		{
			_CurrentList = Engine.engine.getGameAttribute("L10Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L10Col02TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 11))
		{
			_CurrentList = Engine.engine.getGameAttribute("L11Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L11ColSwTotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 12))
		{
			_CurrentList = Engine.engine.getGameAttribute("L12Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L12ColSwNEWTotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 13))
		{
			_CurrentList = Engine.engine.getGameAttribute("L13Date01");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L13Num01TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 14))
		{
			_CurrentList = Engine.engine.getGameAttribute("L14Date");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L14Num02TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 15))
		{
			_CurrentList = Engine.engine.getGameAttribute("L15Date");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L15NumSwTotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 16))
		{
			_CurrentList = Engine.engine.getGameAttribute("L16Date");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L16_2var_Color_TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 17))
		{
			_CurrentList = Engine.engine.getGameAttribute("L17Date");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L17_2var_Color_TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 18))
		{
			_CurrentList = Engine.engine.getGameAttribute("L18Date");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L18TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 19))
		{
			_CurrentList = Engine.engine.getGameAttribute("L19Date");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L19_2var_Shape_Num_TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 20))
		{
			_CurrentList = Engine.engine.getGameAttribute("L20Date");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L20TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		else if((Engine.engine.getGameAttribute("LevelNumber") == 21))
		{
			_CurrentList = Engine.engine.getGameAttribute("L21Date");
			propertyChanged("_CurrentList", _CurrentList);
			_LevelTotalNum = asNumber(Engine.engine.getGameAttribute("L21TotalNum"));
			propertyChanged("_LevelTotalNum", _LevelTotalNum);
		}
		_GUIsetter = true;
		propertyChanged("_GUIsetter", _GUIsetter);
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((_GUIsetter == true))
				{
					/* Draw Level */
					g.setFont(getFont(102));
					g.drawString("" + ("" + _CurrentList[Std.int(0)]), 0, 5);
					/* Draw Set */
					g.drawString("" + "Set: ", 0, 20);
					g.setFont(getFont(101));
					g.drawString("" + (_CurrentList.length - 1), 0, 21);
					g.setFont(getFont(102));
					/* Draw Trials */
					g.drawString("" + "Trial: ", 0, 59);
					g.setFont(getFont(101));
					g.drawString("" + (Engine.engine.getGameAttribute("LevelTrial") + 1), 0, 60);
					g.setFont(getFont(102));
				}
				for(index0 in 0...Std.int(5))
				{
					g.drawString("" + (index0 + 1), 0, (100 + (index0 * 15)));
					if(((_CurrentList[Std.int((_CurrentList.length - 1))][Std.int((index0 + 4))] == "T") || (_CurrentList[Std.int((_CurrentList.length - 1))][Std.int((index0 + 4))] == "F")))
					{
						g.drawString("" + _CurrentList[Std.int((_CurrentList.length - 1))][Std.int((index0 + 4))], 10, (100 + (index0 * 15)));
					}
				}
				for(index0 in 0...Std.int(5))
				{
					g.drawString("" + (index0 + 6), 25, (100 + (index0 * 15)));
					if(((_CurrentList[Std.int((_CurrentList.length - 1))][Std.int((index0 + 9))] == "T") || (_CurrentList[Std.int((_CurrentList.length - 1))][Std.int((index0 + 9))] == "F")))
					{
						if(((index0 + 9) < 12))
						{
							g.drawString("" + _CurrentList[Std.int((_CurrentList.length - 1))][Std.int((index0 + 9))], 35, (100 + (index0 * 15)));
						}
						else
						{
							g.drawString("" + _CurrentList[Std.int((_CurrentList.length - 1))][Std.int((index0 + 9))], 40, (100 + (index0 * 15)));
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