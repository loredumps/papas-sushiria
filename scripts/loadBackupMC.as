package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="loadBackupMC")]
   public dynamic class loadBackupMC extends MovieClip
   {
       
      
      public function loadBackupMC()
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
