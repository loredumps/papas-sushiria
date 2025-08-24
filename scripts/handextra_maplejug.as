package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_maplejug")]
   public dynamic class handextra_maplejug extends MovieClip
   {
       
      
      public function handextra_maplejug()
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
