package sushiGame.data
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   
   public class ClothingData
   {
       
      
      public var gameObj:class_5;
      
      public var mannequinColor:uint = 14540253;
      
      public var colorCodes:Array;
      
      public var mainPalette:Array;
      
      public var metalPalette:Array;
      
      public var neutralPalette:Array;
      
      public var denimPalette:Array;
      
      public var denimStitchSwitchColors:Array;
      
      public var holidayPalettes:Array;
      
      public var clothing:Array;
      
      public function ClothingData(param1:class_5)
      {
         this.colorCodes = [[ClothingItem.TINT_RED,"R"],[ClothingItem.TINT_ORANGE,"O"],[ClothingItem.TINT_YELLOW,"Y"],[ClothingItem.TINT_GREEN,"G"],[ClothingItem.TINT_BLUE,"B"],[ClothingItem.TINT_PURPLE,"V"],[ClothingItem.TINT_DARKRED,"DR"],[ClothingItem.TINT_SALMON,"SA"],[ClothingItem.TINT_BRIGHTGOLD,"BG"],[ClothingItem.TINT_LIGHTGREEN,"LG"],[ClothingItem.TINT_TEAL,"T"],[ClothingItem.TINT_DARKLAVENDER,"DL"],[ClothingItem.TINT_MAROON,"M"],[ClothingItem.TINT_BRONZE,"BZ"],[ClothingItem.TINT_LIGHTORANGE,"LO"],[ClothingItem.TINT_NEONGREEN,"NG"],[ClothingItem.TINT_LIGHTBLUE,"LB"],[ClothingItem.TINT_LAVENDER,"L"],[ClothingItem.TINT_PINK,"P"],[ClothingItem.TINT_KHAKI,"KH"],[ClothingItem.TINT_BURNTUMBER,"BU"],[ClothingItem.TINT_ARMYGREEN,"A"],[ClothingItem.TINT_PALEBRIGHTBLUE,"PBB"],[ClothingItem.TINT_STONEWASH,"ST"],[ClothingItem.TINT_LIGHTPINK,"LP"],[ClothingItem.TINT_BRASS,"BS"],[ClothingItem.TINT_BROWN,"BR"],[ClothingItem.TINT_LIMEGREEN,"LM"],[ClothingItem.TINT_PALEBLUE,"PB"],[ClothingItem.TINT_DENIM,"D"],[ClothingItem.TINT_CREAM,"C"],[ClothingItem.TINT_LIGHTBROWN,"LW"],[ClothingItem.TINT_DARKBROWN,"DB"],[ClothingItem.TINT_MINTGREEN,"MG"],[ClothingItem.TINT_LIGHTTEAL,"LT"],[ClothingItem.TINT_DUSTYBLUE,"DU"],[ClothingItem.TINT_GRAY,"GR"],[ClothingItem.TINT_MOCHA,"MO"],[ClothingItem.TINT_DARKKHAKI,"DK"],[ClothingItem.TINT_FORESTGREEN,"FG"],[ClothingItem.TINT_SEAFOAM,"S"],[ClothingItem.TINT_NAVYBLUE,"N"],[ClothingItem.TINT_DARKGRAY,"DG"],[ClothingItem.TINT_BEIGE,"BE"],[ClothingItem.TINT_STRAW,"SW"],[ClothingItem.TINT_LIGHTMINTGREEN,"LMG"],[ClothingItem.TINT_WHITE,"W"],[ClothingItem.TINT_BLACK,"K"],[ClothingItem.TINT_GOLD,"GO",true]];
         this.mainPalette = [];
         this.metalPalette = [ClothingItem.TINT_GRAY,ClothingItem.TINT_DARKGRAY,ClothingItem.TINT_CREAM,ClothingItem.TINT_BRASS,ClothingItem.TINT_BRONZE,ClothingItem.TINT_BRIGHTGOLD,ClothingItem.TINT_GOLD,ClothingItem.TINT_WHITE];
         this.neutralPalette = [ClothingItem.TINT_WHITE,ClothingItem.TINT_GRAY,ClothingItem.TINT_DARKGRAY,ClothingItem.TINT_BLACK,ClothingItem.TINT_CREAM];
         this.denimPalette = [ClothingItem.TINT_DENIM,ClothingItem.TINT_STONEWASH,ClothingItem.TINT_BLUE,ClothingItem.TINT_NAVYBLUE,ClothingItem.TINT_DUSTYBLUE,ClothingItem.TINT_WHITE,ClothingItem.TINT_DARKGRAY,ClothingItem.TINT_BLACK];
         this.denimStitchSwitchColors = [[1,ClothingItem.TINT_DENIM,2,ClothingItem.TINT_GOLD],[1,ClothingItem.TINT_STONEWASH,2,ClothingItem.TINT_GOLD],[1,ClothingItem.TINT_BLUE,2,ClothingItem.TINT_GOLD],[1,ClothingItem.TINT_NAVYBLUE,2,ClothingItem.TINT_GOLD],[1,ClothingItem.TINT_DUSTYBLUE,2,ClothingItem.TINT_BRASS],[1,ClothingItem.TINT_WHITE,2,ClothingItem.TINT_DARKGRAY],[1,ClothingItem.TINT_DARKGRAY,2,ClothingItem.TINT_BLACK],[1,ClothingItem.TINT_BLACK,2,ClothingItem.TINT_GOLD]];
         this.holidayPalettes = [[],[ClothingItem.TINT_PURPLE,ClothingItem.TINT_GREEN,ClothingItem.TINT_YELLOW,ClothingItem.TINT_MAROON],[ClothingItem.TINT_RED,ClothingItem.TINT_PINK,ClothingItem.TINT_WHITE],[ClothingItem.TINT_RED,ClothingItem.TINT_BRIGHTGOLD,ClothingItem.TINT_BLACK],[ClothingItem.TINT_LIGHTPINK,ClothingItem.TINT_LIGHTMINTGREEN,ClothingItem.TINT_WHITE],[ClothingItem.TINT_RED,ClothingItem.TINT_BRIGHTGOLD,ClothingItem.TINT_GREEN],[ClothingItem.TINT_YELLOW,ClothingItem.TINT_TEAL,ClothingItem.TINT_SEAFOAM,ClothingItem.TINT_WHITE],[ClothingItem.TINT_RED,ClothingItem.TINT_WHITE,ClothingItem.TINT_BLUE],[ClothingItem.TINT_PALEBRIGHTBLUE,ClothingItem.TINT_WHITE,ClothingItem.TINT_FORESTGREEN,ClothingItem.TINT_DARKKHAKI],[ClothingItem.TINT_BROWN,ClothingItem.TINT_YELLOW,ClothingItem.TINT_WHITE],[ClothingItem.TINT_ORANGE,ClothingItem.TINT_PURPLE,ClothingItem.TINT_BLACK],[ClothingItem.TINT_BROWN,ClothingItem.TINT_ORANGE,ClothingItem.TINT_YELLOW,ClothingItem.TINT_KHAKI,ClothingItem.TINT_MOCHA],[ClothingItem.TINT_RED,ClothingItem.TINT_GREEN,ClothingItem.TINT_WHITE]];
         this.clothing = [new ClothingItem("hair_alt1left","Alt 1 Left","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_short01","Short 01","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_alt1right","Alt 1 Right","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_altback1","Alt 1 Back","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_alt1long","Alt 1 Long","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hair_altfront1","Alt Front 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_tony","Tony","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_matt","Matt","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_short02","Short 02","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_messyleft","Messy Left","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_messyright","Messy Right","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_messymid1","Messy Mid 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_messymid2","Messy Mid 2","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_messyback1","Messy Back 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_messyback2","Messy Back 2","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_messyfront1","Messy Front 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_messyfront2","Messy Front 2","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_dreadlocks","Dreadlocks","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hair_mullet","Mullet","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hair_caveman","Caveman","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hair_shaggy","Shaggy","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hair_scene","Scene","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hair_smoothleft","Smooth Left","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_smoothright","Smooth Right","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_smoothmid1","Smooth Mid 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_smoothmid2","Smooth Mid 2","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_smoothback1","Smooth Back 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_smoothback2","Smooth Back 2","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_smoothfront1","Smooth Front 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_smoothfront2","Smooth Front 2","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_wavyleft","Wavy Left","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_wavyright","Wavy Right","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_wavymid1","Wavy Mid 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_wavymid2","Wavy Mid 2","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_wavyback1","Wavy Back 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_pompadour","Pompadour","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_wavyfront1","Wavy Front 1","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_wavyfront2","Wavy Front 2","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_timm","Timm","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_wedge","Wedge","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_liberty","Liberty","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_hitop","Hitop","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_mohawk","Mohawk","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_rudy","Rudy","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_cornrows","Cornrows","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_twist","Twist","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_combover","Combover","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_bald","Bald","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_shaved","Shaved","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_guywaves","Waves","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_fade","Fade","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_MALE,0,false,false),new ClothingItem("hair_ponytailS","Ponytail S","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_ponytailM","Ponytail M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_ponytailL","Ponytail L","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_straightS","Straight S","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_straightM","Straight M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_straightL","Straight L","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_waveS","Wave S","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_waveM","Wave M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_waveL","Wave L","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_flipS","Flip S","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_flipM","Flip M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_flipL","Flip L","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_curlS","Curl S","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_curlM","Curl M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_curlL","Curl L","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_swirlS","Swirl S","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_swirlM","Swirl M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_swirlL","Swirl L","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_bun","Bun","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_fluffybun","Fluffy Bun","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_curlytailM","Curlytail M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_puffs","Puffs","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_pigtailsS","Pigtails S","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_pigtailsM","Pigtails M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_pigtailsL","Pigtails L","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_pinup","Pinup","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_twintailsL","Twintails L","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_odango","Odango","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_pixie","Pixie","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_spike","Spike","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_clover","Clover","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_PREMADE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hair_shagM","Shag M","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_lowtail","Lowtail","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_flock","Flock","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_curlback","Curlback","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_braid","Braid","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_crop","Crop","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_bead","Bead","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_beehive","Beehive","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_sweep","Sweep","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_bob","Bob","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_afro","Afro","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_scooter","Scooter","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hair_scarlett","Scarlett","",ClothingItem.TYPE_HAIR,0,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_BACK_HAIR | ClothingItem.OPTIONS_SUPPORTS_BANGS,false,false),new ClothingItem("hairparts_b_arc","Arc","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_beach","Beach","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_blunt","Blunt","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_breeze","Breeze","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_broad","Broad","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_cheer","Cheer","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_curl","Curl","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_drape","Drape","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_drift","Drift","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_flip","Flip","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_fringe","Fringe","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_glam","Glam","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_hotrod","Hot Rod","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_pixie","Pixie","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_prom","Prom","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_shag","Shag","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_shy","Shy","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_sleek","Sleek","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_soft","Soft","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_split","Split","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_sweep","Sweep","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_wave","Wave","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_whisp","Whisp","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_stray","Stray","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_cecilia","Cecilia","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_emo","Emo","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_bettie","Bettie","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_brush","Brush","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_cloak","Cloak","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_feather","Feather","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_clip","Clip","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_cover","Cover","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_scooter","Scooter","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("hairparts_b_scarlett","Scarlett","",ClothingItem.TYPE_BANGS,0,ClothingItem.GENDER_FEMALE,ClothingItem.OPTIONS_HAS_BACK_HAIR,false,false),new ClothingItem("stubble","Stubble","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTBASE,false,false),new ClothingItem("mitchee","Mitchee","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("goatee5","Goatee 5","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTBASE,false,false),new ClothingItem("goatee6","Goatee 6","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTBASE,false,false),new ClothingItem("goatee2","Goatee 2","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("goatee3","Goatee 3","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("zappa","Zappa","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("soulpatch","Soul Patch","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("mustachepatch","Mustache Patch","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("mustache2","Mustache 2","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("mustache1","Mustache 1","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("fullmustache","Full Mustache","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("mustache3","Mustache 3","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("mustache4","Mustache 4","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("handlebar","Handlebar","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("beardstache","Beardstache","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("mattbeard","Matt Beard","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("mattbeard2","Matt Beard 2","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("mattbeard3","Matt Beard 3","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("mattbeard4","Matt Beard 4","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("mattbeardalt","Matt Beard ALT","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_FEMALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("chinstrap","Chinstrap","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTBASE,false,false),new ClothingItem("amishbeard","Amish Beard","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("shortbeard","Short Beard","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("shortbeard2","Short Beard 2","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("fullbeard","Full Beard","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("jumbobeard","Jumbo Beard","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("jumbobeard2","Jumbo Beard 2","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("vandyke","Van Dyke","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("goatee","Goatee","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("tightgoatee","Tight Goatee","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTMOUTH,false,false),new ClothingItem("soulchops","Soul Chops","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("muttonchops","Muttonchops","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTBASE,false,false),new ClothingItem("sideburns","Sideburns","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTBASE,false,false),new ClothingItem("shortburns","Short Sideburns","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_JUSTBASE,false,false),new ClothingItem("soulburns","Soul Burns","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("goateeburns","Goatee Burns","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("mitcheeburns","Mitchee Burns","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("tightgoatee2","Tight Burns","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("tightgoatee3","Tight Stubble","",ClothingItem.TYPE_FACIALHAIR,0,ClothingItem.GENDER_MALE,ClothingItem.FACIALHAIR_FULL,false,false),new ClothingItem("tint_tshirt_solid","Solid Tee","",ClothingItem.TYPE_SHIRT,2500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_2",true),new ClothingItem("tint_tshirt_twotone","Two Tone Tee","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_1",true,true),new ClothingItem("tint_tshirt_stitch","Stitched Tee","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_3",true,true),new ClothingItem("tint_tshirt_ringer","Ringer Tee","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_4",true,true),new ClothingItem("tint_vneck_solid","Basic V-Neck","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_vneck_1",true),new ClothingItem("tint_vneck_striped","Striped V-Neck","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_vneck_2",true,true),new ClothingItem("tint_vneck_twotone","Two Tone V-Neck","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_vneck_3",true,true),new ClothingItem("tint_vneck_stitch","Stitched V-Neck","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_vneck_4",true,true),new ClothingItem("tint_vneck_ring","Ringed V-Neck","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_vneck_5",true,true),new ClothingItem("tint_vneck_bigstripe","Banded V-Neck","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_vneck_6",true,true),new ClothingItem("tint_tshirt_fruit","Fruit Tee","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_4",true,true,false,"decal_cherry",false,[ClothingItem.TINT_MAROON,ClothingItem.TINT_DARKRED,ClothingItem.TINT_RED,ClothingItem.TINT_PINK,ClothingItem.TINT_ORANGE,ClothingItem.TINT_BRIGHTGOLD,ClothingItem.TINT_YELLOW,ClothingItem.TINT_LIMEGREEN,ClothingItem.TINT_LIGHTGREEN,ClothingItem.TINT_GREEN,ClothingItem.TINT_FORESTGREEN,ClothingItem.TINT_TEAL,ClothingItem.TINT_BLUE,ClothingItem.TINT_DUSTYBLUE,ClothingItem.TINT_PURPLE],null,null,null,[[ClothingItem.TINT_MAROON,-1,-1,-1,"decal_cherry"],[ClothingItem.TINT_DARKRED,-1,-1,-1,"decal_cherry"],[ClothingItem.TINT_RED,-1,-1,-1,"decal_cherry"],[ClothingItem.TINT_PINK,-1,-1,-1,"decal_strawberry"],[ClothingItem.TINT_ORANGE,-1,-1,-1,"decal_cloudberry"],[ClothingItem.TINT_BRIGHTGOLD,-1,-1,-1,"decal_pineapple"],[ClothingItem.TINT_YELLOW,-1,-1,-1,"decal_banana"],[ClothingItem.TINT_LIMEGREEN,-1,-1,-1,"decal_kiwi"],[ClothingItem.TINT_LIGHTGREEN,-1,-1,-1,"decal_kiwi"],[ClothingItem.TINT_GREEN,-1,-1,-1,"decal_kiwi"],[ClothingItem.TINT_FORESTGREEN,-1,-1,-1,"decal_kiwi"],[ClothingItem.TINT_TEAL,-1,-1,-1,"decal_blueberry"],[ClothingItem.TINT_BLUE,-1,-1,-1,"decal_blueberry"],[ClothingItem.TINT_DUSTYBLUE,-1,-1,-1,"decal_blueberry"],[ClothingItem.TINT_PURPLE,-1,-1,-1,"decal_blackberry"]]),new ClothingItem("tint_tshirt_spade","Spade Tee","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_2",true,false,false,"decal_spade",true,null,null,null,null,null,2),new ClothingItem("tint_tshirt_burple","Burple Tee","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_burple",true,true,true),new ClothingItem("tint_tshirt_pepper","Pepper Tee","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_pepper",true,true,true,"decal_pepper",false,null,null,[ClothingItem.TINT_YELLOW,ClothingItem.TINT_ORANGE,ClothingItem.TINT_RED,ClothingItem.TINT_LIGHTGREEN,ClothingItem.TINT_GREEN]),new ClothingItem("tint_tshirt_face","Face Tee","",ClothingItem.TYPE_SHIRT,2500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_2",true,false,false,"decal_sarge",false,[10181820,8210340,8108082,ClothingItem.TINT_ARMYGREEN,15353128,16474647],null,null,null,[[10181820,-1,-1,-1,"decal_sarge"],[8210340,-1,-1,-1,"decal_sarge"],[8108082,-1,-1,-1,"decal_mccoy"],[ClothingItem.TINT_ARMYGREEN,-1,-1,-1,"decal_mccoy"],[15353128,-1,-1,-1,"decal_tomatoface"],[16474647,-1,-1,-1,"decal_tomatoface"]]),new ClothingItem("tint_tshirt_dot","Dot Tee","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_dot",true,true,true),new ClothingItem("tint_tshirt_sauce","Saucy Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_7",true,true,true,"decal_marinara",false,[15745551,16379099,13420885,15758083],null,null,null,[[15745551,-1,-1,-1,"decal_marinara"],[16379099,-1,-1,-1,"decal_alfredo"],[13420885,-1,-1,-1,"decal_garlic"],[15758083,-1,-1,-1,"decal_threecheese"]],-1,0,[[1,15745551,2,14033930],[1,15745551,3,12063744],[1,16379099,2,15783597],[1,16379099,3,14271149],[1,13420885,2,15065460],[1,13420885,3,16777128],[1,15758083,2,14375941],[1,15758083,3,12993284]]),new ClothingItem("tint_polo_1","Two Tone Polo","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_1",true,true),new ClothingItem("tint_polo_2","Accent Polo","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_2",true,true),new ClothingItem("tint_polo_3","Fade Polo","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_3",true,true),new ClothingItem("tint_polo_4","Striped Polo","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_4",true,true),new ClothingItem("tint_polo_5","Rugby Polo","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_5",true,true,true),new ClothingItem("tint_polo_6","Thin Stripe Polo","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_6",true,true),new ClothingItem("tint_polo_flames","Fiery Polo","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_2",true,true,false,"decal_flames",true,null,null,null,null,null,2),new ClothingItem("tint_polo_open","Open Polo","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR | ClothingItem.OPTIONS_HAS_ALTERNATECOLLAR,true,false,0,"tintclothes_polo_open",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_panel_1","Panel Shirt","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_buttondown_1",true,true,true,null,false,null,null,[ClothingItem.TINT_WHITE,ClothingItem.TINT_BLACK,ClothingItem.TINT_BRASS],null,null,-1,0,null,[3]),new ClothingItem("tint_buttondown_2","Short Buttondown","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_buttondown_2",true,true,false,null,false,null,[ClothingItem.TINT_WHITE,ClothingItem.TINT_BLACK,ClothingItem.TINT_BRASS],null,null,null,-1,0,null,[2]),new ClothingItem("tint_buttondowntucked","Tucked Buttondown","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_buttondowntucked",true,true,false,null,false,null,[ClothingItem.TINT_WHITE,ClothingItem.TINT_BLACK,ClothingItem.TINT_BRASS],null,null,null,-1,0,null,[2]),new ClothingItem("tint_buttondown_3","Short Two Tone","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_buttondown_3",true,true,true,null,false,null,null,[ClothingItem.TINT_WHITE,ClothingItem.TINT_BLACK,ClothingItem.TINT_BRASS],null,null,-1,0,null,[3]),new ClothingItem("tint_buttondown_4","Long Two Tone","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG_COLLAR,true,false,0,"tintclothes_buttondown_4",true,true,true,null,false,null,null,[ClothingItem.TINT_WHITE,ClothingItem.TINT_BLACK,ClothingItem.TINT_BRASS],null,null,-1,0,null,[3]),new ClothingItem("tint_buttondown_5","Pinstripe Shirt","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG_COLLAR,true,false,0,"tintclothes_buttondown_5",true,true,true,null,false,null,null,[ClothingItem.TINT_WHITE,ClothingItem.TINT_BLACK,ClothingItem.TINT_BRASS],null,null,-1,0,null,[3]),new ClothingItem("tint_buttondown_6","Long Buttondown","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG_COLLAR,true,false,0,"tintclothes_buttondown_6",true,true,false,null,false,null,[ClothingItem.TINT_WHITE,ClothingItem.TINT_BLACK,ClothingItem.TINT_BRASS],null,null,null,-1,0,null,[2]),new ClothingItem("tint_buttondown_7","Flannel Shirt","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG_COLLAR,true,false,0,"tintclothes_buttondown_7",true,true,false,null,false,null,[ClothingItem.TINT_WHITE,ClothingItem.TINT_BLACK,ClothingItem.TINT_BRASS],null,null,null,-1,0,null,[2]),new ClothingItem("tint_buttondown_8","Plaid Shirt","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_buttondown_8",true,true,true),new ClothingItem("tint_buttondown_speckled","Speckled Shirt","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_buttondown_speckled",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_buttondown_dots","Dotted Shirt","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_buttondown_dots",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_deepv_1","Western Shirt","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG_COLLAR,true,false,0,"tintclothes_deepv_1",true,true),new ClothingItem("tint_deepv_2","Short Western","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_deepv_2",true,true),new ClothingItem("tint_pointedcollar_1","Short Pointed Collar","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR | ClothingItem.OPTIONS_HAS_ALTERNATECOLLAR,true,true,0,"tintclothes_pointedcollar_1",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_pointedcollar_2","Long Pointed Collar","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG_COLLAR | ClothingItem.OPTIONS_HAS_ALTERNATECOLLAR,true,false,0,"tintclothes_pointedcollar_2",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_hawaiian_1","Hawaiian Shirt","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_hawaiian_1",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_JUNE),new ClothingItem("tint_jersey_1","Baseball Jersey","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_jersey_1",true,true,true),new ClothingItem("tint_jersey_2","Solid Jersey","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_jersey_2",true,true,true),new ClothingItem("tint_hockey_1","Retro Hockey Jersey","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_FLAREDSLEEVES | ClothingItem.OPTIONS_HAS_HOCKEYSLEEVES,true,false,0,"tintclothes_hockey_1",true,true,true),new ClothingItem("tint_hockey_2","Hockey Jersey","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_FLAREDSLEEVES | ClothingItem.OPTIONS_HAS_HOCKEYSLEEVES,true,false,0,"tintclothes_hockey_2",true,true,true),new ClothingItem("tint_bball_1","Basketball Jersey","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_bball_1",true,true,true),new ClothingItem("tint_tank_1","Basic Tank","",ClothingItem.TYPE_SHIRT,2500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true),new ClothingItem("tint_tank_2","Striped Tank","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_2",true,true),new ClothingItem("tint_tank_3","Solid Sleeveless","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_3",true),new ClothingItem("tint_tank_3s","Star Sleeveless","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_3",true,false,false,"starshirt",true,null,null,null,null,null,2),new ClothingItem("tint_tank_4","Cropped Tank","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_4",true,true),new ClothingItem("tint_tank_flames","Hot Tank","",ClothingItem.TYPE_SHIRT,3300,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_flames",true,null,null,null,null,null,2),new ClothingItem("tint_tank_bigstripe","Banded Tank","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_5",true,true,true),new ClothingItem("tint_tank_6","Checkered Tank","",ClothingItem.TYPE_SHIRT,3200,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_6",true,true,true),new ClothingItem("tint_tank_7","Dot Tank","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_7",true,true),new ClothingItem("tint_tank_portallini","Portallini Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_portallini",true,null,null,null,null,null,2),new ClothingItem("tint_silktank","Silk Tank","",ClothingItem.TYPE_SHIRT,3000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_HAS_ALTERNATEBODY,true,false,0,"tintclothes_silktank",true,true),new ClothingItem("tint_sweater_1","Solid Sweater","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG,true,false,0,"tintclothes_sweater_1",true),new ClothingItem("tint_sweater_2","Pattern Sweater","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG,true,false,0,"tintclothes_sweater_2",true,true,true),new ClothingItem("tint_sweater_3","Raglan Shirt","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG,true,false,0,"tintclothes_sweater_3",true,true),new ClothingItem("tint_turtleneck_1","Turtleneck","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG_COLLAR,true,false,0,"tintclothes_turtleneck_1",true),new ClothingItem("tint_sweater_5","Casual Sweater","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_ROLLEDSLEEVES,true,false,0,"tintclothes_sweater_5",true),new ClothingItem("tint_sweater_guppy","Guppy Sweater","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG,true,false,0,"tintclothes_sweater_5",true,false,false,"decal_guppy"),new ClothingItem("tint_chefshirt","Chef Shirt","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_FLAREDSLEEVES,true,false,0,"tintclothes_chefshirt",true,true,true),new ClothingItem("tint_utah_1","Beach Shirt","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_utahshirt_1",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_utah_2","Beach Stripes","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_utahshirt_2",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_mindy_1","Loose Sleeve Shirt","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_mindy_1",true),new ClothingItem("tint_flaredshirt_1","Flared Shirt","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_FLAREDSLEEVES,true,false,0,"tintclothes_flaredshirt_1",true),new ClothingItem("tint_flaredshirt_2","Flared with Trim","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_FLAREDSLEEVES,true,false,0,"tintclothes_flaredshirt_2",true,true),new ClothingItem("tint_dresstop_1","Polka Top","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_HAS_ALTERNATEBODY,true,false,0,"tintclothes_dresstop_1",true,true,true),new ClothingItem("tint_dresstop_2","Plain Top","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_HAS_ALTERNATEBODY,true,false,0,"tintclothes_dresstop_2",true,true),new ClothingItem("tint_dress_1","Strap Dress","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_1",true),new ClothingItem("tint_dress_2","Full Dress","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_2",true),new ClothingItem("tint_dress_3","Frilled Dress","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_3",true,true),new ClothingItem("tint_dress_4","Gown","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_4",true),new ClothingItem("tint_dress_5","Sleeved Dress","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_5",true,true),new ClothingItem("tint_dress_6","Two Tone Dress","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_6",true,true),new ClothingItem("tint_dress_7","Pattern Dress","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_7",true,true),new ClothingItem("tint_dress_8","Striped Dress","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_8",true,true),new ClothingItem("tint_dress_9","Swirl Dress","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_FLAREDSLEEVES | ClothingItem.OPTIONS_IS_DRESS,true,false,0,"tintclothes_dress_9",true,true),new ClothingItem("tint_tshirt_shamrock","Shamrock Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_1",true,true,false,"decal_shamrock",true,null,null,null,null,null,2,0),new ClothingItem("tint_tshirt_coin","Coin Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_4",true,true,false,"decal_coin",false,null,null,null,null,null,-1,0),new ClothingItem("tint_sweater_shamrock","Shamrock Sweater","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_CUFF,true,false,0,"tintclothes_sweater_stripesleeve",true,true,false,"decal_shamrock",true,null,null,null,null,null,3,0),new ClothingItem("tint_sweater_astro","Astro Layers","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_CUFF,true,false,0,"tintclothes_sweater_astro",true,true,true,null,false,null,null,null,null,null,-1,0),new ClothingItem("tint_tank_meteor","Meteor Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_meteortank",true,null,null,null,null,null,2,0),new ClothingItem("tint_vneck_cometcon","Comet-Con V-Neck","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_vneck_3",true,true,false,"decal_cometcon",false,null,null,null,null,null,-1,0),new ClothingItem("tint_flaredshirt_3","Groovy Shirt","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_FLAREDSLEEVES,true,false,0,"tintclothes_flaredshirt_3",true,true,false,null,false,null,null,null,null,null,-1,0),new ClothingItem("tint_tank_groovytank","Groov Tank","",ClothingItem.TYPE_SHIRT,4000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_groovytank",true,true,true,null,false,null,null,null,null,null,-1,0),new ClothingItem("tint_buttonpocket","Pocket Shirt","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG_COLLAR | ClothingItem.OPTIONS_HAS_ALTERNATECOLLAR,true,false,0,"tintclothes_buttonpocket",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_polo_bunny","Bunny Polo","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_1",true,true,false,"decal_bunny",false,null,null,null,null,null,-1,0),new ClothingItem("tint_tshirt_egg","Easter Egg Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_6",true,true,true,"decal_egg",true,null,null,null,null,null,-1,0),new ClothingItem("tint_sweater_cheeps","Cheeps Sweater","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG,true,false,0,"tintclothes_sweater_1",true,false,false,"decal_cheeps",false,null,null,null,null,null,-1,0),new ClothingItem("tint_polo_autumn","Three Tone Polo","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_7",true,true,true),new ClothingItem("tint_tank_newyear","Prism Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_newyeartank",false,null,null,null,null,null,-1,GameData.MONTH_JANUARY),new ClothingItem("tint_polo_rainbow","Rainbow Trim Polo","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_2",true,true,false,"decal_rainbowtrim",false,null,null,null,null,null,-1,GameData.MONTH_JANUARY),new ClothingItem("tint_tshirt_swirl","Swirl Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_swirl",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_JANUARY),new ClothingItem("tint_tshirt_heart","Heart Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_2",true,false,false,"heartshirt",true,null,null,null,null,null,2,GameData.MONTH_FEBRUARY),new ClothingItem("tint_tank_heart","Heart Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_hearttrim",true,null,null,null,null,null,2,GameData.MONTH_FEBRUARY),new ClothingItem("tint_heartwestern","Heart Western","",ClothingItem.TYPE_SHIRT,3500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_deepv_2",true,true,false,"decal_heartwestern",true,null,null,null,null,null,3,GameData.MONTH_FEBRUARY),new ClothingItem("tint_tshirt_luckycat","Lucky Cat Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_1",true,true,false,"decal_luckycat",false,null,null,null,null,null,-1,GameData.MONTH_MARCH),new ClothingItem("tint_tshirt_daruma","Daruma Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_8",true,true,true,"decal_daruma",false,null,null,null,null,null,-1,GameData.MONTH_MARCH),new ClothingItem("tint_tshirt_blossom","Cherry Blossom Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_vneck_5",true,true,false,"decal_blossomtee",false,null,null,null,null,null,-1,GameData.MONTH_APRIL),new ClothingItem("tint_tank_blossom","Blossom Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_blossom",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_APRIL),new ClothingItem("tint_tshirt_sakura","Sakura Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_4",true,true,false,"decal_sakura",true,null,null,null,null,null,2,GameData.MONTH_APRIL),new ClothingItem("tint_tshirt_maracas","Maracas Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_8",true,true,true,"decal_maracas",false,null,null,null,null,null,-1,GameData.MONTH_MAY),new ClothingItem("tint_cincoshirt","Cinco Shirt","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_FLAREDSLEEVES,true,false,0,"tintclothes_flaredshirt_2",true,true,false,"decal_mayo",true,null,null,null,null,null,3,GameData.MONTH_MAY),new ClothingItem("tint_tshirt_sunny","Sunny Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_1",true,true,false,"decal_sun",true,null,null,null,null,null,2,GameData.MONTH_JUNE),new ClothingItem("tint_tank_waves","Waves Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_waves",true,null,null,null,null,null,2,GameData.MONTH_JUNE),new ClothingItem("tint_polo_luau","LePunch Polo","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_8",true,true,true,"decal_luau",false,null,null,null,null,null,2,GameData.MONTH_JUNE),new ClothingItem("tint_tank_startrim","Starry Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_startrim",true,null,null,null,null,null,2,GameData.MONTH_JULY),new ClothingItem("tint_tshirt_star","Star Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_6",true,true,true,"decal_bigstar",true,null,null,null,null,null,2,GameData.MONTH_JULY),new ClothingItem("tint_polo_powseeker","Powseeker Polo","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_10",true,true,true,"decal_powseeker",false,null,null,null,null,null,-1,GameData.MONTH_JULY),new ClothingItem("tint_dirndl","Dirndl Top","",ClothingItem.TYPE_SHIRT,5500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_dirndl",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_AUGUST),new ClothingItem("tint_trachten","Bavarian Shirt","",ClothingItem.TYPE_SHIRT,5500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_trachten",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_AUGUST),new ClothingItem("tint_tshirt_maple","Maple Leaf Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_5",true,true,false,"decal_maple",true,null,null,null,null,null,2,GameData.MONTH_SEPTEMBER),new ClothingItem("tint_sweater_toast","Toasty Sweater","",ClothingItem.TYPE_SHIRT,5000,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_ROLLEDSLEEVES,true,false,0,"tintclothes_sweater_5",true,false,false,"decal_cinnamon",false,null,null,null,null,null,-1,GameData.MONTH_SEPTEMBER),new ClothingItem("tint_polo_skull","Skull Polo","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_1",true,true,false,"skullshirt",true,null,null,null,null,null,3,GameData.MONTH_OCTOBER),new ClothingItem("tint_tank_spider","Spiderweb Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_spiderweb",true,null,null,null,null,null,3,GameData.MONTH_OCTOBER),new ClothingItem("tint_sweater_pumpkin","Pumpkin Sweater","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_CUFF,true,false,0,"tintclothes_sweater_stripesleeve",true,true,false,"decal_jacko",true,null,null,null,null,null,3,GameData.MONTH_OCTOBER),new ClothingItem("tint_tshirt_turkey","Turkeys Tee","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT,true,false,0,"tintclothes_tshirt_3",true,true,false,"decal_turkey",false,null,null,null,null,null,-1,GameData.MONTH_NOVEMBER),new ClothingItem("tint_tank_autumn","Autumn Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_leaves",true,null,null,null,null,null,3,GameData.MONTH_NOVEMBER),new ClothingItem("tint_polo_tree","Tree Polo","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SHORT_COLLAR,true,false,0,"tintclothes_polo_9",true,true,false,"decal_tree",true,null,null,null,null,null,3,GameData.MONTH_DECEMBER),new ClothingItem("tint_tank_snow","Snowflake Tank","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_SLEEVELESS,true,false,0,"tintclothes_tank_1",true,true,false,"decal_snow",true,null,null,null,null,null,3,GameData.MONTH_DECEMBER),new ClothingItem("tint_sweater_reindeer","Reindeer Sweater","",ClothingItem.TYPE_SHIRT,4500,ClothingItem.GENDER_SWAP,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_HAS_ROLLEDSLEEVES,true,false,0,"tintclothes_sweater_5",true,false,false,"decal_xmassweater",true,null,null,null,null,null,2,GameData.MONTH_DECEMBER),new ClothingItem("tint_overshirt","Short Overshirt","",ClothingItem.TYPE_JACKET,5000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SHORTSLEEVE,true,false,0,"tintclothes_overshirt",true),new ClothingItem("tint_longovershirt","Long Overshirt","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_longovershirt",true),new ClothingItem("tint_denimvest","Denim Vest","",ClothingItem.TYPE_JACKET,5000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SLEEVELESS,true,false,0,"tintclothes_denimvest",true,true,false,null,false,this.denimPalette,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_wintercoat","Winter Parka","",ClothingItem.TYPE_JACKET,10000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_wintercoat",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_letterjacket","Letter Jacket","",ClothingItem.TYPE_JACKET,7500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COVERARMS,true,false,0,"tintclothes_letterjacket",true,true,true),new ClothingItem("tint_trackjacket","Track Jacket","",ClothingItem.TYPE_JACKET,7000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COVERARMS,true,false,0,"tintclothes_trackjacket",true,true),new ClothingItem("tint_hoodie","Hoodie","",ClothingItem.TYPE_JACKET,6000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_hoodie",true),new ClothingItem("tint_pulloverhoodie","Pullover Hoodie","",ClothingItem.TYPE_JACKET,6000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_pulloverhoodie",true,true),new ClothingItem("tint_pulloverhoodie2","Two-Tone Pullover","",ClothingItem.TYPE_JACKET,6000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_pulloverhoodie2",true,true,true),new ClothingItem("tint_normaljacket","Plain Jacket","",ClothingItem.TYPE_JACKET,6000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_normaljacket",true,true,false,null,false,null,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_shortjacket","Cropped Jacket","",ClothingItem.TYPE_JACKET,6000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS | ClothingItem.OPTIONS_IS_CROPPED_JACKET,true,false,0,"tintclothes_shortjacket",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_shortovershirt","Cropped Overshirt","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SHORTSLEEVE | ClothingItem.OPTIONS_IS_CROPPED_JACKET,true,false,0,"tintclothes_shortovershirt",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_tornovershirt","Torn Overshirt","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SHORTSLEEVE | ClothingItem.OPTIONS_HIDE_SHIRTNECK,true,false,0,"tintclothes_rudyshirt",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_hearttvest","Heart Vest","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SLEEVELESS | ClothingItem.OPTIONS_HIDE_SHIRTNECK,true,false,0,"tintclothes_scarlettvest",true,true,false,"decal_heartvest",true,null,null,null,null,null,2,GameData.MONTH_FEBRUARY),new ClothingItem("tint_scarlettvest","Cropped Vest","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SLEEVELESS | ClothingItem.OPTIONS_HIDE_SHIRTNECK,true,false,0,"tintclothes_scarlettvest",true,true),new ClothingItem("tint_workvest","Work Vest","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SLEEVELESS | ClothingItem.OPTIONS_HIDE_SHIRTNECK,true,false,0,"tintclothes_workvest",true,true),new ClothingItem("tint_sweatervest","Sweater Vest","",ClothingItem.TYPE_JACKET,5000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_sweatervest",true),new ClothingItem("tint_windbreaker_1","Windbreaker","",ClothingItem.TYPE_JACKET,7000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_windbreaker",true,true),new ClothingItem("tint_puffyvest","Puffy Vest","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SLEEVELESS,true,false,0,"tintclothes_puffyvest",true),new ClothingItem("tint_leatherjacket","Leather Jacket","",ClothingItem.TYPE_JACKET,10000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_leatherjacket",true),new ClothingItem("tint_bomberjacket","Bomber Jacket","",ClothingItem.TYPE_JACKET,10000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_bomberjacket",true,true,true),new ClothingItem("tint_labcoat","Lab Coat","",ClothingItem.TYPE_JACKET,9500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COVERARMS,true,false,0,"tintclothes_labcoat",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_raincoat","Raincoat","",ClothingItem.TYPE_JACKET,8500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_raincoat",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_blazer","Blazer","",ClothingItem.TYPE_JACKET,8500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COVERARMS,true,false,0,"tintclothes_blazer",true,true,true,null,false,null,null,this.metalPalette,null,null,-1,0,null,[3]),new ClothingItem("tint_timmblazer","Slim Blazer","",ClothingItem.TYPE_JACKET,8500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_FOREARM | ClothingItem.OPTIONS_HIDE_SHIRTBICEP | ClothingItem.OPTIONS_HIDE_IRREGULARFOREARM,true,false,0,"tintclothes_timmblazer",true,true,false,null,false,null,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_trenchcoat","Trenchcoat","",ClothingItem.TYPE_JACKET,9500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_trenchcoat",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_collarvest","Collared Vest","",ClothingItem.TYPE_JACKET,5000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SLEEVELESS,true,false,0,"tintclothes_vest_1",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_classicvest","Classic Vest","",ClothingItem.TYPE_JACKET,5000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_vest_2",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_shrug","Shrug Sweater","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COVERARMS | ClothingItem.OPTIONS_IS_CROPPED_JACKET,true,false,0,"tintclothes_shrug",true),new ClothingItem("tint_shortshrug","Short Shrug","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HIDE_SHIRTBICEP | ClothingItem.OPTIONS_IS_CROPPED_JACKET,true,false,0,"tintclothes_shortshrug",true),new ClothingItem("tint_apron_1","Plaid Apron","",ClothingItem.TYPE_JACKET,4500,ClothingItem.GENDER_SWAP,0,true,true,0,"tintclothes_apron",true,true),new ClothingItem("tint_paddyjacket","Paddy Jacket","",ClothingItem.TYPE_JACKET,6500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_normaljacket2",true,true,true,"decal_paddyjacket",true,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_easterovershirt","Easter Cropped Shirt","",ClothingItem.TYPE_JACKET,5500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SHORTSLEEVE | ClothingItem.OPTIONS_IS_CROPPED_JACKET,true,false,0,"tintclothes_eastercrop",true,true,true,null,false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_stripedovershirt","Striped Overshirt","",ClothingItem.TYPE_JACKET,6500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_SHORTSLEEVE,true,false,0,"tintclothes_stripedovershirt",true,true),new ClothingItem("tint_hippievest","Fringe Vest","",ClothingItem.TYPE_JACKET,6500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_hippievest",true,true,false,null,false,null,null,null,null,null,-1,0),new ClothingItem("tint_spacesuit","Spacesuit","",ClothingItem.TYPE_JACKET,9500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS | ClothingItem.OPTIONS_HIDE_SHIRTNECK | ClothingItem.OPTIONS_HIDE_SHIRTBODY | ClothingItem.OPTIONS_HIDE_PANTS,true,false,0,"tintclothes_spacesuit",true,true,true,null,false,null,null,null,null,null,-1,0),new ClothingItem("tint_colorfuljacket","Colorful Jacket","",ClothingItem.TYPE_JACKET,7500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_multiwindbreaker",true,true,true,"decal_newyearcoat",true,null,null,null,null,null,-1,GameData.MONTH_JANUARY),new ClothingItem("tint_valentinejacket","Valentine Jacket","",ClothingItem.TYPE_JACKET,7500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COVERARMS,true,false,0,"tintclothes_letterjacket",true,true,true,"heartjacket",true,null,null,null,null,null,1,GameData.MONTH_FEBRUARY),new ClothingItem("tint_hanten","Hanten Jacket","",ClothingItem.TYPE_JACKET,6500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_FOREARM | ClothingItem.OPTIONS_HIDE_SHIRTBICEP | ClothingItem.OPTIONS_HIDE_IRREGULARFOREARM,true,false,0,"tintclothes_hanten",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_MARCH),new ClothingItem("tint_yukata_1","Yukata","",ClothingItem.TYPE_JACKET,8500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_BICEP | ClothingItem.OPTIONS_HAS_FOREARM | ClothingItem.OPTIONS_HIDE_SHIRTBICEP | ClothingItem.OPTIONS_HIDE_IRREGULARFOREARM | ClothingItem.OPTIONS_HIDE_SHIRTNECK | ClothingItem.OPTIONS_HIDE_SHIRTBODY | ClothingItem.OPTIONS_HIDE_PANTS,true,false,0,"tintclothes_yukata_1",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_APRIL),new ClothingItem("tint_poncho","Poncho","",ClothingItem.TYPE_JACKET,7500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HIDE_SHIRTNECK,true,false,0,"tintclothes_poncho",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_MAY),new ClothingItem("tint_starryjacket","Starry Jacket","",ClothingItem.TYPE_JACKET,6500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_starryjacket",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_JULY,null,[3]),new ClothingItem("tint_bavarianvest","Bavarian Vest","",ClothingItem.TYPE_JACKET,6500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_bavarianvest",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_AUGUST,null,[3]),new ClothingItem("tint_maplehoodie","Maple Hoodie","",ClothingItem.TYPE_JACKET,7500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COVERARMS,true,false,0,"tintclothes_pulloverhoodie2",true,true,true,"decal_maplehoodie",true,null,null,null,null,null,2,GameData.MONTH_SEPTEMBER),new ClothingItem("tint_skeletonhoodie","Skeleton Hoodie","",ClothingItem.TYPE_JACKET,9000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_skeletonhoodie",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_OCTOBER),new ClothingItem("tint_turkeyjacket","Turkeys Jacket","",ClothingItem.TYPE_JACKET,7500,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COVERARMS,true,false,0,"tintclothes_letterjacket",true,true,true,"decal_turkeyjacket",false,null,null,null,null,null,-1,GameData.MONTH_NOVEMBER),new ClothingItem("tint_furcoat","Fur Parka","",ClothingItem.TYPE_JACKET,9000,ClothingItem.GENDER_SWAP,ClothingItem.JACKET_COLLAR_COVERARMS,true,false,0,"tintclothes_furcoat",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_DECEMBER),new ClothingItem("tint_pants_1","Plain Pants","",ClothingItem.TYPE_PANTS,2500,ClothingItem.GENDER_SWAP,0,true,true,0,"tintclothes_pants_1",true),new ClothingItem("tint_pants_2","Pinstripe Pants","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_2",true,true),new ClothingItem("tint_pants_3","Striped Pants","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_3",true,true),new ClothingItem("tint_pants_4","Two Tone Pants","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_4",true,true),new ClothingItem("tint_pants_5","Wide Stripe Pants","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_5",true,true),new ClothingItem("tint_pants_6","Side Stripe Pants","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_6",true,true),new ClothingItem("tint_pants_7","Plaid Pants","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_7",true,true),new ClothingItem("tint_pants_8","Polka Dot Pants","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_8",true,true),new ClothingItem("tint_pants_9","Camo Pants","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_9",true,true),new ClothingItem("tint_pants_10","Denim Jeans","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_pants_10",true,true,false,null,false,this.denimPalette,null,null,null,null,-1,0,this.denimStitchSwitchColors,[2]),new ClothingItem("tint_lederhosen","Lederhosen","",ClothingItem.TYPE_PANTS,4000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_lederhosen",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_AUGUST,null,[2]),new ClothingItem("tint_skirt_1","Plain Skirt","",ClothingItem.TYPE_PANTS,2500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_1",true),new ClothingItem("tint_skirt_10","Denim Skirt","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_10",true,true,false,null,false,this.denimPalette,null,null,null,null,-1,0,this.denimStitchSwitchColors,[2]),new ClothingItem("tint_skirt_2","Pinstripe Skirt","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_2",true,true),new ClothingItem("tint_skirt_3","Two Tone Skirt","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_3",true,true),new ClothingItem("tint_skirt_4","Side Stripe Skirt","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_4",true,true),new ClothingItem("tint_skirt_5","Plaid Skirt","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_5",true,true,true),new ClothingItem("tint_skirt_6","Polka Dot Skirt","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_6",true,true,true),new ClothingItem("tint_skirt_7","Edged Skirt","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_7",true,true,true),new ClothingItem("tint_skirt_7b","Trim Skirt","",ClothingItem.TYPE_PANTS,3000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_7b",true,true),new ClothingItem("tint_skirt_8","Layered Skirt","",ClothingItem.TYPE_PANTS,3500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_8",true,true),new ClothingItem("tint_skirt_9","Plain Straight Skirt","",ClothingItem.TYPE_PANTS,2500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_skirt_9",true),new ClothingItem("tint_hairtie","Hair Tie","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP,true,false,0,"tintclothes_hairtie",true),new ClothingItem("tint_winterhat","Solid Knit Hat","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_winterhat",true),new ClothingItem("tint_winterhat2","Trim Knit Hat","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_winterhat2",true,true),new ClothingItem("tint_tallknit","Tall Knit Hat","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_tallknit",true,true),new ClothingItem("tint_tallknit2","Striped Knit Hat","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_tallknit2",true,true,true),new ClothingItem("tint_bandana","Bandana","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_bandana",true),new ClothingItem("tint_kenkakaburi","Kenka Kaburi","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_kenkakaburi",true),new ClothingItem("tint_beanie","Beanie","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_beanie",true),new ClothingItem("tint_cadet","Cadet Cap","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_cadet",true,true),new ClothingItem("tint_bucketcadet","Bucket Cadet Cap","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_bucketcadet",true),new ClothingItem("tint_skully","Skully","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_skully",true),new ClothingItem("tint_bucket","Bucket Hat","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_bucket",true),new ClothingItem("tint_bucket2","Polka Bucket Hat","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_bucket2",true,true),new ClothingItem("tint_cloche","Ribbon Cloche","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_cloche",true,true),new ClothingItem("tint_fedora","Fedora","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_fedora",true,true),new ClothingItem("tint_flatcap","Flat Cap","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_flatcap",true),new ClothingItem("tint_ballhat","Ballcap","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_ballhat",true,true,true),new ClothingItem("tint_backwardscap","Backwards Cap","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_backwardscap",true,true),new ClothingItem("tint_logocap","Logo Cap","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_ballhat",true,true,true,"decal_hatlogo_star",false,[ClothingItem.TINT_RED,ClothingItem.TINT_SEAFOAM,ClothingItem.TINT_YELLOW,ClothingItem.TINT_ORANGE,ClothingItem.TINT_CREAM,ClothingItem.TINT_WHITE,ClothingItem.TINT_LIGHTGREEN,ClothingItem.TINT_ARMYGREEN,ClothingItem.TINT_BLUE,ClothingItem.TINT_NAVYBLUE,ClothingItem.TINT_LIGHTPINK,ClothingItem.TINT_BLACK],null,null,null,[[ClothingItem.TINT_RED,-1,-1,-1,"decal_hatlogo_star"],[ClothingItem.TINT_SEAFOAM,-1,-1,-1,"decal_hatlogo_coconut"],[ClothingItem.TINT_YELLOW,-1,-1,-1,"decal_hatlogo_jack"],[ClothingItem.TINT_ORANGE,-1,-1,-1,"decal_hatlogo_turtle"],[ClothingItem.TINT_CREAM,-1,-1,-1,"decal_hatlogo_turkey"],[ClothingItem.TINT_WHITE,-1,-1,-1,"decal_hatlogo_woollies"],[ClothingItem.TINT_LIGHTGREEN,-1,-1,-1,"decal_hatlogo_tomato"],[ClothingItem.TINT_ARMYGREEN,-1,-1,-1,"decal_hatlogo_army"],[ClothingItem.TINT_BLUE,-1,-1,-1,"decal_hatlogo_burger"],[ClothingItem.TINT_NAVYBLUE,-1,-1,-1,"decal_hatlogo_gondo"],[ClothingItem.TINT_LIGHTPINK,-1,-1,-1,"decal_hatlogo_cupcake"],[ClothingItem.TINT_BLACK,-1,-1,-1,"decal_hatlogo_samurai"]],-1,0,[[1,ClothingItem.TINT_RED,2,ClothingItem.TINT_LIGHTORANGE],[1,ClothingItem.TINT_RED,3,ClothingItem.TINT_LIGHTORANGE],[1,ClothingItem.TINT_SEAFOAM,2,ClothingItem.TINT_PURPLE],[1,ClothingItem.TINT_SEAFOAM,3,ClothingItem.TINT_PURPLE],[1,ClothingItem.TINT_YELLOW,2,ClothingItem.TINT_BLACK],[1,ClothingItem.TINT_YELLOW,3,ClothingItem.TINT_BLACK],[1,ClothingItem.TINT_ORANGE,2,ClothingItem.TINT_BROWN],[1,ClothingItem.TINT_ORANGE,3,ClothingItem.TINT_ORANGE],[1,ClothingItem.TINT_CREAM,2,ClothingItem.TINT_BROWN],[1,ClothingItem.TINT_CREAM,3,ClothingItem.TINT_BROWN],[1,ClothingItem.TINT_WHITE,2,ClothingItem.TINT_DARKLAVENDER],[1,ClothingItem.TINT_WHITE,3,ClothingItem.TINT_DARKLAVENDER],[1,ClothingItem.TINT_LIGHTGREEN,2,ClothingItem.TINT_RED],[1,ClothingItem.TINT_LIGHTGREEN,3,ClothingItem.TINT_RED],[1,ClothingItem.TINT_ARMYGREEN,2,ClothingItem.TINT_ARMYGREEN],[1,ClothingItem.TINT_ARMYGREEN,3,ClothingItem.TINT_KHAKI],[1,ClothingItem.TINT_BLUE,2,ClothingItem.TINT_CREAM],[1,ClothingItem.TINT_BLUE,3,ClothingItem.TINT_CREAM],[1,ClothingItem.TINT_NAVYBLUE,2,ClothingItem.TINT_RED],[1,ClothingItem.TINT_NAVYBLUE,3,ClothingItem.TINT_WHITE],[1,ClothingItem.TINT_LIGHTPINK,2,ClothingItem.TINT_WHITE],[1,ClothingItem.TINT_LIGHTPINK,3,ClothingItem.TINT_WHITE],[1,ClothingItem.TINT_BLACK,2,ClothingItem.TINT_MINTGREEN],[1,ClothingItem.TINT_BLACK,3,ClothingItem.TINT_MINTGREEN]]),new ClothingItem("tint_trapper","Trapper Hat","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_trapper",true,true),new ClothingItem("tint_plaidtrapper","Plaid Trapper Hat","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_plaidtrapper",true,true),new ClothingItem("tint_captainhat","Captain Hat","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_captainhat",true,true,true,"decal_captainhat_logo",false,null,null,null,null,null,-1,0,null,[3]),new ClothingItem("tint_captainhat2","Solid Captain Hat","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_captainhat2",true,true),new ClothingItem("tint_fez","Small Fez","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_fez",true,true,false,null,false,null,null,null,null,null,-1,0,null,[2]),new ClothingItem("tint_bigfez","Big Fez","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_bigfez",true),new ClothingItem("tint_beret","Beret","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_beret",true),new ClothingItem("tint_visor","Visor","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_visor",true),new ClothingItem("tint_bakeriavisor","Plaid Visor","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,true,0,"tintclothes_bakeriavisor",true,true),new ClothingItem("tint_headband","Headband","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_headband",true),new ClothingItem("tint_hairband","Hairband","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP | ClothingItem.OPTIONS_HAT_BEHINDBANGS,true,false,0,"tintclothes_hairband",true),new ClothingItem("tint_checker_hairband","Checkered Hairband","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP | ClothingItem.OPTIONS_HAT_BEHINDBANGS,true,false,0,"tintclothes_checker_hairband",true,true),new ClothingItem("tint_sushi_headband","Sushi Headband","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_sushi_headband",true),new ClothingItem("tint_sushi_hairband","Sushi Raised Band","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP,false,false,0,"tintclothes_sushi_hairband",true),new ClothingItem("tint_headphones","Headphones","",ClothingItem.TYPE_HAT,4500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP | ClothingItem.OPTIONS_HAT_BEHINDBANGS,true,false,0,"tintclothes_headphones",true,true,true),new ClothingItem("tint_cowboy","Cowboy Hat","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_cowboyhat",true,true),new ClothingItem("tint_boater","Boater Hat","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_boaterhat",true,true),new ClothingItem("tint_tophat","Top Hat","",ClothingItem.TYPE_HAT,4500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_tophat",true,true),new ClothingItem("tint_bigbow","Large Bow","",ClothingItem.TYPE_HAT,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP,true,false,0,"tintclothes_bigbow",true),new ClothingItem("tint_smallbow","Hair Ribbon","",ClothingItem.TYPE_HAT,2000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP,true,false,0,"tintclothes_smallbow",true),new ClothingItem("tint_hairclip3","Flower","",ClothingItem.TYPE_HAT,2000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP,true,false,0,"tintclothes_hairclip3",true,true),new ClothingItem("tint_hairclip4","Flower Clip","",ClothingItem.TYPE_HAT,2000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP,true,false,0,"tintclothes_hairclip4",true),new ClothingItem("tint_maplehat","Sleeping Cap","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_maplehat",true,true),new ClothingItem("tint_shinytophat","Paddy Top Hat","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_shinytophat",true,true),new ClothingItem("tint_irishderby","Paddy Derby","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_irishderby",true,true,true,null,false,null,null,null,null,null,-1,0),new ClothingItem("easter_hat_1","Bunny Ears","",ClothingItem.TYPE_HAT,7000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_SOMBRERO,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_WHITE,ClothingItem.TINT_PINK]),new ClothingItem("tint_eastercap","Easter Cap","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_meshcap",true,true,true,"decal_bunnyhat",false,null,null,null,null,null,-1,0),new ClothingItem("tint_luauvisor","Two-Tone Visor","",ClothingItem.TYPE_HAT,3000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_twotonevisor",true,true),new ClothingItem("tint_alieneyes","Alien Eye Band","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HAIRCLIP,true,false,0,"tintclothes_alieneyes",true,true,false,null,false,null,null,null,null,null,-1,0),new ClothingItem("tint_spacehelmet","Space Helmet","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_FULLMASK,true,false,0,"tintclothes_spacehelmet",true,true,true,null,false,null,null,null,null,null,-1,0),new ClothingItem("tint_patternbeanie","Paisley Beanie","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_patternbeanie",true,true,true,null,false,null,null,null,null,null,-1,0),new ClothingItem("tint_groovyband","Groovy Headband","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_groovyband",true,true,true,null,false,null,null,null,null,null,-1,0),new ClothingItem("newyears_hat_1","Jester Hat","",ClothingItem.TYPE_HAT,8500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,GameData.MONTH_JANUARY,null,false,false,false,null,false,[ClothingItem.TINT_PURPLE,ClothingItem.TINT_GREEN,ClothingItem.TINT_YELLOW,ClothingItem.TINT_BLUE,ClothingItem.TINT_RED,ClothingItem.TINT_ORANGE,ClothingItem.TINT_BLACK]),new ClothingItem("tint_rainbowbucket","Rainbow Bucket","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_bucket",true,false,false,"decal_rainbowbucket",false,null,null,null,null,null,-1,GameData.MONTH_JANUARY),new ClothingItem("tint_heartcowboy","Valentine Hat","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_cowboyhat",true,true,false,"decal_hearthat",true,null,null,null,null,null,3,GameData.MONTH_FEBRUARY),new ClothingItem("tint_heartcap","Heart Mesh Cap","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_meshcap",true,true,true,"decal_heartcap",true,null,null,null,null,null,2,GameData.MONTH_FEBRUARY),new ClothingItem("tint_luckykaburi","Lucky Kaburi","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_luckykaburi",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_MARCH),new ClothingItem("tint_cathat","Lucky Cat Hat","",ClothingItem.TYPE_HAT,6500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_cathat",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_MARCH),new ClothingItem("tint_cherrycadet","Cherry Cadet Cap","",ClothingItem.TYPE_HAT,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_cadet",true,true,false,"decal_blossomhat",true,null,null,null,null,null,2,GameData.MONTH_APRIL),new ClothingItem("tint_sombrero","Sombrero","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_SOMBRERO,true,false,0,"tintclothes_sombrero",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_MAY),new ClothingItem("tint_spanishhat","Cinco Hat","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_spanishhat",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_MAY),new ClothingItem("luau_hat_1","Straw Hat","",ClothingItem.TYPE_HAT,6500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_SOMBRERO,true,false,GameData.MONTH_JUNE,null,false,false,false,null,false,[ClothingItem.TINT_STRAW]),new ClothingItem("tint_boomerhelmet","Stunt Helmet","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_boomerhelmet",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_JULY),new ClothingItem("tint_starbucket","Star Bucket","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_bucket",true,false,false,"decal_bucketstar",true,null,null,null,null,null,2,GameData.MONTH_JULY),new ClothingItem("tint_alpinehat","Alpine Hat","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_alpinehat",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_AUGUST),new ClothingItem("tint_oktoberfest_hat","Bavarian Hat","",ClothingItem.TYPE_HAT,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_oktoberfest_hat",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_AUGUST),new ClothingItem("maplejug_hat","Maple Jug Hat","",ClothingItem.TYPE_HAT,9500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,GameData.MONTH_SEPTEMBER,null,false,false,false,null,false,[ClothingItem.TINT_BURNTUMBER]),new ClothingItem("halloween_hat_1","Jack O\'Lantern Mask","",ClothingItem.TYPE_HAT,9000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_FULLMASK,true,false,GameData.MONTH_OCTOBER,null,false,false,false,null,false,[ClothingItem.TINT_ORANGE,ClothingItem.TINT_BLACK,ClothingItem.TINT_GREEN]),new ClothingItem("tint_witchhat","Witch Hat","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,"tintclothes_witchhat",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_OCTOBER),new ClothingItem("thanksgiving_hat_1","Pilgrim Hat","",ClothingItem.TYPE_HAT,7500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,GameData.MONTH_NOVEMBER,null,false,false,false,null,false,[ClothingItem.TINT_BLACK,ClothingItem.TINT_BROWN,ClothingItem.TINT_GRAY]),new ClothingItem("tint_leaftrapper","Fall Trapper","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_trapper",true,true,false,"decal_leaftrapper",true,null,null,null,null,null,2,GameData.MONTH_NOVEMBER),new ClothingItem("tint_santahat","Christmas Hat","",ClothingItem.TYPE_HAT,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_santahat",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_DECEMBER),new ClothingItem("tint_snowflakehat","Snowflake Hat","",ClothingItem.TYPE_HAT,4500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,"tintclothes_winterhat3",true,true,true,null,false,null,null,null,null,null,-1,GameData.MONTH_DECEMBER),new ClothingItem("tint_backpack","Backpack","",ClothingItem.TYPE_ACC_BODY,7000,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL,true,false,0,"tintclothes_backpack",true,true),new ClothingItem("tint_camppack","Camping Pack","",ClothingItem.TYPE_ACC_BODY,12000,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL,true,false,0,"tintclothes_camppack",true,true,true),new ClothingItem("tint_backbag","Messenger Bag","",ClothingItem.TYPE_ACC_BODY,8000,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_backbag",true),new ClothingItem("tint_backbag2","Striped Messenger","",ClothingItem.TYPE_ACC_BODY,8000,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_backbag2",true,true),new ClothingItem("tint_purse","Square Purse","",ClothingItem.TYPE_ACC_BODY,5000,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_purse",true),new ClothingItem("tint_purse2","Fancy Purse","",ClothingItem.TYPE_ACC_BODY,5500,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_purse2",true),new ClothingItem("tint_hobopurse","Hobo Purse","",ClothingItem.TYPE_ACC_BODY,5500,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_hobopurse",true,true,true),new ClothingItem("tint_flowerpurse","Flower Purse","",ClothingItem.TYPE_ACC_BODY,5500,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_flowerpurse",true,true,true),new ClothingItem("tint_knapsack","Big Knapsack","",ClothingItem.TYPE_ACC_BODY,9000,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_knapsack",true,true),new ClothingItem("tint_skateboard","Skateboard","",ClothingItem.TYPE_ACC_BODY,9000,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL,true,false,0,"tintclothes_skateboard",true,true,true),new ClothingItem("tint_necktie","Solid Necktie","",ClothingItem.TYPE_ACC_BODY,2500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_ACC_BEHINDJACKET,true,false,0,"tintclothes_necktie",true),new ClothingItem("tint_necktie2","Striped Necktie","",ClothingItem.TYPE_ACC_BODY,3500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_ACC_BEHINDJACKET,true,false,0,"tintclothes_necktie2",true,true),new ClothingItem("tint_bowtie","Bowtie","",ClothingItem.TYPE_ACC_BODY,2500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_ACC_BEHINDJACKET,true,false,0,"tintclothes_bowtie",true),new ClothingItem("tint_scarfwrap","Scarf Wrap","",ClothingItem.TYPE_ACC_BODY,4500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HIDE_SHIRTNECK | ClothingItem.OPTIONS_ACC_BEHINDJACKETNECK | ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_ACC_BEHINDJACKET,true,false,0,"tintclothes_scarfwrap",true),new ClothingItem("tint_neckerchief","Neckerchief","",ClothingItem.TYPE_ACC_BODY,3500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HIDE_SHIRTNECK | ClothingItem.OPTIONS_ACC_BEHINDJACKETNECK,true,false,0,"tintclothes_neckerchief",true),new ClothingItem("tint_hooligan_1","Long Scarf","",ClothingItem.TYPE_ACC_BODY,4500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_BEHINDCOLLAR,true,false,0,"tintclothes_hooligan_1",true),new ClothingItem("tint_hooligan_2","Stripe Scarf","",ClothingItem.TYPE_ACC_BODY,5000,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_BEHINDCOLLAR,true,false,0,"tintclothes_hooligan_2",true,true),new ClothingItem("tint_scarf_1","Plaid Scarf","",ClothingItem.TYPE_ACC_BODY,5000,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL_NECK,true,false,0,"tintclothes_scarf_1",true,true,true),new ClothingItem("tint_scarf_2","Solid Scarf","",ClothingItem.TYPE_ACC_BODY,4500,ClothingItem.GENDER_ALL,ClothingItem.BODYACC_FULL_NECK,true,false,0,"tintclothes_scarf_2",true),new ClothingItem("tint_suspenders_1","Suspenders","",ClothingItem.TYPE_ACC_BODY,4000,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_ACC_BEHINDJACKET | ClothingItem.OPTIONS_IS_OVERALLS,true,false,0,"tintclothes_suspenders_1",true,true,false,null,false,null,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_suspenders_2","Bavarian Suspenders","",ClothingItem.TYPE_ACC_BODY,5000,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_ACC_BEHINDJACKET | ClothingItem.OPTIONS_IS_OVERALLS,true,false,0,"tintclothes_suspenders_2",true,true,false,null,false,null,this.metalPalette,null,null,null,-1,GameData.MONTH_AUGUST,null,[2]),new ClothingItem("tint_overalls_1","Denim Overalls","",ClothingItem.TYPE_ACC_BODY,4500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_ACC_BEHINDJACKET | ClothingItem.OPTIONS_ACCBEHINDBELT | ClothingItem.OPTIONS_IS_OVERALLS,true,false,0,"tintclothes_overalls",true,true,false,null,false,this.denimPalette,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_overalls_2","Plain Overalls","",ClothingItem.TYPE_ACC_BODY,4500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_ACC_BEHINDJACKET | ClothingItem.OPTIONS_ACCBEHINDBELT | ClothingItem.OPTIONS_IS_OVERALLS,true,false,0,"tintclothes_overalls",true,true,false,null,false,null,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_shortapron","Sushi Apron","",ClothingItem.TYPE_ACC_BODY,4500,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_ACC_BEHINDJACKET,true,false,0,"tintclothes_shortapron",true),new ClothingItem("tint_neckchain","Neck Chain","",ClothingItem.TYPE_ACC_BODY,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE,true,false,0,"tintclothes_neckchain",true,false,false,null,false,this.metalPalette),new ClothingItem("tint_collarnecklace","Collar Necklace","",ClothingItem.TYPE_ACC_BODY,7500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE,true,false,0,"tintclothes_collarnecklace",true),new ClothingItem("tint_lei","Lei","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE,true,false,0,"tintclothes_lei",true,true,false,null,false,null,null,null,null,null,-1,GameData.MONTH_JUNE),new ClothingItem("tint_beadnecklace","Bead Necklace","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE,true,false,0,"tintclothes_beadnecklace",true),new ClothingItem("tint_locket","Locket","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE,true,false,0,"tintclothes_locket",true,false,false,null,false,this.metalPalette),new ClothingItem("tint_necklace","Necklace","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE,true,false,0,"tintclothes_necklace",true,true),new ClothingItem("tint_hoopnecklace","Large Necklace","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE,true,false,0,"tintclothes_hoopnecklace",true),new ClothingItem("tint_pearlnecklace","Pearl Necklace","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE,true,false,0,"tintclothes_pearlnecklace",true),new ClothingItem("tint_guestpass","Guest Pass","",ClothingItem.TYPE_ACC_BODY,4000,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY,true,false,0,"tintclothes_guestpass",true,true,true),new ClothingItem("tint_cape","Cape","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_HAS_BACKBODY,true,false,0,"tintclothes_cape",true),new ClothingItem("tint_thermal","Long Armwarmers","",ClothingItem.TYPE_ACC_ARMS,4000,ClothingItem.GENDER_ALL,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_thermalsleeve",true),new ClothingItem("tint_shortthermal","Short Armwarmers","",ClothingItem.TYPE_ACC_ARMS,3000,ClothingItem.GENDER_ALL,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_shortthermalsleeve",true),new ClothingItem("tint_armwarmer","Stripe Armwarmers","",ClothingItem.TYPE_ACC_ARMS,4000,ClothingItem.GENDER_ALL,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_ACCSTAYSBACK | ClothingItem.OPTIONS_HAS_CUFF,true,false,0,"tintclothes_armwarmer",true,true),new ClothingItem("tint_armwarmer2","Cuff Armwarmers","",ClothingItem.TYPE_ACC_ARMS,4500,ClothingItem.GENDER_ALL,ClothingItem.SHIRT_LONG | ClothingItem.OPTIONS_ACCSTAYSBACK | ClothingItem.OPTIONS_HAS_CUFF,true,false,0,"tintclothes_armwarmer2",true),new ClothingItem("tint_gloves1","Basic Gloves","",ClothingItem.TYPE_ACC_ARMS,3000,ClothingItem.GENDER_ALL,ClothingItem.GLOVE_FOREARM | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_glove1",true),new ClothingItem("tint_gloves3","Short Gloves","",ClothingItem.TYPE_ACC_ARMS,2500,ClothingItem.GENDER_ALL,ClothingItem.GLOVE_FOREARM | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_glove3",true),new ClothingItem("tint_gloves2","Long Gloves","",ClothingItem.TYPE_ACC_ARMS,4000,ClothingItem.GENDER_ALL,ClothingItem.GLOVE_LONG | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_glove2",true),new ClothingItem("tint_gloves4","Open Knit Gloves","",ClothingItem.TYPE_ACC_ARMS,3000,ClothingItem.GENDER_ALL,ClothingItem.GLOVE_FOREARM | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_glove4",true),new ClothingItem("tint_gloves5","Fingerless Gloves","",ClothingItem.TYPE_ACC_ARMS,3000,ClothingItem.GENDER_ALL,ClothingItem.GLOVE_FOREARM | ClothingItem.OPTIONS_ACCSTAYSBACK,true,false,0,"tintclothes_glove5",true),new ClothingItem("tint_gloves6","Work Gloves","",ClothingItem.TYPE_ACC_ARMS,4500,ClothingItem.GENDER_ALL,ClothingItem.GLOVE_FOREARM | ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE,true,false,0,"tintclothes_glove6",true),new ClothingItem("tint_powerglove","Gaming Glove","",ClothingItem.TYPE_ACC_ARMS,10000,ClothingItem.GENDER_ALL,ClothingItem.GLOVE_FOREARM | ClothingItem.OPTIONS_HAS_CUFF | ClothingItem.OPTIONS_HAS_ALTERNATEGLOVE | ClothingItem.OPTIONS_ONLYONEARM,true,false,0,"tintclothes_powerglove",true,true,true),new ClothingItem("tint_wristband","Sweatbands","",ClothingItem.TYPE_ACC_ARMS,2500,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_wristband",true),new ClothingItem("tint_rubberband","Rubber Wristband","",ClothingItem.TYPE_ACC_ARMS,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_ONLYONEARM,true,false,0,"tintclothes_rubberband",true),new ClothingItem("tint_metalcuff","Metal Band","",ClothingItem.TYPE_ACC_ARMS,8000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_ONLYONEARM,true,false,0,"tintclothes_metalcuff",true,false,false,null,false,this.metalPalette),new ClothingItem("tint_metalring","Metal Bracelets","",ClothingItem.TYPE_ACC_ARMS,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_metalring",true,false,false,null,false,this.metalPalette),new ClothingItem("tint_plasticrings","Plastic Bracelets","",ClothingItem.TYPE_ACC_ARMS,3000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_plasticrings",true,true),new ClothingItem("tint_beadbracelet","Bead Bracelets","",ClothingItem.TYPE_ACC_ARMS,3500,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_beadbracelet",true,true),new ClothingItem("tint_beadbangles","Beads and Bangles","",ClothingItem.TYPE_ACC_ARMS,4000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_beadbangles",true,true),new ClothingItem("tint_wristwatch","Wristwatch","",ClothingItem.TYPE_ACC_ARMS,3500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_ONLYONEARM,true,false,0,"tintclothes_wristwatch",true,true),new ClothingItem("tint_bucklebracelet","Buckle Bracelet","",ClothingItem.TYPE_ACC_ARMS,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_bucklebracelet",true,true,false,null,false,null,this.metalPalette),new ClothingItem("tint_belt_1","Basic Belt","",ClothingItem.TYPE_ACC_BELT,4000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_1",true,true,false,null,false,null,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_belt_2","Chain Belt","",ClothingItem.TYPE_ACC_BELT,4500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_2",true,true,true,null,false,null,this.metalPalette,this.metalPalette,null,null,-1,0,null,[2,3]),new ClothingItem("tint_belt_11","Chain Buckle Belt","",ClothingItem.TYPE_ACC_BELT,4500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_11",true,true,true,null,false,null,this.metalPalette,this.metalPalette,null,null,-1,0,null,[2,3]),new ClothingItem("tint_belt_3","Checkered Belt","",ClothingItem.TYPE_ACC_BELT,4000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_3",true,true,true,null,false,null,null,this.metalPalette,null,null,-1,0,null,[3]),new ClothingItem("tint_belt_4","Striped Belt","",ClothingItem.TYPE_ACC_BELT,4000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_4",true,true,true,null,false,null,null,this.metalPalette,null,null,-1,0,null,[3]),new ClothingItem("tint_belt_5","Zigzag Belt","",ClothingItem.TYPE_ACC_BELT,4000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_5",true,true,true,null,false,null,null,this.metalPalette,null,null,-1,0,null,[3]),new ClothingItem("tint_belt_6","Riveted Belt","",ClothingItem.TYPE_ACC_BELT,4500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_6",true,true,true,null,false,null,this.metalPalette,this.metalPalette,null,null,-1,0,null,[2,3]),new ClothingItem("tint_belt_7","Buckle Belt","",ClothingItem.TYPE_ACC_BELT,4000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_7",true,true,false,null,false,null,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_belt_8","Round Buckle Belt","",ClothingItem.TYPE_ACC_BELT,4500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_8",true,true,false,null,false,null,this.metalPalette,null,null,null,-1,0,null,[2]),new ClothingItem("tint_belt_9","Studded Belt","",ClothingItem.TYPE_ACC_BELT,4500,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_9",true,true,true,null,false,null,this.metalPalette,this.metalPalette,null,null,-1,0,null,[3]),new ClothingItem("tint_belt_10","Utility Belt","",ClothingItem.TYPE_ACC_BELT,6000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_belt_10",true,true,true,null,false,null,null,this.metalPalette,null,null,-1,0,null,[3]),new ClothingItem("tint_cloverbelt","Clover Belt","",ClothingItem.TYPE_ACC_BELT,4000,ClothingItem.GENDER_SWAP,0,true,false,0,"tintclothes_cloverbelt",true,true,true,null,false,null,null,this.metalPalette,null,null,-1,0,null,[3]),new ClothingItem("tint_shoes1","Laced Shoes","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes1",true,true,true),new ClothingItem("tint_shoes2","Sneakers","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes2",true,true,true),new ClothingItem("tint_shoes3","White Sneakers","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes3",true,true,true),new ClothingItem("tint_shoes4","Mocassins","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes4",true,true,true),new ClothingItem("tint_shoes6","Stitched Mocassins","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes6",true,true,true),new ClothingItem("tint_shoes5","Stitched Shoes","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes5",true,true,true),new ClothingItem("tint_shoes7","Skater Shoes","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes7",true,true,true),new ClothingItem("tint_shoes8","Striped Shoes","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes8",true,true,true),new ClothingItem("tint_shoesplaid","Plaid Shoes","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,true,0,"tintclothes_shoesplaid",true,true,true),new ClothingItem("tint_shoes_wingtips","Wingtips","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes_wingtips",true,true,true),new ClothingItem("tint_shoes_lacedmocs","Laced Mocassins","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes_lacedmocs",true,true,true),new ClothingItem("tint_shoes_twotonemocs","Two-Tone Mocassins","",ClothingItem.TYPE_SHOES,5000,ClothingItem.GENDER_ALL,0,true,false,0,"tintclothes_shoes_twotonemocs",true,true,true),new ClothingItem("tint_glasses01","Square Half-rims","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses01",true),new ClothingItem("tint_glasses02","Oval Half-rims","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses02",true),new ClothingItem("tint_glasses03","Slim Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses03",true),new ClothingItem("tint_glasses04","Oval Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses04",true),new ClothingItem("tint_glasses05","Rimmed Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses05",true),new ClothingItem("tint_glasses06","Thin Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses06",true),new ClothingItem("tint_glasses07","Rimless Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses07",true),new ClothingItem("tint_glasses08","Round Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses08",true),new ClothingItem("tint_glasses09","Large Round Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses09",true),new ClothingItem("tint_glasses10","Thick Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses10",true),new ClothingItem("tint_glasses11","Squared-Oval Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses11",true),new ClothingItem("tint_glasses12","Squared-Oval Rims","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_glasses12",true),new ClothingItem("tint_sunglasses01","Waywards","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_sunglasses01",true),new ClothingItem("tint_sunglasses02","Butterflies","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_sunglasses02",true),new ClothingItem("tint_sunglasses03","Cat Eyes","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_sunglasses03",true),new ClothingItem("tint_sunglasses04","Sport Shades","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_sunglasses04",true,true),new ClothingItem("tint_sunglasses05","Shields","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_sunglasses05",true,true,true),new ClothingItem("tint_sunglasses06","Aviators","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_sunglasses06",true,true),new ClothingItem("tint_eyepatch","Eye Patch","",ClothingItem.TYPE_ACC_FACE,4000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_eyepatch",true),new ClothingItem("tint_timmglasses","Fancy Glasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_timmglasses",true),new ClothingItem("tint_timmsunglasses","Fancy Sunglasses","",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES,true,false,0,"tintclothes_timmsunglasses",true,true),new ClothingItem("helmet02","Biker Helmet","",ClothingItem.TYPE_HAT,7500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_BLACK]),new ClothingItem("helmet03","Gladiator Helmet","",ClothingItem.TYPE_HAT,12000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_BRONZE]),new ClothingItem("hat13","Royal Crown","",ClothingItem.TYPE_HAT,12500,ClothingItem.GENDER_ALL,0,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_BRIGHTGOLD]),new ClothingItem("hat12","Chef Hat","Just like Papa Louie!",ClothingItem.TYPE_HAT,9500,ClothingItem.GENDER_ALL,0,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_WHITE]),new ClothingItem("hat16","Pirate Hat","Set sail for the Pirate Bash!",ClothingItem.TYPE_HAT,8000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_BLACK]),new ClothingItem("hat26","Onion Knit Hat","An Onionfest Favorite!",ClothingItem.TYPE_HAT,6500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_PURPLE,ClothingItem.TINT_ARMYGREEN]),new ClothingItem("hat07","Raccoon Cap","Ready to hit the frontier!",ClothingItem.TYPE_HAT,6500,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_MOCHA]),new ClothingItem("hat20","Viking Helmet","Show off your wild side -- or your weird side.",ClothingItem.TYPE_HAT,15000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_CAP,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_BLACK,ClothingItem.TINT_CREAM]),new ClothingItem("helmet_01","Army Helmet","",ClothingItem.TYPE_HAT,10000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAT_HELMET,true,false,0,null,false,false,false,null,false,[ClothingItem.TINT_ARMYGREEN]),new ClothingItem("glasses_monocle","Monocle","Fancy and sophisticated.",ClothingItem.TYPE_ACC_FACE,9000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES),new ClothingItem("glasses_clown","Clown Nose","Your customers will stop taking you seriously.",ClothingItem.TYPE_ACC_FACE,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_TRACKEYES),new ClothingItem("body_bronzeaward","Bronze Medal","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE),new ClothingItem("body_silveraward","Silver Medal","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE),new ClothingItem("body_goldaward","Gold Medal","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_SWAP,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE),new ClothingItem("body_dogtags","Dog Tags","",ClothingItem.TYPE_ACC_BODY,6000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_FRONTBODY | ClothingItem.OPTIONS_IS_NECKLACE),new ClothingItem("body_choker","Pendant Choker","",ClothingItem.TYPE_ACC_BODY,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_BEHINDCOLLAR | ClothingItem.OPTIONS_IS_NECKLACE),new ClothingItem("body_puka","Puka Necklace","Some puka shells strung onto a necklace.",ClothingItem.TYPE_ACC_BODY,5000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_HAS_NECK | ClothingItem.OPTIONS_BEHINDCOLLAR | ClothingItem.OPTIONS_IS_NECKLACE),new ClothingItem("beadbracelet6","Multi Beads","Multiple rows of beads.",ClothingItem.TYPE_ACC_ARMS,5000,ClothingItem.GENDER_ALL),new ClothingItem("beadbracelet5","Braided Band","A braided band tied with a knot.",ClothingItem.TYPE_ACC_ARMS,4000,ClothingItem.GENDER_ALL),new ClothingItem("beadbracelet2","Tied Bracelet","Beads and bands tied together.",ClothingItem.TYPE_ACC_ARMS,4000,ClothingItem.GENDER_ALL),new ClothingItem("bandaid","Bandage","Heal faster with a bandage.",ClothingItem.TYPE_ACC_ARMS,2000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_ONLYONEARM),new ClothingItem("smartwatch","Metal Smartwatch","Check your email on your wrist!",ClothingItem.TYPE_ACC_ARMS,12000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_ONLYONEARM),new ClothingItem("smartwatch2","Stylish Smartwatch","Check your email on your wrist!",ClothingItem.TYPE_ACC_ARMS,14000,ClothingItem.GENDER_ALL,ClothingItem.OPTIONS_ONLYONEARM),new ClothingItem("pukawrist","Puka Wristband","Some puka shells for your wrists.",ClothingItem.TYPE_ACC_ARMS,4000,ClothingItem.GENDER_ALL)];
         super();
         this.gameObj = param1;
      }
      
      public function getAvailableClothingTags(param1:String, param2:String, param3:Boolean = true, param4:Boolean = false, param5:Boolean = false, param6:Number = -1) : Array
      {
         var _loc9_:int = 0;
         var _loc10_:ClothingItem = null;
         var _loc7_:ClothingData = this;
         var _loc8_:Array = [];
         if(param1 == ClothingItem.TYPE_HAIR || param1 == ClothingItem.TYPE_BANGS || param1 == ClothingItem.TYPE_FACIALHAIR)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc7_.clothing.length)
            {
               if((_loc10_ = _loc7_.clothing[_loc9_]).type == param1 && (_loc10_.gender == ClothingItem.GENDER_ALL || _loc10_.gender == param2 || _loc10_.gender == ClothingItem.GENDER_SWAP))
               {
                  _loc8_.push(_loc10_.tag);
               }
               _loc9_++;
            }
         }
         else if(param4)
         {
            if(param1 == ClothingItem.TYPE_ACC_FACE)
            {
               _loc8_ = _loc7_.getGlassesForCreation();
            }
            else
            {
               _loc9_ = 0;
               while(_loc9_ < _loc7_.clothing.length)
               {
                  if((_loc10_ = _loc7_.clothing[_loc9_]).type == param1 && (_loc10_.gender == ClothingItem.GENDER_ALL || _loc10_.gender == param2 || _loc10_.gender == ClothingItem.GENDER_SWAP) && (!param4 || param4 && _loc10_.addToDefaultInventory == true))
                  {
                     _loc8_.push(_loc10_.tag);
                  }
                  _loc9_++;
               }
            }
         }
         else if(param3)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc7_.clothing.length)
            {
               if((_loc10_ = _loc7_.clothing[_loc9_]).inStore == true && (_loc10_.gender == ClothingItem.GENDER_ALL || _loc10_.gender == param2 || _loc10_.gender == ClothingItem.GENDER_SWAP) && _loc7_.gameObj.var_127.alreadyOwnsClothing(_loc10_.tag) == false)
               {
                  if(_loc10_.type != ClothingItem.TYPE_HAIR)
                  {
                     if(param1 == "any" || param1 == _loc10_.type)
                     {
                        if(param6 > 0 && (_loc10_.holidayBonus == param6 || _loc10_.tintHolidayBonus == param6))
                        {
                           _loc8_.unshift(_loc10_.tag);
                        }
                        else if(!(param6 > 0 && _loc10_.holidayBonus > 0 && _loc10_.holidayBonus != param6))
                        {
                           _loc8_.push(_loc10_.tag);
                        }
                     }
                  }
               }
               _loc9_++;
            }
         }
         else
         {
            _loc9_ = 0;
            while(_loc9_ < _loc7_.gameObj.var_127.clothingInventory.length)
            {
               if((_loc10_ = _loc7_.getItemFromSKU(_loc7_.gameObj.var_127.clothingInventory[_loc9_])).type == param1 && (_loc10_.gender == ClothingItem.GENDER_ALL || _loc10_.gender == param2 || _loc10_.gender == ClothingItem.GENDER_SWAP))
               {
                  _loc8_.push(_loc7_.gameObj.var_127.clothingInventory[_loc9_]);
               }
               _loc9_++;
            }
         }
         return _loc8_;
      }
      
      public function clothingHasOption(param1:String, param2:uint) : Boolean
      {
         var _loc3_:ClothingData = this;
         var _loc4_:Boolean = false;
         param1 = _loc3_.getBaseSKU(param1);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.clothing.length)
         {
            if(_loc3_.clothing[_loc5_].tag == param1 && Boolean(_loc3_.clothing[_loc5_].hasOption(param2)))
            {
               _loc4_ = true;
               break;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function clothingTraceOptions(param1:String) : void
      {
         var _loc2_:ClothingData = this;
         param1 = _loc2_.getBaseSKU(param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.clothing.length)
         {
            if(_loc2_.clothing[_loc4_].tag == param1)
            {
               _loc2_.clothing[_loc4_].traceAllOptions();
               break;
            }
            _loc4_++;
         }
      }
      
      public function clothingIsTinting(param1:String) : Boolean
      {
         var _loc2_:ClothingData = this;
         var _loc3_:Boolean = false;
         param1 = _loc2_.getBaseSKU(param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.clothing.length)
         {
            if(_loc2_.clothing[_loc4_].tag == param1)
            {
               if(_loc2_.clothing[_loc4_].isTinting())
               {
                  _loc3_ = true;
               }
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function isTintGroup(param1:String) : Boolean
      {
         this;
         return false;
      }
      
      public function getTintGroupHolidayBonus(param1:String) : Number
      {
         this;
         0;
         return 0;
      }
      
      public function getTintVariations(param1:String) : Array
      {
         this;
         return [];
      }
      
      public function getFirstTintVariation(param1:String, param2:Number = -1) : ClothingItem
      {
         this;
         null;
         return null;
      }
      
      public function getTintGroup(param1:String) : String
      {
         this;
         null;
         return null;
      }
      
      public function formatTag(param1:String, param2:String) : String
      {
         var _loc3_:ClothingData = this;
         var _loc4_:* = "";
         param1 = _loc3_.getBaseSKU(param1);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.clothing.length)
         {
            if(_loc3_.clothing[_loc5_].tag == param1)
            {
               if(_loc3_.clothing[_loc5_].isTinting())
               {
                  _loc4_ = String(_loc3_.clothing[_loc5_].tintSKU);
               }
               else
               {
                  _loc4_ = param1;
               }
               if(_loc3_.clothing[_loc5_].gender == ClothingItem.GENDER_SWAP)
               {
                  if(param2 == ClothingItem.GENDER_MALE)
                  {
                     _loc4_ += "_M";
                     break;
                  }
                  _loc4_ += "_F";
               }
               break;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function clothingHasHolidayBonus(param1:String, param2:Number) : Boolean
      {
         var _loc5_:int = 0;
         var _loc3_:ClothingData = this;
         var _loc4_:Boolean = false;
         param1 = _loc3_.getBaseSKU(param1);
         if(param2 != 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.clothing.length)
            {
               if(_loc3_.clothing[_loc5_].tag == param1)
               {
                  if(_loc3_.clothing[_loc5_].holidayBonus == param2 && param2 == GameData.STARTER_MONTH && _loc3_.gameObj.var_127.isNewYear() == false)
                  {
                     _loc4_ = false;
                     break;
                  }
                  if(_loc3_.clothing[_loc5_].holidayBonus == param2)
                  {
                     _loc4_ = true;
                  }
                  break;
               }
               _loc5_++;
            }
         }
         return _loc4_;
      }
      
      public function getClothingMatchingTheme(param1:String, param2:Number = 0) : Number
      {
         var _loc13_:Number = NaN;
         var _loc3_:ClothingData = this;
         if(param1 == "" || param1 == null)
         {
            return 0;
         }
         var _loc4_:String = _loc3_.getBaseSKU(param1);
         var _loc5_:ClothingItem = _loc3_.getItemFromSKU(_loc4_);
         var _loc6_:Number = _loc3_.getColorFromSKU(param1,1);
         var _loc7_:Number = _loc3_.getColorFromSKU(param1,2);
         var _loc8_:Number = _loc3_.getColorFromSKU(param1,3);
         var _loc9_:Number = _loc3_.getColorFromSKU(param1,4);
         if(_loc5_.isMinorColor(1))
         {
            _loc6_ = uint.MAX_VALUE;
         }
         if(_loc5_.isMinorColor(2))
         {
            _loc7_ = uint.MAX_VALUE;
         }
         if(_loc5_.isMinorColor(3))
         {
            _loc8_ = uint.MAX_VALUE;
         }
         if(_loc5_.isMinorColor(4))
         {
            _loc9_ = uint.MAX_VALUE;
         }
         if(_loc5_.isTinting() == false && _loc5_.limitColor1 != null && _loc5_.limitColor1.length > 0)
         {
            if(_loc5_.limitColor1.length > 0)
            {
               _loc6_ = Number(_loc5_.limitColor1[0]);
            }
            else
            {
               _loc6_ = uint.MAX_VALUE;
            }
            if(_loc5_.limitColor1.length > 1)
            {
               _loc7_ = Number(_loc5_.limitColor1[1]);
            }
            else
            {
               _loc7_ = uint.MAX_VALUE;
            }
            if(_loc5_.limitColor1.length > 2)
            {
               _loc8_ = Number(_loc5_.limitColor1[2]);
            }
            else
            {
               _loc8_ = uint.MAX_VALUE;
            }
            if(_loc5_.limitColor1.length > 3)
            {
               _loc9_ = Number(_loc5_.limitColor1[3]);
            }
            else
            {
               _loc9_ = uint.MAX_VALUE;
            }
         }
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc14_:int = 1;
         while(_loc14_ < _loc3_.holidayPalettes.length)
         {
            _loc13_ = 0;
            if(_loc3_.holidayPalettes[_loc14_].indexOf(_loc6_) > -1)
            {
               _loc13_++;
            }
            if(_loc3_.holidayPalettes[_loc14_].indexOf(_loc7_) > -1)
            {
               _loc13_++;
            }
            if(_loc3_.holidayPalettes[_loc14_].indexOf(_loc8_) > -1)
            {
               _loc13_++;
            }
            if(_loc3_.holidayPalettes[_loc14_].indexOf(_loc9_) > -1)
            {
               _loc13_++;
            }
            if(Boolean(_loc5_) && _loc5_.tintHolidayBonus == _loc14_)
            {
               _loc13_++;
            }
            if(_loc13_ > _loc10_)
            {
               _loc10_ = _loc13_;
               _loc11_ = _loc14_;
            }
            if(_loc14_ == param2)
            {
               _loc12_ = _loc13_;
            }
            _loc14_++;
         }
         if(_loc5_.isTinting() == false && _loc5_.limitColor1 != null && _loc5_.limitColor1.length > 0 && _loc12_ > 0)
         {
            return param2;
         }
         if(_loc5_.isTinting() == false && _loc5_.limitColor1 != null && _loc5_.limitColor1.length > 0 && _loc5_.holidayBonus == 0)
         {
            return _loc11_;
         }
         if(_loc5_.isTinting() == false && _loc5_.holidayBonus > 0)
         {
            return _loc5_.holidayBonus;
         }
         if(_loc12_ > 0)
         {
            return param2;
         }
         return _loc11_;
      }
      
      public function getClothingThemeFrame(param1:String, param2:Number = 0) : Number
      {
         var _loc3_:ClothingData = this;
         var _loc4_:Number;
         if((_loc4_ = _loc3_.getClothingMatchingTheme(param1,param2)) == 0)
         {
            _loc4_ = 13;
         }
         return _loc4_;
      }
      
      public function clothingExists(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:ClothingData = this;
         var _loc4_:Boolean = false;
         param1 = _loc3_.getBaseSKU(param1);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.clothing.length)
         {
            if(_loc3_.clothing[_loc5_].tag == param1)
            {
               _loc4_ = true;
               break;
            }
            if(param2 && (_loc3_.clothing[_loc5_].tag == param1 + "_male" || _loc3_.clothing[_loc5_].tag == param1 + "_female"))
            {
               _loc4_ = true;
               break;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getGlassesForCreation() : Array
      {
         this;
         return ["tint_glasses01:GR","tint_glasses01:K","tint_glasses01:BG","tint_glasses01:BZ","tint_glasses02:GR","tint_glasses02:K","tint_glasses02:BG","tint_glasses02:BZ","tint_glasses03:GR","tint_glasses03:K","tint_glasses03:BG","tint_glasses03:BZ","tint_glasses10:K","tint_glasses10:BZ"];
      }
      
      public function getSKUsForInventory(param1:String, param2:String, param3:Boolean = false, param4:String = null) : Array
      {
         this;
         var _loc6_:Array = ["tint_chefshirt:K-FG-SA","tint_shoes1:K-GR-FG","tint_shortapron:FG"];
         if(param1 == "marty" || param2 == WorkerData.GENDER_MALE)
         {
            _loc6_.push("tint_pants_1:SA","tint_sushi_headband:W");
         }
         else if(param1 == "rita")
         {
            _loc6_.push("tint_skirt_1:SA","tint_sushi_hairband:W");
         }
         else
         {
            _loc6_.push("tint_skirt_1:SA","tint_sushi_headband:W");
         }
         if(param1 == "marty")
         {
            _loc6_.push("tint_polo_open:A-W","tint_pants_10:DU-BS","tint_belt_1:K-GR","tint_shoes7:KH-K-W","tint_glasses12:DG");
         }
         else if(param1 == "rita")
         {
            _loc6_.push("tint_checker_hairband:W-K","tint_buttondowntucked:K-K","tint_skirt_1:W","tint_cloverbelt:K-W-GR","tint_necktie","tint_shoes3:K-K-K");
         }
         else if(param4 != null && param4 != "")
         {
            _loc6_.push(param4);
         }
         class_6.method_1("Generate Inventory: " + _loc6_.toString());
         return _loc6_;
      }
      
      public function getBaseSKU(param1:String) : String
      {
         this;
         if(param1.indexOf(":") > -1)
         {
            param1 = String(param1.split(":")[0]);
         }
         return param1;
      }
      
      public function checkValidTinting(param1:ClothingItem, param2:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:Boolean = false;
         var _loc3_:ClothingData = this;
         if(param2.indexOf(":") == -1)
         {
            class_6.error("ERROR - " + param2 + " doesn\'t have tinting information.");
            return;
         }
         if((_loc6_ = String(param2.split(":")[1]).split("-")).length == 0)
         {
            class_6.error("ERROR - " + param2 + " had 0 color codes in its SKU.");
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc6_.length)
            {
               _loc7_ = false;
               _loc5_ = 0;
               while(_loc5_ < _loc3_.colorCodes.length)
               {
                  if(_loc3_.colorCodes[_loc5_][1] == _loc6_[_loc4_])
                  {
                     _loc7_ = true;
                     break;
                  }
                  _loc5_++;
               }
               if(!_loc7_ && _loc6_[_loc4_] !== "0")
               {
                  class_6.error("ERROR - " + param2 + " color " + _loc4_ + " could not be found.");
               }
               _loc4_++;
            }
            if(_loc6_.length < 2 && param1.tintColor2 == true || _loc6_.length < 3 && param1.tintColor3 == true || _loc6_.length < 4 && param1.tintDecalColor == true)
            {
               class_6.error("ERROR - " + param2 + ": Not enough colors");
            }
            else if(_loc6_.length == 4 && param1.tintDecalColor == false || _loc6_.length == 3 && param1.tintColor3 == false || _loc6_.length == 2 && param1.tintColor2 == false)
            {
               class_6.error("ERROR - " + param2 + ": Too many colors");
            }
            if(_loc6_.length > 1 && _loc6_[1] !== "0" && param1.tintColor2 == false)
            {
               class_6.error("ERROR - " + param2 + ": Has a color 2 when it is blocked.");
            }
            else if(_loc6_.length > 2 && _loc6_[2] !== "0" && param1.tintColor3 == false)
            {
               class_6.error("ERROR - " + param2 + ": Has a color 3 when it is blocked.");
            }
            else if(_loc6_.length > 3 && _loc6_[3] !== "0" && param1.tintDecalColor == false)
            {
               class_6.error("ERROR - " + param2 + ": Has a color 4 when it is blocked.");
            }
         }
      }
      
      public function generateTintCode(param1:ClothingItem, param2:Number, param3:Number, param4:Number, param5:Number) : String
      {
         var _loc6_:ClothingData = this;
         var _loc7_:* = "";
         if(param1.isTinting())
         {
            if(param2 < 0)
            {
               param2 = 0;
            }
            if(param3 < 0)
            {
               param3 = 0;
            }
            if(param4 < 0)
            {
               param4 = 0;
            }
            if(param5 < 0)
            {
               param5 = 0;
            }
            if(param1.tintColor1)
            {
               _loc7_ += ":" + _loc6_.getCodeFromColor(param2);
            }
            else if(param1.tintColor2 || param1.tintColor3 || param1.tintDecalColor)
            {
               _loc7_ += ":0";
            }
            if(param1.tintColor2)
            {
               _loc7_ += "-" + _loc6_.getCodeFromColor(param3);
            }
            else if(param1.tintColor3 || param1.tintDecalColor)
            {
               _loc7_ += "-0";
            }
            if(param1.tintColor3)
            {
               _loc7_ += "-" + _loc6_.getCodeFromColor(param4);
            }
            else if(param1.tintDecalColor)
            {
               _loc7_ += "-0";
            }
            if(param1.tintDecalColor)
            {
               _loc7_ += "-" + _loc6_.getCodeFromColor(param5);
            }
         }
         return _loc7_;
      }
      
      public function getItemFromSKU(param1:String) : ClothingItem
      {
         var _loc2_:ClothingData = this;
         var _loc3_:ClothingItem = null;
         param1 = _loc2_.getBaseSKU(param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.clothing.length)
         {
            if(_loc2_.clothing[_loc4_].tag == param1)
            {
               _loc3_ = _loc2_.clothing[_loc4_];
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function tintThumbnailPart(param1:Boolean, param2:MovieClip, param3:ClothingItem, param4:String = null) : void
      {
         var _loc5_:ClothingData = this;
         if(param1)
         {
            if(param3.tintColor1 == true && param2.getChildByName("color1") != null)
            {
               param2.getChildByName("color1").transform.colorTransform = _loc5_.createColorTransform(_loc5_.getColorFromSKU(param4,1),true);
               MovieClip(param2.getChildByName("color1")).gotoAndStop(param2.currentFrame);
            }
            if(param3.tintColor2 == true && param2.getChildByName("color2") != null)
            {
               param2.getChildByName("color2").transform.colorTransform = _loc5_.createColorTransform(_loc5_.getColorFromSKU(param4,2),true);
               MovieClip(param2.getChildByName("color2")).gotoAndStop(param2.currentFrame);
            }
            if(param3.tintColor3 == true && param2.getChildByName("color3") != null)
            {
               param2.getChildByName("color3").transform.colorTransform = _loc5_.createColorTransform(_loc5_.getColorFromSKU(param4,3),true);
               MovieClip(param2.getChildByName("color3")).gotoAndStop(param2.currentFrame);
            }
         }
      }
      
      public function handleDecal(param1:MovieClip, param2:ClothingItem, param3:String, param4:String, param5:int = -1, param6:String = null) : void
      {
         var _loc9_:* = null;
         var _loc10_:MovieClip = null;
         var _loc8_:String;
         var _loc7_:ClothingData;
         if((_loc8_ = (_loc7_ = this).getDecalToUse(param2,param6)) != null && _loc8_ != "")
         {
            _loc9_ = _loc8_;
            if(param4 != "hat")
            {
               if(param3 == ClothingItem.GENDER_MALE)
               {
                  _loc9_ += "_M_";
               }
               else
               {
                  _loc9_ += "_F_";
               }
               _loc9_ += param4;
            }
            try
            {
               if((_loc10_ = class_14.method_103(_loc9_,false,false)) != null)
               {
                  _loc10_.gotoAndStop(param1.currentFrame);
                  if(param2.tintDecalColor == true)
                  {
                     _loc10_.transform.colorTransform = _loc7_.createColorTransform(_loc7_.getColorFromSKU(param6,4),true);
                  }
                  param1.addChild(_loc10_);
                  if(param5 != -1)
                  {
                     _loc10_.gotoAndStop(param5);
                  }
               }
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function getDecalToUse(param1:ClothingItem, param2:String) : String
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc3_:ClothingData = this;
         var _loc4_:String = null;
         if(Boolean(param1) && param1.tintDecal != null)
         {
            _loc5_ = _loc3_.getColorFromSKU(param2,1);
            _loc6_ = _loc3_.getColorFromSKU(param2,2);
            _loc7_ = _loc3_.getColorFromSKU(param2,3);
            _loc8_ = _loc3_.getColorFromSKU(param2,4);
            if(param1.decalSwap == null || param1.decalSwap.length == 0)
            {
               _loc4_ = param1.tintDecal;
            }
            else
            {
               _loc4_ = param1.tintDecal;
               _loc9_ = 0;
               while(_loc9_ < param1.decalSwap.length)
               {
                  if(param1.decalSwap[_loc9_][0] > -1 && param1.decalSwap[_loc9_][0] == _loc5_)
                  {
                     _loc4_ = String(param1.decalSwap[_loc9_][4]);
                     break;
                  }
                  if(param1.decalSwap[_loc9_][1] > -1 && param1.decalSwap[_loc9_][1] == _loc6_)
                  {
                     _loc4_ = String(param1.decalSwap[_loc9_][4]);
                     break;
                  }
                  if(param1.decalSwap[_loc9_][2] > -1 && param1.decalSwap[_loc9_][2] == _loc7_)
                  {
                     _loc4_ = String(param1.decalSwap[_loc9_][4]);
                     break;
                  }
                  if(param1.decalSwap[_loc9_][3] > -1 && param1.decalSwap[_loc9_][3] == _loc8_)
                  {
                     _loc4_ = String(param1.decalSwap[_loc9_][4]);
                     break;
                  }
                  _loc9_++;
               }
            }
         }
         return _loc4_;
      }
      
      public function generateClothingThumb(param1:String, param2:String, param3:Number = 32, param4:Number = 32, param5:Number = 64, param6:Number = 64, param7:uint = 16711680) : MovieClip
      {
         var useGender:String;
         var item:ClothingItem;
         var skinTrans:ColorTransform;
         var isTinting:Boolean;
         var bounds:Rectangle;
         var model:MovieClip = null;
         var ratio:Number = NaN;
         var torsoPart:MovieClip = null;
         var bicepPart1:MovieClip = null;
         var bicepPart2:MovieClip = null;
         var forearmPart1:MovieClip = null;
         var forearmPart2:MovieClip = null;
         var cuffpart1:MovieClip = null;
         var cuffpart2:MovieClip = null;
         var neckPartShirt:MovieClip = null;
         var pantsPart:MovieClip = null;
         var frontPartN:MovieClip = null;
         var accneckPartN:MovieClip = null;
         var frontPart:MovieClip = null;
         var backPart:MovieClip = null;
         var accneckPart:MovieClip = null;
         var arm_tag_suffix:String = null;
         var armPart:MovieClip = null;
         var armCuff:MovieClip = null;
         var handpart:MovieClip = null;
         var headPart:MovieClip = null;
         var backhairPart:MovieClip = null;
         var facialBasePart:MovieClip = null;
         var facialMouthPart:MovieClip = null;
         var banghairPart:MovieClip = null;
         var bangheadPart:MovieClip = null;
         var bangbackhairPart:MovieClip = null;
         var headaccPart:MovieClip = null;
         var hatPart:MovieClip = null;
         var shoePart:MovieClip = null;
         var sku:String = param1;
         var gender:String = param2;
         var centerX:Number = param3;
         var centerY:Number = param4;
         var maxWidth:Number = param5;
         var maxHeight:Number = param6;
         var tintColor:uint = param7;
         var data:ClothingData = this;
         if(tintColor == 16711680)
         {
            tintColor = data.gameObj.workerData.hairColor;
         }
         useGender = gender;
         item = data.getItemFromSKU(sku);
         skinTrans = data.createColorTransform(data.mannequinColor);
         isTinting = data.clothingIsTinting(sku);
         if(item == null)
         {
            model = new clothesthumb_none();
         }
         else if(item.type == ClothingItem.TYPE_SHIRT || item.type == ClothingItem.TYPE_JACKET)
         {
            model = new worker_mannequin_torso();
            if(useGender == WorkerData.GENDER_FEMALE)
            {
               model.body.male_skin.visible = false;
               model.body.female_skin.visible = true;
            }
            else
            {
               model.body.male_skin.visible = true;
               model.body.female_skin.visible = false;
            }
            torsoPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_body",false,false);
            torsoPart.gotoAndStop(1);
            data.tintThumbnailPart(isTinting,torsoPart,item,sku);
            data.handleDecal(torsoPart,item,useGender,"body",-1,sku);
            model.body.addChild(torsoPart);
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_BICEP))
            {
               bicepPart1 = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_upperarm",false,false);
               bicepPart1.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,bicepPart1,item,sku);
               data.handleDecal(bicepPart1,item,useGender,"upperarm",-1,sku);
               model.front_bicep.addChild(bicepPart1);
               bicepPart2 = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_upperarm",false,false);
               bicepPart2.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,bicepPart2,item,sku);
               data.handleDecal(bicepPart2,item,useGender,"upperarm",-1,sku);
               model.back_bicep.addChild(bicepPart2);
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_FOREARM))
            {
               forearmPart1 = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_forearm",false,false);
               forearmPart1.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,forearmPart1,item,sku);
               model.front_forearm.addChild(forearmPart1);
               forearmPart2 = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_forearm",false,false);
               forearmPart2.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,forearmPart2,item,sku);
               model.back_forearm.addChild(forearmPart2);
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_CUFF))
            {
               cuffpart1 = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_cuff",false,false);
               cuffpart1.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,cuffpart1,item,sku);
               model.front_cuff.addChild(cuffpart1);
               cuffpart2 = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_cuff",false,false);
               cuffpart2.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,cuffpart2,item,sku);
               model.back_cuff.addChild(cuffpart2);
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_NECK))
            {
               neckPartShirt = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_neck",false,false);
               neckPartShirt.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,neckPartShirt,item,sku);
               model.neck.addChild(neckPartShirt);
            }
            model.body.male_skin.transform.colorTransform = skinTrans;
            model.body.female_skin.transform.colorTransform = skinTrans;
            model.neck.skin.transform.colorTransform = skinTrans;
            model.front_forearm.skin.transform.colorTransform = skinTrans;
            model.front_bicep.skin.transform.colorTransform = skinTrans;
            model.back_forearm.skin.transform.colorTransform = skinTrans;
            model.back_bicep.skin.transform.colorTransform = skinTrans;
         }
         else if(item.type == ClothingItem.TYPE_PANTS || item.type == ClothingItem.TYPE_ACC_BELT)
         {
            model = new worker_mannequin_pants();
            if(useGender == WorkerData.GENDER_FEMALE)
            {
               model.body.male_skin.visible = false;
               model.body.female_skin.visible = true;
            }
            else
            {
               model.body.male_skin.visible = true;
               model.body.female_skin.visible = false;
            }
            pantsPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender));
            pantsPart.gotoAndStop(1);
            data.tintThumbnailPart(isTinting,pantsPart,item,sku);
            model.body.addChild(pantsPart);
            model.body.male_skin.transform.colorTransform = skinTrans;
            model.body.female_skin.transform.colorTransform = skinTrans;
         }
         else if(item.type == ClothingItem.TYPE_ACC_BODY && data.clothingHasOption(sku,ClothingItem.OPTIONS_IS_NECKLACE))
         {
            model = new worker_mannequin_bust();
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_FRONTBODY))
            {
               frontPartN = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_front",false,false);
               frontPartN.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,frontPartN,item,sku);
               model.body.addChild(frontPartN);
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_NECK))
            {
               accneckPartN = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_neck",false,false);
               accneckPartN.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,accneckPartN,item,sku);
               model.neck.addChild(accneckPartN);
            }
            model.body.male_skin.transform.colorTransform = skinTrans;
            model.neck.skin.transform.colorTransform = skinTrans;
         }
         else if(item.type == ClothingItem.TYPE_ACC_BODY)
         {
            model = new worker_mannequin_torso();
            if(useGender == WorkerData.GENDER_FEMALE)
            {
               model.body.male_skin.visible = false;
               model.body.female_skin.visible = true;
            }
            else
            {
               model.body.male_skin.visible = true;
               model.body.female_skin.visible = false;
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_FRONTBODY))
            {
               frontPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_front",false,false);
               frontPart.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,frontPart,item,sku);
               model.body.addChild(frontPart);
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_BACKBODY))
            {
               backPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_back",false,false);
               backPart.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,backPart,item,sku);
               model.back_acca.addChild(backPart);
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_NECK))
            {
               accneckPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_neck",false,false);
               accneckPart.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,accneckPart,item,sku);
               model.neck.addChild(accneckPart);
            }
            model.body.male_skin.transform.colorTransform = skinTrans;
            model.body.female_skin.transform.colorTransform = skinTrans;
            model.neck.skin.transform.colorTransform = skinTrans;
            model.front_forearm.skin.transform.colorTransform = skinTrans;
            model.front_bicep.skin.transform.colorTransform = skinTrans;
            model.back_forearm.skin.transform.colorTransform = skinTrans;
            model.back_bicep.skin.transform.colorTransform = skinTrans;
         }
         else if(item.type == ClothingItem.TYPE_ACC_ARMS)
         {
            model = new worker_mannequin_forearm();
            arm_tag_suffix = "";
            if(data.clothingHasOption(sku,ClothingItem.SHIRT_LONG))
            {
               arm_tag_suffix = "_forearm";
            }
            armPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + arm_tag_suffix,false,false);
            armPart.gotoAndStop(1);
            data.tintThumbnailPart(isTinting,armPart,item,sku);
            model.front_forearm.addChild(armPart);
            model.front_forearm.skin.transform.colorTransform = skinTrans;
            model.front_hand.skin.transform.colorTransform = skinTrans;
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_CUFF))
            {
               armCuff = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_cuff",false,false);
               armCuff.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,armCuff,item,sku);
               model.front_hand.cuffholder.addChild(armCuff);
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_HAND))
            {
               handpart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_hand",false,false);
               handpart.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,handpart,item,sku);
               model.front_hand.gloveholder.addChild(handpart);
            }
         }
         else if(item.type == ClothingItem.TYPE_HAIR)
         {
            model = new worker_mannequin_head();
            headPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_fg",false,false);
            headPart.gotoAndStop(1);
            headPart.hair.gotoAndStop(1);
            data.tintThumbnailPart(isTinting,headPart,item,sku);
            model.head.inside.addChild(headPart);
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_BACK_HAIR))
            {
               backhairPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_bg",false,false);
               backhairPart.gotoAndStop(1);
               backhairPart.hair.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,backhairPart,item,sku);
               model.back_hair.addChild(backhairPart);
               try
               {
                  backhairPart.hair.transform.colorTransform = data.createColorTransform(tintColor,true);
               }
               catch(err:Error)
               {
               }
            }
            else
            {
               model.removeChild(model.back_hair);
            }
            model.head.inside.skin.transform.colorTransform = skinTrans;
            try
            {
               headPart.hair.transform.colorTransform = data.createColorTransform(tintColor,true);
            }
            catch(err:Error)
            {
               class_6.method_1("Error coloring hair.");
            }
         }
         else if(item.type == ClothingItem.TYPE_FACIALHAIR)
         {
            model = new worker_mannequin_head();
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_BASE_FACIALHAIR))
            {
               facialBasePart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_base",false,false);
               facialBasePart.gotoAndStop(1);
               facialBasePart.transform.colorTransform = data.createColorTransform(tintColor,true);
               model.head.inside.addChild(facialBasePart);
            }
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_MOUTH_FACIALHAIR))
            {
               facialMouthPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_mouth",false,false);
               facialMouthPart.gotoAndStop(1);
               facialMouthPart.x = -26;
               facialMouthPart.y = -9;
               facialMouthPart.transform.colorTransform = data.createColorTransform(tintColor,true);
               model.head.inside.addChild(facialMouthPart);
            }
            model.head.inside.skin.transform.colorTransform = skinTrans;
         }
         else if(item.type == ClothingItem.TYPE_BANGS)
         {
            model = new worker_mannequin_head();
            banghairPart = class_14.method_103("worker_hair_bun_fg",false,false);
            banghairPart.gotoAndStop(1);
            banghairPart.hair.gotoAndStop(1);
            model.head.inside.addChild(banghairPart);
            try
            {
               banghairPart.hair.transform.colorTransform = data.createColorTransform(tintColor,true);
            }
            catch(err:Error)
            {
               class_6.method_1("Error coloring hair.");
            }
            bangheadPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_fg",false,false);
            bangheadPart.gotoAndStop(1);
            bangheadPart.hair.gotoAndStop(1);
            data.tintThumbnailPart(isTinting,bangheadPart,item,sku);
            model.head.inside.addChild(bangheadPart);
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAS_BACK_HAIR))
            {
               bangbackhairPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender) + "_bg",false,false);
               bangbackhairPart.gotoAndStop(1);
               bangbackhairPart.hair.gotoAndStop(1);
               data.tintThumbnailPart(isTinting,bangbackhairPart,item,sku);
               model.back_hair.addChild(bangbackhairPart);
               try
               {
                  bangbackhairPart.hair.transform.colorTransform = data.createColorTransform(tintColor,true);
               }
               catch(err:Error)
               {
               }
            }
            else
            {
               model.removeChild(model.back_hair);
            }
            model.head.inside.skin.transform.colorTransform = skinTrans;
            try
            {
               bangheadPart.hair.transform.colorTransform = data.createColorTransform(tintColor,true);
            }
            catch(err:Error)
            {
               class_6.method_1("Error coloring hair.");
            }
         }
         else if(item.type == ClothingItem.TYPE_ACC_FACE)
         {
            model = new worker_mannequin_head();
            headaccPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender),false,false);
            headaccPart.gotoAndStop(1);
            data.tintThumbnailPart(isTinting,headaccPart,item,sku);
            model.head.inside.addChild(headaccPart);
            model.head.inside.skin.transform.colorTransform = skinTrans;
            model.removeChild(model.back_hair);
         }
         else if(item.type == ClothingItem.TYPE_HAT)
         {
            model = new worker_mannequin_head();
            hatPart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender),false,false);
            hatPart.gotoAndStop(1);
            data.tintThumbnailPart(isTinting,hatPart,item,sku);
            data.handleDecal(hatPart,item,useGender,"hat",-1,sku);
            if(data.clothingHasOption(sku,ClothingItem.OPTIONS_HAT_CAP) || data.clothingHasOption(sku,ClothingItem.OPTIONS_HAT_HELMET) || data.clothingHasOption(sku,ClothingItem.OPTIONS_HAT_HAIRCLIP) || data.clothingHasOption(sku,ClothingItem.OPTIONS_HAT_FULLMASK))
            {
               model.head.inside.addChild(hatPart);
            }
            else
            {
               model.head.inside.addChildAt(hatPart,0);
            }
            model.head.inside.skin.transform.colorTransform = skinTrans;
            model.removeChild(model.back_hair);
         }
         else if(item.type == ClothingItem.TYPE_SHOES)
         {
            model = new worker_mannequin_foot();
            shoePart = class_14.method_103("worker_" + data.formatTag(item.tag,useGender),false,false);
            shoePart.gotoAndStop(1);
            data.tintThumbnailPart(isTinting,shoePart,item,sku);
            model.front_foot.addChild(shoePart);
            model.front_foot.skin.gotoAndStop(1);
         }
         bounds = model.getBounds(data.gameObj);
         if(bounds.width > bounds.height)
         {
            ratio = bounds.height / bounds.width;
            model.width = maxWidth;
            model.height = maxWidth * ratio;
         }
         else
         {
            ratio = bounds.width / bounds.height;
            model.height = maxHeight;
            model.width = maxHeight * ratio;
         }
         bounds = model.getBounds(data.gameObj);
         if(bounds.y + bounds.height > maxHeight / 2)
         {
            model.y = maxHeight / 2 - (bounds.y + bounds.height);
         }
         else if(bounds.y < 0 - maxHeight / 2)
         {
            model.y = 0 - maxHeight / 2 - bounds.y;
         }
         if(bounds.x + bounds.width > maxWidth / 2)
         {
            model.x = maxWidth / 2 - (bounds.x + bounds.width);
         }
         else if(bounds.x < 0 - maxWidth / 2)
         {
            model.x = 0 - maxWidth / 2 - bounds.x;
         }
         model.x += centerX;
         model.y += centerY;
         model.mouseEnabled = false;
         model.mouseChildren = false;
         return model;
      }
      
      public function createColorTransform(param1:Number, param2:Boolean = false) : ColorTransform
      {
         var _loc3_:ColorTransform = new ColorTransform();
         _loc3_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc3_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc3_.blueMultiplier = (param1 & 255) / 255;
         if(param2)
         {
            if(param1 == ClothingItem.TINT_WHITE)
            {
               _loc3_.redMultiplier = 0.7;
               _loc3_.greenMultiplier = 0.7;
               _loc3_.blueMultiplier = 0.7;
               _loc3_.redOffset = 70;
               _loc3_.greenOffset = 70;
               _loc3_.blueOffset = 70;
            }
            else if(param1 == ClothingItem.TINT_BLACK)
            {
               _loc3_.redMultiplier = 0.41;
               _loc3_.greenMultiplier = 0.41;
               _loc3_.blueMultiplier = 0.41;
               _loc3_.redOffset = -40;
               _loc3_.greenOffset = -40;
               _loc3_.blueOffset = -40;
            }
            else if(param1 == ClothingItem.TINT_DEEPBLACK)
            {
               _loc3_.redMultiplier = 0.35;
               _loc3_.greenMultiplier = 0.35;
               _loc3_.blueMultiplier = 0.35;
               _loc3_.redOffset = -40;
               _loc3_.greenOffset = -40;
               _loc3_.blueOffset = -40;
            }
            else if(param1 == ClothingItem.TINT_PINK)
            {
               _loc3_.redMultiplier = 1;
               _loc3_.greenMultiplier = 1;
               _loc3_.blueMultiplier = 1;
               _loc3_.redOffset = 72;
               _loc3_.greenOffset = -84;
               _loc3_.blueOffset = -10;
            }
            else if(param1 == ClothingItem.TINT_SALMON)
            {
               _loc3_.redMultiplier = 0.85;
               _loc3_.greenMultiplier = 0.85;
               _loc3_.blueMultiplier = 0.85;
               _loc3_.redOffset = 72;
               _loc3_.greenOffset = -61;
               _loc3_.blueOffset = -79;
            }
            else if(param1 == ClothingItem.TINT_LAVENDER)
            {
               _loc3_.redMultiplier = 0.7;
               _loc3_.blueMultiplier = 0.78;
               _loc3_.greenMultiplier = 0.75;
               _loc3_.redOffset = 51;
               _loc3_.greenOffset = 0;
               _loc3_.blueOffset = 113;
            }
            else if(param1 == ClothingItem.TINT_LIGHTTEAL)
            {
               _loc3_.redMultiplier = 1;
               _loc3_.greenMultiplier = 0.8;
               _loc3_.blueMultiplier = 0.8;
               _loc3_.redOffset = -57;
               _loc3_.greenOffset = 71;
               _loc3_.blueOffset = 80;
            }
            else if(param1 == ClothingItem.TINT_LIGHTPINK)
            {
               _loc3_.redMultiplier = 0.92;
               _loc3_.greenMultiplier = 0.88;
               _loc3_.blueMultiplier = 0.92;
               _loc3_.redOffset = 82;
               _loc3_.greenOffset = -17;
               _loc3_.blueOffset = 29;
            }
            else if(param1 == ClothingItem.TINT_YELLOW)
            {
               _loc3_.redMultiplier = 1;
               _loc3_.greenMultiplier = 0.9;
               _loc3_.blueMultiplier = 0;
               _loc3_.redOffset = 50;
               _loc3_.greenOffset = 25;
               _loc3_.blueOffset = 0;
            }
            else if(param1 == ClothingItem.TINT_BRIGHTGOLD)
            {
               _loc3_.redMultiplier = 1;
               _loc3_.greenMultiplier = 0.9;
               _loc3_.blueMultiplier = 0;
               _loc3_.redOffset = 60;
               _loc3_.greenOffset = 0;
               _loc3_.blueOffset = 0;
            }
            else if(param1 == ClothingItem.TINT_STRAW)
            {
               _loc3_.redMultiplier = 0.95;
               _loc3_.greenMultiplier = 0.88;
               _loc3_.blueMultiplier = 0.7;
               _loc3_.redOffset = 43;
               _loc3_.greenOffset = 32;
               _loc3_.blueOffset = 0;
            }
            else if(param1 == ClothingItem.TINT_NEONGREEN)
            {
               _loc3_.redMultiplier = 1;
               _loc3_.greenMultiplier = 1;
               _loc3_.blueMultiplier = 1;
               _loc3_.redOffset = -127;
               _loc3_.greenOffset = 13;
               _loc3_.blueOffset = -204;
            }
            else if(param1 == 16227863)
            {
               _loc3_.redMultiplier = 0.81;
               _loc3_.greenMultiplier = 0.64;
               _loc3_.blueMultiplier = 0.54;
               _loc3_.redOffset = 91;
               _loc3_.greenOffset = 31;
               _loc3_.blueOffset = -87;
            }
            else if(param1 == 16574546)
            {
               _loc3_.redMultiplier = 0.97;
               _loc3_.greenMultiplier = 0.95;
               _loc3_.blueMultiplier = 0.51;
               _loc3_.redOffset = 63;
               _loc3_.greenOffset = 7;
               _loc3_.blueOffset = 0;
            }
            else if(param1 == 16776299)
            {
               _loc3_.redMultiplier = 1;
               _loc3_.greenMultiplier = 1;
               _loc3_.blueMultiplier = 0.68;
               _loc3_.redOffset = 66;
               _loc3_.greenOffset = 18;
               _loc3_.blueOffset = 0;
            }
            else if(param1 == 16776332)
            {
               _loc3_.redMultiplier = 0.99;
               _loc3_.greenMultiplier = 0.91;
               _loc3_.blueMultiplier = 0.72;
               _loc3_.redOffset = 63;
               _loc3_.greenOffset = 48;
               _loc3_.blueOffset = 0;
            }
            else if(param1 == 16748497)
            {
               _loc3_.redMultiplier = 0.77;
               _loc3_.greenMultiplier = 0.84;
               _loc3_.blueMultiplier = 0.82;
               _loc3_.redOffset = 61;
               _loc3_.greenOffset = -38;
               _loc3_.blueOffset = 0;
            }
         }
         return _loc3_;
      }
      
      public function getCodeFromColor(param1:uint) : String
      {
         var _loc2_:ClothingData = this;
         var _loc3_:String = String(param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.colorCodes.length)
         {
            if(_loc2_.colorCodes[_loc4_][0] == param1)
            {
               _loc3_ = String(_loc2_.colorCodes[_loc4_][1]);
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getColorFromCode(param1:String) : uint
      {
         var _loc2_:ClothingData = this;
         var _loc3_:uint = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.colorCodes.length)
         {
            if(_loc2_.colorCodes[_loc5_][1] == param1)
            {
               _loc3_ = uint(_loc2_.colorCodes[_loc5_][0]);
               _loc4_ = true;
               break;
            }
            _loc5_++;
         }
         if(!_loc4_)
         {
            _loc3_ = uint(param1);
         }
         return _loc3_;
      }
      
      public function getColorFromSKU(param1:String, param2:Number) : uint
      {
         var _loc5_:Array = null;
         var _loc3_:ClothingData = this;
         var _loc4_:uint = uint.MAX_VALUE;
         if(param1.indexOf(":") > -1)
         {
            if((_loc5_ = String(param1.split(":")[1]).split("-")).length > param2 - 1)
            {
               _loc4_ = _loc3_.getColorFromCode(_loc5_[param2 - 1]);
            }
         }
         return _loc4_;
      }
      
      public function getAllColorsFromSKU(param1:String) : Array
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc2_:ClothingData = this;
         var _loc3_:Array = [];
         if(param1.indexOf(":") > -1)
         {
            _loc4_ = String(param1.split(":")[1]).split("-");
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if(_loc4_[_loc5_] == "0")
               {
                  _loc3_.push(int.MIN_VALUE);
               }
               else
               {
                  _loc3_.push(_loc2_.getColorFromCode(_loc4_[_loc5_]));
               }
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public function getHolidayPalette(param1:Number) : Array
      {
         var _loc2_:ClothingData = this;
         if(param1 >= 0 && param1 < _loc2_.holidayPalettes.length)
         {
            return _loc2_.holidayPalettes[param1];
         }
         return [];
      }
      
      public function getMainPalette(param1:String, param2:Number) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:ClothingData = this;
         var _loc4_:Array = [];
         var _loc6_:ClothingItem;
         if(_loc6_ = _loc3_.getItemFromSKU(param1))
         {
            if(param2 == 1 && _loc6_.tintColor1 && _loc6_.limitColor1 != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc6_.limitColor1.length)
               {
                  _loc4_.push(_loc6_.limitColor1[_loc5_]);
                  _loc5_++;
               }
            }
            else if(param2 == 2 && _loc6_.tintColor2 && _loc6_.limitColor2 != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc6_.limitColor2.length)
               {
                  _loc4_.push(_loc6_.limitColor2[_loc5_]);
                  _loc5_++;
               }
            }
            else if(param2 == 3 && _loc6_.tintColor3 && _loc6_.limitColor3 != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc6_.limitColor3.length)
               {
                  _loc4_.push(_loc6_.limitColor3[_loc5_]);
                  _loc5_++;
               }
            }
            else if(param2 == 4 && _loc6_.tintDecalColor && _loc6_.limitDecalColor != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc6_.limitDecalColor.length)
               {
                  _loc4_.push(_loc6_.limitDecalColor[_loc5_]);
                  _loc5_++;
               }
            }
         }
         if(_loc4_.length == 0)
         {
            if(_loc3_.mainPalette.length == 0)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc3_.colorCodes.length)
               {
                  if(_loc3_.colorCodes[_loc5_].length == 2)
                  {
                     _loc3_.mainPalette.push(_loc3_.colorCodes[_loc5_][0]);
                  }
                  _loc5_++;
               }
            }
            _loc5_ = 0;
            while(_loc5_ < _loc3_.mainPalette.length)
            {
               _loc4_.push(_loc3_.mainPalette[_loc5_]);
               _loc5_++;
            }
         }
         return _loc4_;
      }
   }
}
