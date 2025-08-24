package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="furni_cherryblossom_lamp")]
   public dynamic class furni_cherryblossom_lamp extends MovieClip
   {
       
      
      public function furni_cherryblossom_lamp()
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
