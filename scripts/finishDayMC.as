package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="finishDayMC")]
   public dynamic class finishDayMC extends MovieClip
   {
       
      
      public var bg1:MovieClip;
      
      public var bg2:MovieClip;
      
      public var bg3:MovieClip;
      
      public var fg:MovieClip;
      
      public var luckycat:MovieClip;
      
      public var mg:MovieClip;
      
      public var river:MovieClip;
      
      public var workerholder:MovieClip;
      
      public function finishDayMC()
      {
         super();
         addFrameScript(99,this.frame100);
      }
      
      internal function frame100() : *
      {
         stop();
      }
   }
}
