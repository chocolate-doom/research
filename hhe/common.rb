
require "json"
require "v1.0/config.rb"
require "v1.2/config.rb"
require "v1.3/config.rb"

# Symbolic sprite names, from info.h.

SPRITE_NAMES = %w{
    SPR_IMPX SPR_ACLO SPR_PTN1 SPR_SHLD SPR_SHD2 SPR_BAGH SPR_SPMP SPR_INVS
    SPR_PTN2 SPR_SOAR SPR_INVU SPR_PWBK SPR_EGGC SPR_EGGM SPR_FX01 SPR_SPHL
    SPR_TRCH SPR_FBMB SPR_XPL1 SPR_ATLP SPR_PPOD SPR_AMG1 SPR_SPSH SPR_LVAS
    SPR_SLDG SPR_SKH1 SPR_SKH2 SPR_SKH3 SPR_SKH4 SPR_CHDL SPR_SRTC SPR_SMPL
    SPR_STGS SPR_STGL SPR_STCS SPR_STCL SPR_KFR1 SPR_BARL SPR_BRPL SPR_MOS1
    SPR_MOS2 SPR_WTRH SPR_HCOR SPR_KGZ1 SPR_KGZB SPR_KGZG SPR_KGZY SPR_VLCO
    SPR_VFBL SPR_VTFB SPR_SFFI SPR_TGLT SPR_TELE SPR_STFF SPR_PUF3 SPR_PUF4
    SPR_BEAK SPR_WGNT SPR_GAUN SPR_PUF1 SPR_WBLS SPR_BLSR SPR_FX18 SPR_FX17
    SPR_WMCE SPR_MACE SPR_FX02 SPR_WSKL SPR_HROD SPR_FX00 SPR_FX20 SPR_FX21
    SPR_FX22 SPR_FX23 SPR_GWND SPR_PUF2 SPR_WPHX SPR_PHNX SPR_FX04 SPR_FX08
    SPR_FX09 SPR_WBOW SPR_CRBW SPR_FX03 SPR_BLOD SPR_PLAY SPR_FDTH SPR_BSKL
    SPR_CHKN SPR_MUMM SPR_FX15 SPR_BEAS SPR_FRB1 SPR_SNKE SPR_SNFX SPR_HEAD
    SPR_FX05 SPR_FX06 SPR_FX07 SPR_CLNK SPR_WZRD SPR_FX11 SPR_FX10 SPR_KNIG
    SPR_SPAX SPR_RAXE SPR_SRCR SPR_FX14 SPR_SOR2 SPR_SDTH SPR_FX16 SPR_MNTR
    SPR_FX12 SPR_FX13 SPR_AKYY SPR_BKYY SPR_CKYY SPR_AMG2 SPR_AMM1 SPR_AMM2
    SPR_AMC1 SPR_AMC2 SPR_AMS1 SPR_AMS2 SPR_AMP1 SPR_AMP2 SPR_AMB1 SPR_AMB2
}

SOUND_EFFECTS = %w{
    sfx_None sfx_gldhit sfx_gntful sfx_gnthit sfx_gntpow sfx_gntact
    sfx_gntuse sfx_phosht sfx_phohit sfx_phopow sfx_lobsht sfx_lobhit
    sfx_lobpow sfx_hrnsht sfx_hrnhit sfx_hrnpow sfx_ramphit sfx_ramrain
    sfx_bowsht sfx_stfhit sfx_stfpow sfx_stfcrk sfx_impsit sfx_impat1
    sfx_impat2 sfx_impdth sfx_impact sfx_imppai sfx_mumsit sfx_mumat1
    sfx_mumat2 sfx_mumdth sfx_mumact sfx_mumpai sfx_mumhed sfx_bstsit
    sfx_bstatk sfx_bstdth sfx_bstact sfx_bstpai sfx_clksit sfx_clkatk
    sfx_clkdth sfx_clkact sfx_clkpai sfx_snksit sfx_snkatk sfx_snkdth
    sfx_snkact sfx_snkpai sfx_kgtsit sfx_kgtatk sfx_kgtat2 sfx_kgtdth
    sfx_kgtact sfx_kgtpai sfx_wizsit sfx_wizatk sfx_wizdth sfx_wizact
    sfx_wizpai sfx_minsit sfx_minat1 sfx_minat2 sfx_minat3 sfx_mindth
    sfx_minact sfx_minpai sfx_hedsit sfx_hedat1 sfx_hedat2 sfx_hedat3
    sfx_heddth sfx_hedact sfx_hedpai sfx_sorzap sfx_sorrise sfx_sorsit
    sfx_soratk sfx_soract sfx_sorpai sfx_sordsph sfx_sordexp sfx_sordbon
    sfx_sbtsit sfx_sbtatk sfx_sbtdth sfx_sbtact sfx_sbtpai sfx_plroof
    sfx_plrpai sfx_plrdth sfx_gibdth sfx_plrwdth sfx_plrcdth sfx_itemup
    sfx_wpnup sfx_telept sfx_doropn sfx_dorcls sfx_dormov sfx_artiup
    sfx_switch sfx_pstart sfx_pstop sfx_stnmov sfx_chicpai sfx_chicatk
    sfx_chicdth sfx_chicact sfx_chicpk1 sfx_chicpk2 sfx_chicpk3 sfx_keyup
    sfx_ripslop sfx_newpod sfx_podexp sfx_bounce sfx_volsht sfx_volhit
    sfx_burn sfx_splash sfx_gloop sfx_respawn sfx_blssht sfx_blshit
    sfx_chat sfx_artiuse sfx_gfrag sfx_waterfl sfx_wind sfx_amb1 sfx_amb2
    sfx_amb3 sfx_amb4 sfx_amb5 sfx_amb6 sfx_amb7 sfx_amb8 sfx_amb9
    sfx_amb10 sfx_amb11
}

