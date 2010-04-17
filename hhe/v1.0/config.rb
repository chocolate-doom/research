
module Heretic_1_0

NAME="v1.0"

NUM_STATES=1206
NUM_MOBJS=161

STATE_OFFSET=0x8bf04
MOBJINFO_OFFSET=606956
STRINGS_OFFSET=554068

# Locations of action pointer functions for Heretic 1.0.  Hand-constructed.

ACTION_POINTERS = {
    78512 => "A_FreeTargMobj",
    82048 => "A_RestoreSpecialThing1",
    82128 => "A_RestoreSpecialThing2",
    78736 => "A_HideThing",
    78752 => "A_UnHideThing",
    81952 => "A_RestoreArtifact",
    76144 => "A_Scream",
    76784 => "A_Explode",
    76896 => "A_PodPain",
    77056 => "A_RemovePod",
    77104 => "A_MakePod",
    77728 => "A_InitKeyGizmo",
    77824 => "A_VolcanoSet",
    77856 => "A_VolcanoBlast",
    70480 => "A_BeastPuff",
    78080 => "A_VolcBallImpact",
    77520 => "A_SpawnTeleGlitter",
    77600 => "A_SpawnTeleGlitter2",
    77680 => "A_AccTeleGlitter",
    117648 => "A_Light0",
    111168 => "A_WeaponReady",
    111760 => "A_Lower",
    111920 => "A_Raise",
    112640 => "A_StaffAttackPL1",
    111696 => "A_ReFire",
    112784 => "A_StaffAttackPL2",
    111568 => "A_BeakReady",
    111856 => "A_BeakRaise",
    112272 => "A_BeakAttackPL1",
    112448 => "A_BeakAttackPL2",
    117184 => "A_GauntletAttack",
    112928 => "A_FireBlasterPL1",
    113072 => "A_FireBlasterPL2",
    115088 => "A_SpawnRippers",
    113760 => "A_FireMacePL1",
    114624 => "A_FireMacePL2",
    113904 => "A_MacePL1Check",
    114032 => "A_MaceBallImpact",
    114192 => "A_MaceBallImpact2",
    114752 => "A_DeathBallImpact",
    115568 => "A_FireSkullRodPL1",
    115648 => "A_FireSkullRodPL2",
    115776 => "A_SkullRodPL2Seek",
    115808 => "A_AddPlayerRain",
    116336 => "A_HideInCeiling",
    115984 => "A_SkullRodStorm",
    116272 => "A_RainImpact",
    113152 => "A_FireGoldWandPL1",
    113296 => "A_FireGoldWandPL2",
    116368 => "A_FirePhoenixPL1",
    116720 => "A_InitPhoenixPL2",
    116736 => "A_FirePhoenixPL2",
    117104 => "A_ShutdownPhoenixPL2",
    116496 => "A_PhoenixPuff",
    116480 => "A_RemovedPhoenixFunc",    # anomaly!
    117120 => "A_FlameEnd",
    117152 => "A_FloatPuff",
    115232 => "A_FireCrossbowPL1",
    115312 => "A_FireCrossbowPL2",
    115456 => "A_BoltSpark",
    69984 => "A_Pain",
    76400 => "A_NoBlocking",
    78608 => "A_AddPlayerCorpse",
    78288 => "A_SkullPop",
    78704 => "A_FlameSnd",
    78448 => "A_CheckSkullFloor",
    78480 => "A_CheckSkullDone",
    71568 => "A_Feathers",
    71456 => "A_ChicLook",
    71488 => "A_ChicChase",
    71520 => "A_ChicPain",
    69872 => "A_FaceTarget",
    71376 => "A_ChicAttack",
    69200 => "A_Look",
    69328 => "A_Chase",
    71808 => "A_MummyAttack",
    71920 => "A_MummyAttack2",
    72048 => "A_MummySoul",
    108432 => "A_ContMobjSound",
    72016 => "A_MummyFX1Seek",
    74640 => "A_BeastAttack",
    75632 => "A_SnakeAttack",
    75712 => "A_SnakeAttack2",
    74752 => "A_HeadAttack",
    77344 => "A_BossDeath",
    75328 => "A_HeadIceImpact",
    75488 => "A_HeadFireGrow",
    75168 => "A_WhirlwindSeek",
    75792 => "A_ClinkAttack",
    75888 => "A_WizAtk1",
    75920 => "A_WizAtk2",
    75952 => "A_WizAtk3",
    75872 => "A_GhostOff",
    70592 => "A_ImpMeAttack",
    70672 => "A_ImpMsAttack",
    70880 => "A_ImpMsAttack2",
    70976 => "A_ImpDeath",
    71024 => "A_ImpXDeath1",
    71072 => "A_ImpXDeath2",
    70304 => "A_ImpExplode",
    70160 => "A_KnightAttack",
    70016 => "A_DripBlood",
    72144 => "A_Sor1Chase",
    72096 => "A_Sor1Pain",
    72192 => "A_Srcr1Attack",
    73456 => "A_SorZap",
    72480 => "A_SorcererRise",
    73488 => "A_SorRise",
    73616 => "A_SorSightSnd",
    72816 => "A_Srcr2Decide",
    72896 => "A_Srcr2Attack",
    73392 => "A_Sor2DthInit",
    73520 => "A_SorDSph",
    73424 => "A_Sor2DthLoop",
    73552 => "A_SorDExp",
    73584 => "A_SorDBon",
    73120 => "A_BlueSpark",
    73232 => "A_GenWizard",
    73648 => "A_MinotaurAtk1",
    73760 => "A_MinotaurDecide",
    74112 => "A_MinotaurAtk2",
    74352 => "A_MinotaurAtk3",
    74032 => "A_MinotaurCharge",
    74528 => "A_MntrFloorFire",
    77472 => "A_ESound",
}

end

