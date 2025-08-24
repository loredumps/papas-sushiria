package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_balloon")]
   public dynamic class handextra_balloon extends MovieClip
   {
       
      
      public var prize:MovieClip;
      
      public function handextra_balloon()
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