MOBJINFO_FIELDS = %w{
    doomednum spawnstate spawnhealth seestate seesound reactiontime
    attacksound painstate painchance painsound meleestate missilestate
    crashstate deathstate xdeathstate deathsound speed radius height
    mass damage activesound flags flags2
}

THING_FLAGS1 = %w{
    MF_SPECIAL MF_SOLID MF_SHOOTABLE MF_NOSECTOR
    MF_NOBLOCKMAP MF_AMBUSH MF_JUSTHIT MF_JUSTATTACKED
    MF_SPAWNCEILING MF_NOGRAVITY MF_DROPOFF MF_PICKUP
    MF_NOCLIP MF_SLIDE MF_FLOAT MF_TELEPORT
    MF_MISSILE MF_DROPPED MF_SHADOW MF_NOBLOOD
    MF_CORPSE MF_INFLOAT MF_COUNTKILL MF_COUNTITEM
    MF_SKULLFLY MF_NOTDMATCH MF_TRANS1 MF_TRANS2
}

THING_FLAGS2 = %w{
    MF2_LOGRAV MF2_WINDTHRUST MF2_FLOORBOUNCE MF2_THRUGHOST
    MF2_FLY MF2_FOOTCLIP MF2_SPAWNFLOAT MF2_NOTELEPORT
    MF2_RIP MF2_PUSHABLE MF2_SLIDE MF2_ONMOBJ
    MF2_PASSMOBJ MF2_CANNOTPUSH MF2_FEETARECLIPPED MF2_BOSS
    MF2_FIREDAMAGE MF2_NODMGTHRUST MF2_TELESTOMP MF2_FLOATBOB
    MF2_DONTDRAW
}

# HHE seems to stop when it has found this many strings:

NUM_STRINGS=785

def find_config(name)
	configs = [ Heretic_1_0, Heretic_1_2, Heretic_1_3 ]

	for config in configs
		if name == config::NAME
			return config
		end
	end

	raise "Unknown configuration: #{name}"
end

def set_config(name)
	config = find_config(name)
	include config
end

def read_block(file)
        result = ""

        4.times do
                break if file.eof?
                c = file.readchar
                result += sprintf("%c", c)
        end

        end_index = result.index(0)
        if end_index
                result = result[0, end_index]
        end

        result
end

def bad_string?(str)
	str.each_byte do |b|
		if b >= 0x80
			return true
		end
	end

	return false
end

def find_strings(filename, config)

	strings = []

	File.open(filename) do |file|
		current_str = ""

		file.seek(config::STRINGS_OFFSET)

		offset = 0
		start_offset = nil

		while strings.length < NUM_STRINGS
			block = read_block(file)

			if start_offset == nil
				start_offset = offset
			end

			current_str += block

			# End of string?

			if block.length < 4

				# Extended-ASCII characters cannot be output
				# to JSON.

				if bad_string?(current_str)
					current_str = nil
				end

				strings.push([start_offset, current_str])

				current_str = ""
				start_offset = nil
			end

			offset += 4
		end
	end

	strings
end

