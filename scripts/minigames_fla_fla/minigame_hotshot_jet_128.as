package minigames_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="minigames_fla_fla.minigame_hotshot_jet_128")]
   public dynamic class minigame_hotshot_jet_128 extends MovieClip
   {
       
      
      public function minigame_hotshot_jet_128()
      {
         super();
         addFrameScript(3,this.frame4);
      }
      
      internal function frame4() : *
      {
         stop();
      }
   }
}
