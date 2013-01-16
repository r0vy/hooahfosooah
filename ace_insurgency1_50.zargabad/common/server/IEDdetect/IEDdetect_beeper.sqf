//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
if (isDedicated) exitWith{};

// BEEPER SOUND
while { true } do {
  { if (alive _x) then { _x say3D "IEDdetect_beep3" }; } forEach reezo_IEDdetect_beepers;
  sleep 2;
};

if (true) exitWith {};