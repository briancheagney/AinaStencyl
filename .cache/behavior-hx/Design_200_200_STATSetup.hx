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
		if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 1))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L01Score") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 2))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L02TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 3))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L03TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 4))
		{
			_CurrentList = (Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L04TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 5))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L05TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 6))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L06TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 7))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L07TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 8))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L08TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 9))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L09Col01TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 10))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L10Col02TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 11))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L11ColSwTotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 12))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L12ColSwNEWTotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 13))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L13Num01TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 14))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L14Num02TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 15))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L15NumSwTotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 16))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L16_2var_Color_TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 17))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L17_2var_Color_TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 18))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L18TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 19))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L19_2var_Shape_Num_TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 20))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L20TotalNum") : Float);
		}
		else if(((Engine.engine.getGameAttribute("LevelNumber") : Float) == 21))
		{
			_CurrentList = (Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>);
			_LevelTotalNum = (Engine.engine.getGameAttribute("L21TotalNum") : Float);
		}
		_GUIsetter = true;
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((_GUIsetter == true))
				{
					/* Draw Level */
					g.setFont(getFont(102));
					g.drawString("" + ("" + _CurrentList[0]), 0, 5);
					/* Draw Set */
					g.drawString("" + "Set: ", 0, 20);
					g.setFont(getFont(101));
					g.drawString("" + (_CurrentList.length - 1), 0, 21);
					g.setFont(getFont(102));
					/* Draw Trials */
					g.drawString("" + "Trial: ", 0, 59);
					g.setFont(getFont(101));
					g.drawString("" + ((Engine.engine.getGameAttribute("LevelTrial") : Float) + 1), 0, 60);
					g.setFont(getFont(102));
				}
				for(index0 in 0...5)
				{
					g.drawString("" + (index0 + 1), 0, (100 + (index0 * 15)));
					if((((_CurrentList[(_CurrentList.length - 1)] : Array<Dynamic>)[(index0 + 4)] == "T") || ((_CurrentList[(_CurrentList.length - 1)] : Array<Dynamic>)[(index0 + 4)] == "F")))
					{
						g.drawString("" + (_CurrentList[(_CurrentList.length - 1)] : Array<Dynamic>)[(index0 + 4)], 10, (100 + (index0 * 15)));
					}
				}
				for(index0 in 0...5)
				{
					g.drawString("" + (index0 + 6), 25, (100 + (index0 * 15)));
					if((((_CurrentList[(_CurrentList.length - 1)] : Array<Dynamic>)[(index0 + 9)] == "T") || ((_CurrentList[(_CurrentList.length - 1)] : Array<Dynamic>)[(index0 + 9)] == "F")))
					{
						if(((index0 + 9) < 12))
						{
							g.drawString("" + (_CurrentList[(_CurrentList.length - 1)] : Array<Dynamic>)[(index0 + 9)], 35, (100 + (index0 * 15)));
						}
						else
						{
							g.drawString("" + (_CurrentList[(_CurrentList.length - 1)] : Array<Dynamic>)[(index0 + 9)], 40, (100 + (index0 * 15)));
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