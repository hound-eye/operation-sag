//private _situationEntry = compile preprocessFile "myScript.sqf";
//private _missionEntry = compile preprocessFile "myScript.sqf";
player createDiaryRecord ["Diary", ["Command and Signal", "Your team will use short-range radio set to shared frequency. Additionally, you will receive communications from HQ about objectives and reinforcements."]];
player createDiaryRecord ["Diary", ["Administration and Logistics", "TODO"]];
player createDiaryRecord ["Diary", ["Execution", "TODO"]];
player createDiaryRecord ["Diary", ["Mission", "In order to reduce enemy fighting capacity, your team (callsign 'Disciple') will conduct a raid around the village of Vasylivka at 0530."]];
player createDiaryRecord ["Diary", ["Situation", "TODO"]];

0 spawn {
    waitUntil {!isNil "cba_help_DiaryRecordAddons"};

    // delete whole subject
    player removeDiarySubject "cba_help_docs";
};