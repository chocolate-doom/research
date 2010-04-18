
module Heretic_1_3

NAME="v1.3"
SUFFIX="1_3"

NUM_STATES=1206
NUM_MOBJS=160

STATE_OFFSET=0x8e8b4
MOBJINFO_OFFSET=617600
STRINGS_OFFSET=563284

# Action pointers for Heretic 1.3.

ACTION_POINTERS = {
    81072 => "A_FreeTargMobj",
    84608 => "A_RestoreSpecialThing1",
    84656 => "A_RestoreSpecialThing2",
    81296 => "A_HideThing",
    81312 => "A_UnHideThing",
    84528 => "A_RestoreArtifact",
    78640 => "A_Scream",
    79312 => "A_Explode",
    79424 => "A_PodPain",
    79584 => "A_RemovePod",
    79632 => "A_MakePod",
    80256 => "A_InitKeyGizmo",
    80352 => "A_VolcanoSet",
    80384 => "A_VolcanoBlast",
    73056 => "A_BeastPuff",
    80608 => "A_VolcBallImpact",
    80048 => "A_SpawnTeleGlitter",
    80128 => "A_SpawnTeleGlitter2",
    80208 => "A_AccTeleGlitter",
    120064 => "A_Light0",
    113728 => "A_WeaponReady",
    114320 => "A_Lower",
    114480 => "A_Raise",
    115088 => "A_StaffAttackPL1",
    114256 => "A_ReFire",
    115232 => "A_StaffAttackPL2",
    114128 => "A_BeakReady",
    114416 => "A_BeakRaise",
    114720 => "A_BeakAttackPL1",
    114896 => "A_BeakAttackPL2",
    119584 => "A_GauntletAttack",
    115376 => "A_FireBlasterPL1",
    115520 => "A_FireBlasterPL2",
    117520 => "A_SpawnRippers",
    116208 => "A_FireMacePL1",
    117056 => "A_FireMacePL2",
    116352 => "A_MacePL1Check",
    116464 => "A_MaceBallImpact",
    116624 => "A_MaceBallImpact2",
    117184 => "A_DeathBallImpact",
    118000 => "A_FireSkullRodPL1",
    118080 => "A_FireSkullRodPL2",
    118208 => "A_SkullRodPL2Seek",
    118240 => "A_AddPlayerRain",
    118752 => "A_HideInCeiling",
    118416 => "A_SkullRodStorm",
    118688 => "A_RainImpact",
    115600 => "A_FireGoldWandPL1",
    115744 => "A_FireGoldWandPL2",
    118784 => "A_FirePhoenixPL1",
    119120 => "A_InitPhoenixPL2",
    119136 => "A_FirePhoenixPL2",
    119504 => "A_ShutdownPhoenixPL2",
    118896 => "A_PhoenixPuff",
    #0000 => "A_RemovedPhoenixFunc",    # anomaly!
    119520 => "A_FlameEnd",
    119552 => "A_FloatPuff",
    117664 => "A_FireCrossbowPL1",
    117744 => "A_FireCrossbowPL2",
    117888 => "A_BoltSpark",
    72560 => "A_Pain",
    78896 => "A_NoBlocking",
    81168 => "A_AddPlayerCorpse",
    80816 => "A_SkullPop",
    81264 => "A_FlameSnd",
    81040 => "A_CheckBurnGone",
    80976 => "A_CheckSkullFloor",
    81008 => "A_CheckSkullDone",
    74144 => "A_Feathers",
    74032 => "A_ChicLook",
    74064 => "A_ChicChase",
    74096 => "A_ChicPain",
    72464 => "A_FaceTarget",
    73952 => "A_ChicAttack",
    71792 => "A_Look",
    71920 => "A_Chase",
    74352 => "A_MummyAttack",
    74464 => "A_MummyAttack2",
    74592 => "A_MummySoul",
    111056 => "A_ContMobjSound",
    74560 => "A_MummyFX1Seek",
    77184 => "A_BeastAttack",
    78112 => "A_SnakeAttack",
    78192 => "A_SnakeAttack2",
    77296 => "A_HeadAttack",
    79872 => "A_BossDeath",
    77888 => "A_HeadIceImpact",
    78048 => "A_HeadFireGrow",
    77728 => "A_WhirlwindSeek",
    78272 => "A_ClinkAttack",
    78384 => "A_WizAtk1",
    78416 => "A_WizAtk2",
    78448 => "A_WizAtk3",
    78368 => "A_GhostOff",
    73168 => "A_ImpMeAttack",
    73248 => "A_ImpMsAttack",
    73456 => "A_ImpMsAttack2",
    73552 => "A_ImpDeath",
    73600 => "A_ImpXDeath1",
    73648 => "A_ImpXDeath2",
    72880 => "A_ImpExplode",
    72736 => "A_KnightAttack",
    72592 => "A_DripBlood",
    74688 => "A_Sor1Chase",
    74640 => "A_Sor1Pain",
    74736 => "A_Srcr1Attack",
    76000 => "A_SorZap",
    75024 => "A_SorcererRise",
    76032 => "A_SorRise",
    76160 => "A_SorSightSnd",
    75360 => "A_Srcr2Decide",
    75440 => "A_Srcr2Attack",
    75936 => "A_Sor2DthInit",
    76064 => "A_SorDSph",
    75968 => "A_Sor2DthLoop",
    76096 => "A_SorDExp",
    76128 => "A_SorDBon",
    75664 => "A_BlueSpark",
    75776 => "A_GenWizard",
    76192 => "A_MinotaurAtk1",
    76304 => "A_MinotaurDecide",
    76656 => "A_MinotaurAtk2",
    76896 => "A_MinotaurAtk3",
    76576 => "A_MinotaurCharge",
    77072 => "A_MntrFloorFire",
    80000 => "A_ESound",
}

end

