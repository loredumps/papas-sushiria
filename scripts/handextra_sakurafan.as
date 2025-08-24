package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="handextra_sakurafan")]
   public dynamic class handextra_sakurafan extends MovieClip
   {
       
      
      public function handextra_sakurafan()
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
