package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="fliplinead_versionbox")]
   public dynamic class fliplinead_versionbox extends MovieClip
   {
       
      
      public var update_btn:SimpleButton;
      
      public var version_txt:TextField;
      
      public function fliplinead_versionbox()
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
