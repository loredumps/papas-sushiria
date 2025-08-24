package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="startDayPanelMC")]
   public dynamic class startDayPanelMC extends MovieClip
   {
       
      
      public var backdrop_holder:MovieClip;
      
      public var fader:MovieClip;
      
      public var outro_btn:SimpleButton;
      
      public function startDayPanelMC()
      {
         super();
         addFrameScript(9,this.frame10,20,this.frame21,24,this.frame25);
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         stop();
      }
      
      internal function frame25() : *
      {
         stop();
      }
   }
}
