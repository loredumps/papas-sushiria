package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="saveBackupMC")]
   public dynamic class saveBackupMC extends MovieClip
   {
       
      
      public function saveBackupMC()
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
