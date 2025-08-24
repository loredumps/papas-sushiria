package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="popup_special_clip")]
   public dynamic class popup_special_clip extends MovieClip
   {
       
      
      public var extraclose_btn:SimpleButton;
      
      public var inside:MovieClip;
      
      public function popup_special_clip()
      {
         super();
         addFrameScript(9,this.frame10,19,this.frame20);
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         stop();
      }
   }
}
