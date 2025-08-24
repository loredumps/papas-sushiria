package sushiria_interface_fla_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="sushiria_interface_fla_fla.minigame_hud_504")]
   public dynamic class minigame_hud_504 extends MovieClip
   {
       
      
      public var count:MovieClip;
      
      public var stars:MovieClip;
      
      public var title_txt:TextField;
      
      public function minigame_hud_504()
      {
         super();
         addFrameScript(6,this.frame7);
      }
      
      internal function frame7() : *
      {
         stop();
      }
   }
}
