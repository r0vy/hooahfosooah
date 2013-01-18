		if !isNil "actionLoadout998" then { baseflag removeAction actionLoadout998; actionLoadout998 = nil; };
		actionLoadout998 = baseflag addAction ["Request personal loadouts","common\client\actions\noScript.sqf",'

	

		hint "You can now request to have your own set of persoanl loadouts from this box. Simply check totalboffin.blogspot.com to find out how.";


		',1,false,true,"",""]; 
