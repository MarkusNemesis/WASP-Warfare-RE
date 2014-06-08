private ["_PlayerList", "_MSG"];
_MSG = "<t align='center' color='#ffa500'>PlayerList:</t><br /><t align='center'> ------- </t><br />";
{
 _MSG = _MSG + format ["<t align='left'>[%1] %2</t><t align='right' color='#66ff00'> %3 </t><br />",_x select 0, _x select 1, _x select 5];
} forEach Public_PlayerList;
_MSG = parseText _MSG;
hint composeText [_MSG];
