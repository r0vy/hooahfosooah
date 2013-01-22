		if !isNil "actionLoadout998" then { baseflag removeAction actionLoadout998; actionLoadout998 = nil; };
		actionLoadout998 = baseflag addAction ["Request personal loadouts","common\client\actions\noScript.sqf",'

	

		hint "Logon to the forums at www.twistedarmy.com/ and register for custom loadouts.";


		',1,false,true,"",""]; 
