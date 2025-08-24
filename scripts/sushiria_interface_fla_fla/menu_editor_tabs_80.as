package sushiria_interface_fla_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="sushiria_interface_fla_fla.menu_editor_tabs_80")]
   public dynamic class menu_editor_tabs_80 extends MovieClip
   {
       
      
      public var body_btn:SimpleButton;
      
      public var clothes_btn:SimpleButton;
      
      public var newstar:MovieClip;
      
      public var stats_btn:SimpleButton;
      
      public function menu_editor_tabs_80()
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
