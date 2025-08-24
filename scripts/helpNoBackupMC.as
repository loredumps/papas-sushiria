package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="helpNoBackupMC")]
   public dynamic class helpNoBackupMC extends MovieClip
   {
       
      
      public function helpNoBackupMC()
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
