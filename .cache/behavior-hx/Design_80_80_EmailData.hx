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



class Design_80_80_EmailData extends ActorScript
{
	public var _space:String;
	public var _onereturn:String;
	public var _tworeturns:String;
	public var _mailto:String;
	public var _cc:String;
	public var _subject:String;
	public var _Level01Data:String;
	public var _Level02Data:String;
	public var _Level03Data:String;
	public var _Level04Data:String;
	public var _Level05Data:String;
	public var _Level06Data:String;
	public var _Level07Data:String;
	public var _Email01MailTo:String;
	public var _EmailLevels:String;
	public var _Level08Data:String;
	public var _Level09Data:String;
	public var _Level10Data:String;
	public var _Level11Data:String;
	public var _Level12Data:String;
	public var _Level13Data:String;
	public var _Level14Data:String;
	public var _Level15Data:String;
	public var _Level16Data:String;
	public var _Level17Data:String;
	public var _Level18Data:String;
	public var _Level19Data:String;
	public var _Level20Data:String;
	public var _Level21Data:String;
	public var _Level22Data:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("space", "_space");
		_space = "";
		nameMap.set("onereturn", "_onereturn");
		_onereturn = "";
		nameMap.set("tworeturns", "_tworeturns");
		_tworeturns = "";
		nameMap.set("mailto", "_mailto");
		_mailto = "";
		nameMap.set("cc", "_cc");
		_cc = "";
		nameMap.set("subject", "_subject");
		_subject = "";
		nameMap.set("Level01Data", "_Level01Data");
		_Level01Data = "";
		nameMap.set("Level02Data", "_Level02Data");
		_Level02Data = "";
		nameMap.set("Level03Data", "_Level03Data");
		_Level03Data = "";
		nameMap.set("Level04Data", "_Level04Data");
		_Level04Data = "";
		nameMap.set("Level05Data", "_Level05Data");
		_Level05Data = "";
		nameMap.set("Level06Data", "_Level06Data");
		_Level06Data = "";
		nameMap.set("Level07Data", "_Level07Data");
		_Level07Data = "";
		nameMap.set("Email-01-MailTo", "_Email01MailTo");
		_Email01MailTo = "";
		nameMap.set("Email-Levels", "_EmailLevels");
		_EmailLevels = "";
		nameMap.set("Level08Data", "_Level08Data");
		_Level08Data = "";
		nameMap.set("Level09Data", "_Level09Data");
		_Level09Data = "";
		nameMap.set("Level10Data", "_Level10Data");
		_Level10Data = "";
		nameMap.set("Level11Data", "_Level11Data");
		_Level11Data = "";
		nameMap.set("Level12Data", "_Level12Data");
		_Level12Data = "";
		nameMap.set("Level13Data", "_Level13Data");
		_Level13Data = "";
		nameMap.set("Level14Data", "_Level14Data");
		_Level14Data = "";
		nameMap.set("Level15Data", "_Level15Data");
		_Level15Data = "";
		nameMap.set("Level16Data", "_Level16Data");
		_Level16Data = "";
		nameMap.set("Level17Data", "_Level17Data");
		_Level17Data = "";
		nameMap.set("Level18Data", "_Level18Data");
		_Level18Data = "";
		nameMap.set("Level19Data", "_Level19Data");
		_Level19Data = "";
		nameMap.set("Level20Data", "_Level20Data");
		_Level20Data = "";
		nameMap.set("Level21Data", "_Level21Data");
		_Level21Data = "";
		nameMap.set("Level22Data", "_Level22Data");
		_Level22Data = "";
		
	}
	
	override public function init()
	{
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				/* This is  */
				_mailto = "Lemurama14@gmail.com";
				_cc = "bheagney@highpoint.edu";
				_subject = (((("Lemur") + (_space))) + ("Data"));
				/* We're going to write a single line of code to email, the single line of text is storted in "Email-Levels". */
				_Level01Data = "" + (Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>).length - 1))
					{
						_Level01Data = ((((_Level01Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L01Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level02Data = "" + (Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>).length - 1))
					{
						_Level02Data = ((((_Level02Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L02Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level03Data = "" + (Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>).length - 1))
					{
						_Level03Data = ((((_Level03Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L03Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level04Data = "" + (Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>).length - 1))
					{
						_Level04Data = ((((_Level04Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("Lo4Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level05Data = "" + (Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>).length - 1))
					{
						_Level05Data = ((((_Level05Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L05Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level06Data = "" + (Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>).length - 1))
					{
						_Level06Data = ((((_Level06Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L06Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level07Data = "" + (Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>).length - 1))
					{
						_Level07Data = ((((_Level07Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L07Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level08Data = "" + (Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>).length - 1))
					{
						_Level08Data = ((((_Level08Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L08Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level09Data = "" + (Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>).length - 1))
					{
						_Level09Data = ((((_Level09Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L09Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level10Data = "" + (Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>).length - 1))
					{
						_Level10Data = ((((_Level10Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L10Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level11Data = "" + (Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>).length - 1))
					{
						_Level11Data = ((((_Level11Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L11Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level12Data = "" + (Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>).length - 1))
					{
						_Level12Data = ((((_Level12Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L12Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level13Data = "" + (Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>).length - 1))
					{
						_Level13Data = ((((_Level13Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L13Date01") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level14Data = "" + (Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>).length - 1))
					{
						_Level14Data = ((((_Level14Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L14Date") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level15Data = "" + (Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>).length - 1))
					{
						_Level15Data = ((((_Level15Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L15Date") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level16Data = "" + (Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>).length - 1))
					{
						_Level16Data = ((((_Level16Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L16Date") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level17Data = "" + (Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>).length - 1))
					{
						_Level17Data = ((((_Level17Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L17Date") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level18Data = "" + (Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>).length - 1))
					{
						_Level18Data = ((_Level18Data) + (_onereturn));
						_Level18Data = ((((_Level18Data) + ("SET: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[1]));
						_Level18Data = ((((_Level18Data) + (" | DATE: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[0]));
						_Level18Data = ((((_Level18Data) + (" | TIME: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[2]));
						_Level18Data = ((_Level18Data) + (_onereturn));
						_Level18Data = ((((_Level18Data) + ("# OF TRIALS: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[3]));
						_Level18Data = ((((_Level18Data) + (" | # CORRECT: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[4]));
						_Level18Data = ((((_Level18Data) + (" | PERCENT CORRECT: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[5]));
						_Level18Data = ((_Level18Data) + (_onereturn));
						_Level18Data = ((((_Level18Data) + ("PERSEVERATIVE ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[6]));
						_Level18Data = ((((_Level18Data) + (" | PERCENT P ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[7]));
						_Level18Data = ((_Level18Data) + (_onereturn));
						_Level18Data = ((((_Level18Data) + ("NON-PERSEVERATIVE ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[8]));
						_Level18Data = ((((_Level18Data) + (" | TOTAL ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[9]));
						_Level18Data = ((((_Level18Data) + (" | PERCENT ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[10]));
						_Level18Data = ((_Level18Data) + (_onereturn));
						_Level18Data = ((((_Level18Data) + ("TRIALS TO COMPLETE FIRST CATEGORY: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[11]));
						_Level18Data = ((((_Level18Data) + (" | CATEGORIES ACHIEVED: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[12]));
						_Level18Data = ((_Level18Data) + (_onereturn));
						_Level18Data = ((((_Level18Data) + ("PERCENT CONCEPTUAL LEVEL RESPONSES: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[13]));
						_Level18Data = ((((_Level18Data) + (" | FAILURES TO MAINTAIN SET: "))) + ("" + ((Engine.engine.getGameAttribute("L18Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[14]));
						_Level18Data = ((_Level18Data) + (_onereturn));
					}
				}
				_Level19Data = "" + (Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>).length - 1))
					{
						_Level19Data = ((((_Level19Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L19Date") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level20Data = "" + (Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>).length - 1))
					{
						_Level20Data = ((((_Level20Data) + (_onereturn))) + ("" + (Engine.engine.getGameAttribute("L20Date") : Array<Dynamic>)[(index0 + 1)]));
					}
				}
				_Level21Data = "" + (Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[0];
				if(((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>).length > 1))
				{
					for(index0 in 0...((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>).length - 1))
					{
						_Level21Data = ((_Level21Data) + (_onereturn));
						_Level21Data = ((((_Level21Data) + ("SET: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[1]));
						_Level21Data = ((((_Level21Data) + (" | DATE: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[0]));
						_Level21Data = ((((_Level21Data) + (" | TIME: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[2]));
						_Level21Data = ((_Level21Data) + (_onereturn));
						_Level21Data = ((((_Level21Data) + ("# OF TRIALS: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[3]));
						_Level21Data = ((((_Level21Data) + (" | # CORRECT: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[4]));
						_Level21Data = ((((_Level21Data) + (" | PERCENT CORRECT: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[5]));
						_Level21Data = ((_Level21Data) + (_onereturn));
						_Level21Data = ((((_Level21Data) + ("PERSEVERATIVE ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[6]));
						_Level21Data = ((((_Level21Data) + (" | PERCENT P ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[7]));
						_Level21Data = ((_Level21Data) + (_onereturn));
						_Level21Data = ((((_Level21Data) + ("NON-PERSEVERATIVE ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[8]));
						_Level21Data = ((((_Level21Data) + (" | TOTAL ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[9]));
						_Level21Data = ((((_Level21Data) + (" | PERCENT ERRORS: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[10]));
						_Level21Data = ((_Level21Data) + (_onereturn));
						_Level21Data = ((((_Level21Data) + ("TRIALS TO COMPLETE FIRST CATEGORY: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[11]));
						_Level21Data = ((((_Level21Data) + (" | CATEGORIES ACHIEVED: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[12]));
						_Level21Data = ((_Level21Data) + (_onereturn));
						_Level21Data = ((((_Level21Data) + ("PERCENT CONCEPTUAL LEVEL RESPONSES: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[13]));
						_Level21Data = ((((_Level21Data) + (" | FAILURES TO MAINTAIN SET: "))) + ("" + ((Engine.engine.getGameAttribute("L21Date") : Array<Dynamic>)[(index0 + 1)] : Array<Dynamic>)[14]));
						_Level21Data = ((_Level21Data) + (_onereturn));
					}
				}
				_Email01MailTo = (((((((((("mailto:") + ("brianheagney@gmail.com"))) + ("?subject="))) + ("LemurData"))) + ("&cc=brianheagney@gmail.com"))) + ("&body="));
				_EmailLevels = ((((((((_Email01MailTo) + ("Level%20one%20Data"))) + (_onereturn))) + (_Level01Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20two%20Data"))) + (_onereturn))) + (_Level02Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20three%20Data"))) + (_onereturn))) + (_Level03Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20four%20Data"))) + (_onereturn))) + (_Level04Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20five%20Data"))) + (_onereturn))) + (_Level05Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20six%20Data"))) + (_onereturn))) + (_Level06Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20seven%20Data"))) + (_onereturn))) + (_Level07Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20eight%20Data"))) + (_onereturn))) + (_Level08Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20nine%20Data"))) + (_onereturn))) + (_Level09Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20ten%20Data"))) + (_onereturn))) + (_Level10Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20eleven%20Data"))) + (_onereturn))) + (_Level11Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20twelve%20Data"))) + (_onereturn))) + (_Level12Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20thirteen%20Data"))) + (_onereturn))) + (_Level13Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20fourteen%20Data"))) + (_onereturn))) + (_Level14Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20fifteen%20Data"))) + (_onereturn))) + (_Level15Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20sixteen%20Data"))) + (_onereturn))) + (_Level16Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20seventeen%20Data"))) + (_onereturn))) + (_Level17Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20eighteen%20Data"))) + (_onereturn))) + (_Level18Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20nineteen%20Data"))) + (_onereturn))) + (_Level19Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20twenty%20Data"))) + (_onereturn))) + (_Level20Data))) + (_tworeturns));
				_EmailLevels = ((((((((_EmailLevels) + ("Level%20twenty-one%20Data"))) + (_onereturn))) + (_Level21Data))) + (_tworeturns));
				openURLInBrowser(_EmailLevels);
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}