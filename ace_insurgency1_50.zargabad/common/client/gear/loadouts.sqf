if isWest then {
                primaries = [
                "M16A2",
                "M16A2GL",
                "M24_des_EP1",
                "M14_EP1",
                "m240_scoped_EP1",
                "M249_EP1",
                "M249_TWS_EP1",
                "M249_m145_EP1",
                "M4A1",
                "M4A3_CCO_EP1",
                "M4A3_RCO_GL_EP1",
                "SCAR_L_CQC",
                "SCAR_L_CQC_Holo",
                "SCAR_L_STD_Mk4CQT",
                "SCAR_L_STD_EGLM_RCO",
                "SCAR_L_CQC_EGLM_Holo",
                "SCAR_L_STD_EGLM_TWS",
                "SCAR_L_STD_HOLO",
                "SCAR_H_CQC_CCO",
                "SCAR_H_STD_EGLM_Spect",
                "M8_HOLO_SD",
                "M8_COMPACT_PMC",
                "M8_CARBINE_PMC",
                "AA12_PMC",
                "G36A_camo",
                "G36C_camo",
                "G36_C_SD_camo",
                "G36K_camo",
				"BAF_L110A1_Aim",
                "BAF_L7A2_GPMG",
                "BAF_L85A2_RIS_ACOG",
                "BAF_L85A2_RIS_CWS",
                "BAF_L85A2_RIS_Holo",
                "BAF_L85A2_RIS_SUSAT",
                "BAF_L85A2_UGL_ACOG",
                "BAF_L85A2_UGL_Holo",
                "BAF_L85A2_UGL_SUSAT",
                "BAF_L86A2_ACOG",
                "BAF_LRR_scoped"
                ];

                secondaries = [
                "M136",
                "Javelin",
                "Stinger",
                "US_Assault_Pack_EP1",
                "US_Assault_Pack_Ammo_EP1",
                "US_Assault_Pack_AmmoSAW_EP1",
                "US_Assault_Pack_Explosives_EP1",
                "US_Patrol_Pack_EP1",
                "US_Patrol_Pack_Ammo_EP1",
                "US_Patrol_Pack_Specops_EP1",
                "US_Backpack_EP1",
                "US_Backpack_AmmoMG_EP1",
                "US_Backpack_AT_EP1",
                "US_Backpack_Specops_EP1",
                "Tripod_Bag",
                "M252_US_Bag_EP1",
                "TOW_TriPod_US_Bag_EP1",
                "MK19_TriPod_US_Bag_EP1",
                "M2HD_mini_TriPod_US_Bag_EP1",
                "M2StaticMG_US_Bag_EP1"
                ];
                if (Var_acre == 1) then {
                    acre_radios = ["ACRE_PRC117F","ACRE_PRC119"];
                    secondaries = secondaries+acre_radios;
                };

                sidearms = [
                "Colt1911",
                "M9",
                "glock17_EP1",
                "UZI_EP1",
                "UZI_SD_EP1",
                "Sa61_EP1"
                ];

                misc = [
                "HandGrenade_West",
				"BAF_L109A1_HE",
                "IR_Strobe_Target",
                "IR_Strobe_Marker",
                "SmokeShell",
                "SmokeShellRed",
                "SmokeShellGreen",
                "SmokeShellBlue",
                "SmokeShellYellow",
                "SmokeShellOrange",
                "SmokeShellPurple",
                "FlareWhite_M203",
                "FlareYellow_M203",
                "FlareGreen_M203",
                "FlareRed_M203",
                "1Rnd_HE_M203",
                "1Rnd_Smoke_M203",
                "1Rnd_SmokeRed_M203",
                "1Rnd_SmokeGreen_M203",
                "1Rnd_SmokeYellow_M203",
                "Laserdesignator",
                "Mine",
                "PipeBomb",
                "Binocular",
                "NVGoggles",
                "Binocular_Vector",
                "ItemCompass",
                "ItemGPS",
                "ItemMap",
                "ItemRadio",
                "ItemWatch"
                ];
                if (Var_acre == 1) then {
                    acre_radios = ["ACRE_PRC148","ACRE_PRC148_UHF","ACRE_PRC343"];
                    misc = misc+acre_radios;
                };
};
