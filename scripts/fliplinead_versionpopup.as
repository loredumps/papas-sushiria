package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="fliplinead_versionpopup")]
   public dynamic class fliplinead_versionpopup extends MovieClip
   {
       
      
      public var close_btn:SimpleButton;
      
      public var link_btn:SimpleButton;
      
      public function fliplinead_versionpopup()
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
