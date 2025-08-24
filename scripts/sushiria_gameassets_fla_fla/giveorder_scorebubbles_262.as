package sushiria_gameassets_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="sushiria_gameassets_fla_fla.giveorder_scorebubbles_262")]
   public dynamic class giveorder_scorebubbles_262 extends MovieClip
   {
       
      
      public var build_score:MovieClip;
      
      public var cook_score:MovieClip;
      
      public var order_score:MovieClip;
      
      public var perfect:MovieClip;
      
      public var tea_score:MovieClip;
      
      public var total_score:MovieClip;
      
      public function giveorder_scorebubbles_262()
      {
         super();
         addFrameScript(92,this.frame93,107,this.frame108);
      }
      
      internal function frame93() : *
      {
         this.perfect.gotoAndPlay("fireworks");
      }
      
      internal function frame108() : *
      {
         stop();
      }
   }
}
