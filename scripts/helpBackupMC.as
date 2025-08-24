package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="helpBackupMC")]
   public dynamic class helpBackupMC extends MovieClip
   {
       
      
      public function helpBackupMC()
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
