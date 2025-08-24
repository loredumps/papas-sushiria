package sushiria_interface_fla_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="sushiria_interface_fla_fla.lobbyeditor_trainingoverlay_460")]
   public dynamic class lobbyeditor_trainingoverlay_460 extends MovieClip
   {
       
      
      public var close_btn:SimpleButton;
      
      public var next_btn:SimpleButton;
      
      public var prev_btn:SimpleButton;
      
      public function lobbyeditor_trainingoverlay_460()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
