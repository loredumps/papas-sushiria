package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.getTimer;
   import package_2.*;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.models.HotshotEnemy;
   
   public class MiniGameHotshot extends MiniGame
   {
      
      private static const _2PI:Number = Math.PI * 2;
       
      
      public var chilifeathersHit:Number = 0;
      
      public var whichDifficulty:Number = 1;
      
      public var isIntro:Boolean = true;
      
      public var earlyIntroTimer:Number = 0;
      
      public var earlyIntroMax:Number = 30;
      
      public var introTimer:Number = 0;
      
      public var introTimerMax:Number = 75;
      
      public var gameTimer:Number = 0;
      
      public var lastTime:Number = 0;
      
      public var splatMC:MovieClip;
      
      public var splatBMP:BitmapData;
      
      public var splatBitmap:Bitmap;
      
      public var enemiesHit:Number = 0;
      
      public var totalEnemies:Number = 0;
      
      public var needToHit:Number = 0;
      
      public var hittingSignDir:Number = 0;
      
      public var hitSignTime:Number = 0;
      
      public var hittingSign:Boolean = false;
      
      public var isDone:Boolean = false;
      
      public var doneTimer:Number = 0;
      
      public var doneTimerMax:Number = 45;
      
      public var enemies:Vector.<HotshotEnemy>;
      
      public var hitAmounts:Array;
      
      public var enemySets:Array;
      
      public function MiniGameHotshot(param1:MiniGameScreen, param2:MovieClip, param3:String)
      {
         this.hitAmounts = [0,10,11,10,10,12,15,13,11,11,15,15,22,19,21];
         this.enemySets = [[],[new HotshotEnemy(5,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,256,330),new HotshotEnemy(20,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,344,320),new HotshotEnemy(60,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,55,236),new HotshotEnemy(100,60,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,469,327),new HotshotEnemy(120,60,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,556,322),new HotshotEnemy(140,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,700,260,582,194,-50),new HotshotEnemy(170,40,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,320,-300,320,-99),new HotshotEnemy(200,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(230,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(250,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,55,236)],[new HotshotEnemy(5,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,163,229),new HotshotEnemy(15,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,462,326),new HotshotEnemy(25,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,259,326),new HotshotEnemy(35,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,562,203),new HotshotEnemy(45,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,361,234),new HotshotEnemy(75,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,true,-50,220,660,220),new HotshotEnemy(95,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,true,-50,220,660,220),new HotshotEnemy(115,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,true,-50,220,660,220),new HotshotEnemy(96,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,320),new HotshotEnemy(116,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,320),new HotshotEnemy(135,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,320),new HotshotEnemy(136,120,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,-150,-99,700,-99),new HotshotEnemy(210,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,-139,177,20,139,80)],[new HotshotEnemy(5,90,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(30,100,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,660,330,-50,330,0,100,30),new HotshotEnemy(70,100,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,690,330,-50,330,0,90,28),new HotshotEnemy(110,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,511,367,483,236,-10),new HotshotEnemy(130,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,-26,338,124,318),new HotshotEnemy(170,30,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,303,-300,303,-147),new HotshotEnemy(180,30,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,439,-300,439,-188),new HotshotEnemy(195,30,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,238,-300,238,-37),new HotshotEnemy(215,40,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,280,447,280,447,0,230,40),new HotshotEnemy(225,40,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,true,460,447,460,447,0,300,40),new HotshotEnemy(245,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,-50,330,660,330,0,150,20)],[new HotshotEnemy(5,40,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,327,222),new HotshotEnemy(20,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(60,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(80,120,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-99,-150,-99),new HotshotEnemy(110,110,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-130,-150,-130),new HotshotEnemy(150,40,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_POPUP,false,327,212),new HotshotEnemy(180,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,320,330,-50,330),new HotshotEnemy(195,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,320,330,660,330),new HotshotEnemy(220,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,320,330,-50,330),new HotshotEnemy(235,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,320,330,660,330),new HotshotEnemy(260,40,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_POPUP,false,693,186,589,136,-50)],[new HotshotEnemy(5,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,292,349,222,235,-30),new HotshotEnemy(10,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,286,210),new HotshotEnemy(15,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,265,338,347,245,40),new HotshotEnemy(50,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,true,286,215),new HotshotEnemy(70,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,286,320),new HotshotEnemy(80,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(90,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(100,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(110,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(120,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(95,20,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,180,-300,180,-120),new HotshotEnemy(120,20,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,320,-300,320,-99),new HotshotEnemy(145,20,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,460,-300,460,-120),new HotshotEnemy(180,60,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330)],[new HotshotEnemy(5,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,117,299,65,168,-20),new HotshotEnemy(15,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,213,340,242,206,10),new HotshotEnemy(25,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,156,143),new HotshotEnemy(35,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,530,297,504,159,-10),new HotshotEnemy(45,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,332,265),new HotshotEnemy(55,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,466,347,427,223,-15),new HotshotEnemy(60,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,112,340),new HotshotEnemy(65,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,595,144),new HotshotEnemy(70,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,555,340),new HotshotEnemy(100,50,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,true,253,340,465,340,0,150,25),new HotshotEnemy(140,100,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,-150,-79,700,-79),new HotshotEnemy(200,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,117,299,65,168,-20),new HotshotEnemy(201,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,595,144),new HotshotEnemy(210,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,156,143),new HotshotEnemy(211,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,530,297,504,159,-10),new HotshotEnemy(220,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,213,340,242,206,10),new HotshotEnemy(221,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,466,347,427,223,-15),new HotshotEnemy(230,50,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,332,265)],[new HotshotEnemy(5,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,384,306,356,167,-10),new HotshotEnemy(10,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,451,155),new HotshotEnemy(15,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,569,205),new HotshotEnemy(50,20,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,264,-300,264,-150),new HotshotEnemy(70,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,true,9,456,87,244,25),new HotshotEnemy(85,80,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-170,-150,-170),new HotshotEnemy(100,90,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,690,330),new HotshotEnemy(105,100,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,690,330),new HotshotEnemy(110,110,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,690,330),new HotshotEnemy(160,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,true,365,262,660,262,0,100,35),new HotshotEnemy(190,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,46,255),new HotshotEnemy(198,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,204,334),new HotshotEnemy(206,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,121,318),new HotshotEnemy(215,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,390,345),new HotshotEnemy(220,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,true,475,230)],[new HotshotEnemy(5,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-34,29,324,440,10),new HotshotEnemy(50,80,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-120,-150,-120),new HotshotEnemy(70,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,339,255,415,168,40),new HotshotEnemy(80,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,275,223,188,139,-40),new HotshotEnemy(100,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(115,80,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,-150,-120,700,-120),new HotshotEnemy(116,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,660,330,-50,330,0,120,25),new HotshotEnemy(170,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,-2,241,84,151,40),new HotshotEnemy(180,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,406,342,486,239,40),new HotshotEnemy(220,30,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,488,-300,488,-174),new HotshotEnemy(235,30,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,209,-300,209,-123),new HotshotEnemy(250,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,344,327)],[new HotshotEnemy(5,80,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,-150,-125,700,-125),new HotshotEnemy(35,85,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,true,-150,-105,700,-105),new HotshotEnemy(75,80,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,-150,-125,700,-125),new HotshotEnemy(76,100,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,660,330,-50,330,0,100,30),new HotshotEnemy(100,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,true,204,350,124,330),new HotshotEnemy(120,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,490,252,377,143,-40),new HotshotEnemy(125,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,477,309,377,231,-50),new HotshotEnemy(130,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,448,346,340,295,-60),new HotshotEnemy(160,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,437,271,528,138,35),new HotshotEnemy(170,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,459,330,530,241,35),new HotshotEnemy(180,100,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,-50,330,660,330,0,100,30),new HotshotEnemy(200,30,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,575,-300,575,-122),new HotshotEnemy(230,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,true,204,350,314,330)],[new HotshotEnemy(5,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,-50,330,660,330,0,100,30),new HotshotEnemy(25,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,660,330,-50,330,0,120,25),new HotshotEnemy(45,75,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,-50,330,660,330,0,110,20),new HotshotEnemy(60,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,660,330,-50,330,0,120,25),new HotshotEnemy(100,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,true,336,284),new HotshotEnemy(105,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,552,262),new HotshotEnemy(110,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,-16,406,80,265,35),new HotshotEnemy(130,80,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-125,-150,-125),new HotshotEnemy(150,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,424,326),new HotshotEnemy(151,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,63,252,136,156,30),new HotshotEnemy(153,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,230,326),new HotshotEnemy(170,80,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(190,70,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-120,-150,-120),new HotshotEnemy(220,30,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,552,262),new HotshotEnemy(235,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,63,252,136,156,30),new HotshotEnemy(260,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,424,326),new HotshotEnemy(261,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,230,326)],[new HotshotEnemy(5,100,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,660,330,-50,330,0,100,30),new HotshotEnemy(20,100,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,660,330,-50,330,0,90,25),new HotshotEnemy(50,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,88,86,61,209,190),new HotshotEnemy(55,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,173,84,173,204,180),new HotshotEnemy(60,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,155,96,243,174,130),new HotshotEnemy(65,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,151,87,281,104,100),new HotshotEnemy(70,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,558,284,582,158,10),new HotshotEnemy(75,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,515,291,486,156,-10),new HotshotEnemy(80,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,488,334,416,224,-25),new HotshotEnemy(100,90,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(130,90,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(160,80,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-170,-150,-170),new HotshotEnemy(200,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,88,86,61,209,190),new HotshotEnemy(201,25,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,173,84,173,204,180),new HotshotEnemy(202,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,155,96,243,174,130),new HotshotEnemy(203,35,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,151,87,281,104,100),new HotshotEnemy(220,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,660,330,-50,330,0,90,15)],[new HotshotEnemy(5,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,true,660,299,-50,299,0,100,35),new HotshotEnemy(35,50,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,true,660,299,-50,299,0,100,30),new HotshotEnemy(55,70,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,-50,330,660,330,0,100,22),new HotshotEnemy(90,15,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,true,670,242,530,242),new HotshotEnemy(110,15,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,true,5,300,104,227,25),new HotshotEnemy(120,80,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-155,-150,-155),new HotshotEnemy(160,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,306,346,260,227,-20),new HotshotEnemy(165,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,333,212),new HotshotEnemy(168,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,411,228),new HotshotEnemy(171,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,492,232),new HotshotEnemy(175,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(181,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(187,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(193,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(193,70,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-135,-150,-135),new HotshotEnemy(255,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,123,324),new HotshotEnemy(256,32,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,200,320),new HotshotEnemy(257,34,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,286,324),new HotshotEnemy(258,36,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,366,304),new HotshotEnemy(259,38,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,440,324),new HotshotEnemy(260,40,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,517,334),new HotshotEnemy(305,50,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,true,430,340,432,340,0,210,50),new HotshotEnemy(310,26,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,306,346,260,227,-20),new HotshotEnemy(312,27,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,333,212),new HotshotEnemy(314,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,411,228),new HotshotEnemy(316,29,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,492,232)],[new HotshotEnemy(5,70,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,700,-188,-150,-188),new HotshotEnemy(35,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,258,234),new HotshotEnemy(39,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,180,233),new HotshotEnemy(43,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,101,245),new HotshotEnemy(60,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,430,359,502,266,30),new HotshotEnemy(65,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,394,270,466,158,30),new HotshotEnemy(90,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(95,75,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,-50,330,660,330,0,100,50),new HotshotEnemy(105,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(110,75,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,true,-50,330,660,330,0,100,50),new HotshotEnemy(130,15,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,true,218,-300,218,-136),new HotshotEnemy(135,15,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,true,85,-300,85,-87),new HotshotEnemy(165,15,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,true,575,-300,575,-87),new HotshotEnemy(180,35,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,110,322),new HotshotEnemy(185,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,217,247),new HotshotEnemy(195,60,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,660,330,-50,330),new HotshotEnemy(210,70,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,-150,-128,700,-128),new HotshotEnemy(250,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,258,234),new HotshotEnemy(254,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,180,233),new HotshotEnemy(258,28,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,101,245),new HotshotEnemy(275,75,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,435,330,660,330,0,150,20),new HotshotEnemy(276,85,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,435,330,-50,330,0,150,20)],[new HotshotEnemy(5,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,646,328,534,199,-30),new HotshotEnemy(10,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,112,405,178,237,20),new HotshotEnemy(15,28,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,411,-300,411,-146),new HotshotEnemy(20,20,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_POPUP,false,296,-300,296,-114),new HotshotEnemy(50,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(56,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(62,75,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_WALK,false,-50,330,660,330),new HotshotEnemy(110,16,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,290,338,247,220,-10),new HotshotEnemy(116,16,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,324,205),new HotshotEnemy(122,16,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,342,348,392,232,20),new HotshotEnemy(140,75,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,-50,330,660,330,0,130,30),new HotshotEnemy(170,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,612,220,535,154,-40),new HotshotEnemy(175,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,599,272,490,219,-60),new HotshotEnemy(186,20,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,127,332,175,215,15),new HotshotEnemy(210,70,null,HotshotEnemy.TYPE_FLYER,HotshotEnemy.ACTION_FLY,false,-150,-128,700,-128),new HotshotEnemy(235,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,458,332),new HotshotEnemy(240,20,null,HotshotEnemy.TYPE_GUAC,HotshotEnemy.ACTION_POPUP,false,249,330),new HotshotEnemy(260,75,null,HotshotEnemy.TYPE_PINTO,HotshotEnemy.ACTION_JUMP,false,-50,330,660,330,0,130,30),new HotshotEnemy(320,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,612,220,535,154,-40),new HotshotEnemy(322,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,599,272,490,219,-60),new HotshotEnemy(324,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,false,127,332,175,215,15),new HotshotEnemy(326,30,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,290,338,247,220,-10),new HotshotEnemy(328,32,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,324,205),new HotshotEnemy(330,34,null,HotshotEnemy.TYPE_PEPPER,HotshotEnemy.ACTION_POPUP,true,342,348,392,232,20)]];
         super(param1,param2,param3);
      }
      
      override public function setupScreen() : void
      {
         var _loc1_:MiniGameHotshot = this;
         _loc1_.clip = new minigameHotshotMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.screen.setTitle("Soda Shot");
         _loc1_.setupPrizes(_loc1_.type);
         _loc1_.screen.updateStars();
         _loc1_.clip.reticule.mouseEnabled = false;
         _loc1_.clip.reticule.mouseChildren = false;
         _loc1_.clip.gun.mouseEnabled = false;
         _loc1_.clip.gun.mouseChildren = false;
         _loc1_.splatMC = new minigame_hotshot_wallsplat();
         _loc1_.clip.particles.mouseEnabled = false;
         _loc1_.clip.particles.mouseChildren = false;
         _loc1_.clip.jet.mouseEnabled = false;
         _loc1_.clip.jet.mouseChildren = false;
         _loc1_.clip.jet.gotoAndStop(2);
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         _loc1_.reset();
      }
      
      public function reset(param1:MouseEvent = null) : void
      {
         var _loc2_:MiniGameHotshot = this;
         _loc2_.decideDifficulty();
         _loc2_.needToHit = _loc2_.hitAmounts[_loc2_.whichDifficulty];
         _loc2_.clip.counter.inside.num_txt.text = String(_loc2_.needToHit);
         _loc2_.clip.counter.inside.rotationX = 0;
         _loc2_.clip.counter.inside.rotationY = 0;
         _loc2_.clip.counter.inside.rotationZ = 0;
         _loc2_.clip.counter.shadow.rotationX = 0;
         _loc2_.clip.counter.shadow.rotationY = 0;
         _loc2_.clip.counter.shadow.rotationZ = 0;
         _loc2_.clip.gotoAndStop(_loc2_.whichDifficulty);
         _loc2_.clip.ground.gotoAndStop((_loc2_.whichDifficulty - 1) % 3 + 1);
         if(_loc2_.splatBMP)
         {
            _loc2_.splatBMP.fillRect(_loc2_.splatBMP.rect,0);
         }
         else
         {
            _loc2_.splatBMP = new BitmapData(640,480,true,0);
            _loc2_.splatBitmap = new Bitmap(_loc2_.splatBMP);
            _loc2_.clip.bgsplatholder.addChild(_loc2_.splatBitmap);
            _loc2_.clip.bgsplatholder.mouseEnabled = false;
            _loc2_.clip.bgsplatholder.mouseChildren = false;
         }
         _loc2_.clip.gun.particles.gotoAndStop(_loc2_.clip.gun.particles.totalFrames);
         _loc2_.setupEnemies();
         _loc2_.isIntro = true;
         _loc2_.introTimer = 0;
         _loc2_.gameTimer = 0;
         _loc2_.enemiesHit = 0;
         _loc2_.hittingSignDir = 0;
         _loc2_.hittingSign = false;
         _loc2_.clip.hits_txt.text = "Hit 0/" + _loc2_.totalEnemies;
         _loc2_.clip.need_txt.text = "Need " + _loc2_.needToHit;
      }
      
      public function setupEnemies() : void
      {
         var _loc3_:HotshotEnemy = null;
         var _loc1_:MiniGameHotshot = this;
         var _loc2_:int = 0;
         if(_loc1_.enemies != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.enemies.length)
            {
               _loc1_.enemies[_loc2_].destroy();
               _loc1_.enemies[_loc2_] = null;
               _loc2_++;
            }
         }
         _loc1_.enemies = null;
         _loc1_.enemies = new Vector.<HotshotEnemy>();
         _loc1_.totalEnemies = 0;
         _loc1_.enemiesHit = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.enemySets[_loc1_.whichDifficulty].length)
         {
            _loc3_ = _loc1_.enemySets[_loc1_.whichDifficulty][_loc2_].clone(_loc1_);
            _loc1_.enemies.push(_loc3_);
            ++_loc1_.totalEnemies;
            _loc2_++;
         }
      }
      
      public function removeEnemy(param1:HotshotEnemy) : void
      {
         var _loc2_:MiniGameHotshot = this;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.enemies.length)
         {
            if(_loc2_.enemies[_loc3_] == param1)
            {
               _loc2_.enemies[_loc3_].destroy();
               _loc2_.enemies.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
      }
      
      public function addSplat(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc4_:MiniGameHotshot;
         (_loc4_ = this).splatMC.x = param1;
         _loc4_.splatMC.y = param2;
         _loc4_.splatMC.gotoAndStop(Math.ceil(Math.random() * _loc4_.splatMC.totalFrames));
         _loc4_.splatMC.scaleX = 0.5 + Math.random() * 0.5;
         _loc4_.splatMC.scaleY = _loc4_.splatMC.scaleX;
         _loc4_.splatMC.rotation = Math.random() * 360;
         if(param3)
         {
            _loc4_.splatBMP.draw(_loc4_.splatMC,_loc4_.splatMC.transform.matrix);
         }
      }
      
      public function decideDifficulty() : void
      {
         var _loc1_:MiniGameHotshot = this;
         var _loc2_:Number = _loc1_.getStartingLevel();
         if(_loc2_ < 14)
         {
            _loc1_.whichDifficulty = _loc2_ + 1;
         }
         else
         {
            _loc1_.whichDifficulty = Math.ceil(Math.random() * 14);
         }
      }
      
      public function checkSuccess() : void
      {
         var _loc1_:MiniGameHotshot = this;
         if(_loc1_.enemiesHit >= _loc1_.needToHit)
         {
            _loc1_.decidePrize();
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_happy.wav");
         }
         else
         {
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
            if(_loc1_.enemiesHit > 0)
            {
               _loc1_.amountToWin = _loc1_.enemiesHit * 10;
               _loc1_.skuToWin = "tips";
               _loc1_.skuIsClothing = false;
               _loc1_.skuClothingMode = "";
            }
            else
            {
               _loc1_.skuToWin = null;
               _loc1_.amountToWin = 0;
               _loc1_.skuIsClothing = false;
               _loc1_.skuClothingMode = "";
            }
         }
      }
      
      override public function updateScreen() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc1_:MiniGameHotshot = this;
         _loc1_.updateGun();
         if(_loc1_.isIntro)
         {
            if(_loc1_.earlyIntroTimer < _loc1_.earlyIntroMax)
            {
               ++_loc1_.earlyIntroTimer;
            }
            else
            {
               ++_loc1_.introTimer;
               _loc3_ = 20;
               _loc4_ = _loc1_.introTimer;
               if(_loc1_.introTimer <= _loc3_)
               {
                  _loc1_.clip.counter.y = _loc1_.easeOut(_loc4_,-200,317,_loc3_,15,20);
               }
               else if(_loc1_.introTimer >= _loc1_.introTimerMax - _loc3_)
               {
                  _loc4_ = _loc1_.introTimer - (_loc1_.introTimerMax - _loc3_);
                  _loc1_.clip.counter.y = _loc1_.easeIn(_loc4_,117,-317,_loc3_,15,20);
               }
               if(_loc1_.hittingSign)
               {
                  _loc5_ = 600;
                  _loc6_ = getTimer() - _loc1_.hitSignTime;
                  _loc7_ = 50 * (1 - Math.abs(_loc1_.hittingSignDir));
                  _loc8_ = 50 * _loc1_.hittingSignDir * -1;
                  _loc9_ = 0;
                  _loc10_ = _loc5_ / 4;
                  if(_loc6_ < _loc5_ / 4)
                  {
                     _loc9_ = _loc6_;
                     _loc1_.clip.counter.inside.rotationX = _loc1_.quadEaseOut(_loc9_,0,_loc7_,_loc10_);
                     _loc1_.clip.counter.shadow.rotationX = _loc1_.quadEaseOut(_loc9_,0,_loc7_ / 2,_loc10_);
                     _loc1_.clip.counter.inside.rotationY = _loc1_.quadEaseOut(_loc9_,0,_loc8_,_loc10_);
                     _loc1_.clip.counter.shadow.rotationY = _loc1_.quadEaseOut(_loc9_,0,_loc8_ / 2,_loc10_);
                  }
                  else if(_loc6_ <= _loc5_ / 2)
                  {
                     _loc9_ = _loc6_ - _loc5_ / 4;
                     _loc1_.clip.counter.inside.rotationX = _loc1_.quadEaseIn(_loc9_,_loc7_,0 - _loc7_,_loc10_);
                     _loc1_.clip.counter.shadow.rotationX = _loc1_.quadEaseIn(_loc9_,_loc7_ / 2,0 - _loc7_ / 2,_loc10_);
                     _loc1_.clip.counter.inside.rotationY = _loc1_.quadEaseIn(_loc9_,_loc8_,0 - _loc8_,_loc10_);
                     _loc1_.clip.counter.shadow.rotationY = _loc1_.quadEaseIn(_loc9_,_loc8_ / 2,0 - _loc8_ / 2,_loc10_);
                  }
                  else if(_loc6_ <= 0.75 * _loc5_)
                  {
                     _loc9_ = _loc6_ - _loc5_ / 2;
                     _loc1_.clip.counter.inside.rotationX = _loc1_.quadEaseOut(_loc9_,0,0 - _loc7_ / 3,_loc10_);
                     _loc1_.clip.counter.shadow.rotationX = _loc1_.quadEaseOut(_loc9_,0,0 - _loc7_ / 6,_loc10_);
                     _loc1_.clip.counter.inside.rotationY = _loc1_.quadEaseOut(_loc9_,0,0 - _loc8_ / 3,_loc10_);
                     _loc1_.clip.counter.shadow.rotationY = _loc1_.quadEaseOut(_loc9_,0,0 - _loc8_ / 6,_loc10_);
                  }
                  else if(_loc6_ <= _loc5_)
                  {
                     _loc9_ = _loc6_ - 0.75 * _loc5_;
                     _loc1_.clip.counter.inside.rotationX = _loc1_.quadEaseIn(_loc9_,0 - _loc7_ / 3,_loc7_ / 3,_loc10_);
                     _loc1_.clip.counter.shadow.rotationX = _loc1_.quadEaseIn(_loc9_,0 - _loc7_ / 6,_loc7_ / 6,_loc10_);
                     _loc1_.clip.counter.inside.rotationY = _loc1_.quadEaseIn(_loc9_,0 - _loc8_ / 3,_loc8_ / 3,_loc10_);
                     _loc1_.clip.counter.shadow.rotationY = _loc1_.quadEaseIn(_loc9_,0 - _loc8_ / 6,_loc8_ / 6,_loc10_);
                  }
               }
               if(_loc1_.introTimer >= _loc1_.introTimerMax)
               {
                  _loc1_.hittingSignDir = 0;
                  _loc1_.clip.counter.y = -200;
                  _loc1_.isIntro = false;
               }
            }
         }
         else if(_loc1_.isDone)
         {
            ++_loc1_.doneTimer;
            if(_loc1_.doneTimer == _loc1_.doneTimerMax)
            {
               if(_loc1_.chilifeathersHit > 0)
               {
                  class_6.method_1("Hit " + _loc1_.chilifeathersHit + " Chilifeathers");
                  _loc1_.screen.gameObj.var_136.recordTagged("chilifeather",_loc1_.chilifeathersHit);
               }
               _loc1_.screen.finishMiniGame(_loc1_.skuToWin,_loc1_.amountToWin,_loc1_.skuIsClothing,_loc1_.skuClothingMode);
            }
         }
         else if((_loc1_.enemies.length == 0 || _loc1_.gameTimer > 420) && !_loc1_.isDone)
         {
            _loc1_.checkSuccess();
            _loc1_.isDone = true;
         }
         else
         {
            ++_loc1_.gameTimer;
            _loc2_ = int(_loc1_.enemies.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.enemies.length > _loc2_)
               {
                  _loc1_.enemies[_loc2_].updateEnemy();
               }
               _loc2_--;
            }
         }
      }
      
      public function easeIn(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 15, param6:Number = 10) : Number
      {
         var _loc7_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         if((param1 = param1 / param4) == 1)
         {
            return param2 + param3;
         }
         if(!param6)
         {
            param6 = param4 * 0.3;
         }
         if(!param5 || param3 > 0 && param5 < param3 || param3 < 0 && param5 < -param3)
         {
            param5 = param3;
            _loc7_ = param6 / 4;
         }
         else
         {
            _loc7_ = param6 / _2PI * Math.asin(param3 / param5);
         }
         return -(param5 * Math.pow(2,10 * (param1 = param1 - 1)) * Math.sin((param1 * param4 - _loc7_) * _2PI / param6)) + param2;
      }
      
      public function easeOut(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 15, param6:Number = 10) : Number
      {
         var _loc7_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         if((param1 = param1 / param4) == 1)
         {
            return param2 + param3;
         }
         if(!param6)
         {
            param6 = param4 * 0.3;
         }
         if(!param5 || param3 > 0 && param5 < param3 || param3 < 0 && param5 < -param3)
         {
            param5 = param3;
            _loc7_ = param6 / 4;
         }
         else
         {
            _loc7_ = param6 / _2PI * Math.asin(param3 / param5);
         }
         return param5 * Math.pow(2,-10 * param1) * Math.sin((param1 * param4 - _loc7_) * _2PI / param6) + param3 + param2;
      }
      
      public function quadEaseIn(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return param3 * (param1 = param1 / param4) * param1 + param2;
      }
      
      public function quadEaseOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return -param3 * (param1 = param1 / param4) * (param1 - 2) + param2;
      }
      
      public function updateGun() : void
      {
         var _loc1_:MiniGameHotshot = this;
         _loc1_.clip.reticule.x = _loc1_.clip.mouseX;
         _loc1_.clip.reticule.y = _loc1_.clip.mouseY;
         var _loc2_:Number = _loc1_.clip.mouseX / 640;
         var _loc3_:Number = _loc1_.clip.mouseY / 480;
         _loc1_.clip.gun.gotoAndStop(Math.ceil(_loc2_ * 20));
         _loc1_.clip.gun.y = 360 + _loc3_ * 30;
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc11_:int = 0;
         var _loc2_:MiniGameHotshot = this;
         _loc2_.screen.gameObj.var_128.playSound("hotshotsquirt.wav");
         _loc2_.clip.gun.middle.gotoAndPlay("squirt");
         _loc2_.clip.gun.logo.gotoAndPlay("squirt");
         _loc2_.clip.gun.particles.gotoAndPlay(1);
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if(param1.target is MovieClip && (MovieClip(param1.target).parent == _loc2_.clip.enemyholder || MovieClip(param1.target).parent == _loc2_.clip.bgenemyholder))
         {
            _loc3_ = true;
         }
         if(_loc3_)
         {
            _loc11_ = 0;
            while(_loc11_ < _loc2_.enemies.length)
            {
               if(_loc2_.enemies[_loc11_].checkHittingEnemy(_loc2_.clip.mouseX,_loc2_.clip.mouseY))
               {
                  _loc4_ = true;
                  ++_loc2_.enemiesHit;
                  if(_loc2_.enemies[_loc11_].type == HotshotEnemy.TYPE_FLYER)
                  {
                     ++_loc2_.chilifeathersHit;
                  }
                  break;
               }
               _loc11_++;
            }
         }
         if(_loc2_.isIntro && Boolean(_loc2_.clip.counter.inside.hitTestPoint(_loc2_.clip.mouseX,_loc2_.clip.mouseY,true)))
         {
            _loc2_.clip.particles.x = _loc2_.clip.mouseX;
            _loc2_.clip.particles.y = _loc2_.clip.mouseY;
            if(Math.random() < 0.5)
            {
               _loc2_.clip.particles.scaleX *= -1;
            }
            _loc2_.clip.particles.gotoAndPlay(1);
            _loc2_.hitSignTime = getTimer();
            _loc2_.hittingSign = true;
            _loc2_.hittingSignDir = _loc2_.clip.counter.mouseX / (_loc2_.clip.counter.width / 2);
         }
         else if(!_loc4_)
         {
            _loc2_.addSplat(_loc2_.clip.mouseX,_loc2_.clip.mouseY);
         }
         else
         {
            _loc2_.clip.particles.x = _loc2_.clip.mouseX;
            _loc2_.clip.particles.y = _loc2_.clip.mouseY;
            if(Math.random() < 0.5)
            {
               _loc2_.clip.particles.scaleX *= -1;
            }
            _loc2_.clip.particles.gotoAndPlay(1);
         }
         _loc2_.clip.jet.x = _loc2_.clip.mouseX;
         _loc2_.clip.jet.y = _loc2_.clip.mouseY;
         _loc2_.clip.jet.gotoAndPlay(1);
         var _loc5_:Number = _loc2_.clip.gun.x + _loc2_.clip.gun.particles.x;
         var _loc6_:Number = _loc2_.clip.gun.y + _loc2_.clip.gun.particles.y;
         var _loc7_:Number = _loc5_ - _loc2_.clip.jet.x;
         var _loc8_:Number = _loc6_ - _loc2_.clip.jet.y;
         var _loc9_:Number = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_);
         _loc2_.clip.jet.rotation = 0;
         _loc2_.clip.jet.height = _loc9_;
         var _loc10_:Number = Math.atan2(_loc8_,_loc7_);
         _loc2_.clip.jet.rotation = 270 + this.radsToDegrees(_loc10_);
         _loc2_.clip.hits_txt.text = "Hit " + _loc2_.enemiesHit + "/" + _loc2_.totalEnemies;
         if(_loc4_)
         {
            _loc2_.screen.gameObj.var_128.playSound("minigame_hotshot_hit.wav");
         }
      }
      
      public function radsToDegrees(param1:Number) : Number
      {
         return param1 * 180 / Math.PI;
      }
      
      override public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:MiniGameHotshot = this;
         if(_loc1_.splatBMP)
         {
            _loc1_.splatBMP.dispose();
            _loc1_.splatBitmap.parent.removeChild(_loc1_.splatBitmap);
            _loc1_.splatBitmap = null;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.enemies.length)
         {
            _loc1_.enemies[_loc2_].destroy();
            _loc1_.enemies[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.enemies = null;
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
