//by Bon_Inf*
// very simple IED script :-P


BON_IED_PATH = "bon_ieds\";



bon_number_ieds = 100;
bon_number_fake_ieds = 125;
bon_number_fake_ieds2 = 25;

bon_ied_container = [
	"Land_Misc_Garb_Heap_EP1","hiluxWreck","datsun01Wreck","Land_Shed_M03_ruins_EP1",
	"datsun02Wreck","SKODAWreck","UAZWreck","BMP2Wreck","Land_Shed_M01_ruins_EP1",
	"BRDMWreck","UralWreck","Land_Misc_Rubble_EP1","Land_Misc_ConcPipeline_EP1",
	"Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v3_PMC","Land_IED_v4_PMC",
	"Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v3_PMC","Land_IED_v4_PMC",
	"Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1",
	"Lada2_TK_CIV_EP1","Lada1_TK_CIV_EP1",
	"TT650_TK_CIV_EP1","Old_moto_TK_Civ_EP1","UAZ_Unarmed_TK_CIV_EP1",
	"V3S_Open_TK_CIV_EP1","Ural_TK_CIV_EP1","Paleta1","Paleta2","Land_Pneu","Misc_TyreHeapEP1","Misc_concrete_High","Barrel1","Barrel4","Barrel5"
];

bon_fake_ied_container = [
	"Land_Misc_Garb_Heap_EP1","hiluxWreck","datsun01Wreck","Land_Shed_M03_ruins_EP1",
	"datsun02Wreck","SKODAWreck","UAZWreck","BMP2Wreck","Land_Shed_M01_ruins_EP1",
	"BRDMWreck","UralWreck","Land_Misc_Rubble_EP1","Land_Misc_ConcPipeline_EP1","Paleta1","Paleta2","Land_Pneu","Misc_TyreHeapEP1","Misc_concrete_High","Barrel1","Barrel4","Barrel5"
];

bon_fake_ied_container2 = [
	"Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1",
	"Lada2_TK_CIV_EP1","Lada1_TK_CIV_EP1",
	"TT650_TK_CIV_EP1","Old_moto_TK_Civ_EP1","UAZ_Unarmed_TK_CIV_EP1",
	"V3S_Open_TK_CIV_EP1","Ural_TK_CIV_EP1"
];

bon_ied_boomlist = ["ARTY_Sh_81_HE","ARTY_Sh_105_HE","ARTY_R_227mm_HE","ARTY_Sh_122_HE","ARTY_Sh_105_WP","ARTY_Sh_122_WP"];


[] execVM (BON_IED_PATH+"ied_creation.sqf");

