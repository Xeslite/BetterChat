local Frame = CreateFrame("Frame");
local FindEmoji = ":%a+:";
local GrabEmoji = nil;
local EventList = {"CHAT_MSG_SYSTEM", "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER", "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER", "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER", "CHAT_MSG_SAY", "CHAT_MSG_EMOTE", "CHAT_MSG_YELL", "CHAT_MSG_WHISPER", "CHAT_MSG_WHISPER_INFORM", "CHAT_MSG_CHANNEL"};

Sheet = {};

initilize = function(self, event, msg, ...)
	if string.find(msg, FindEmoji) then
		GrabEmoji = string.match(msg, FindEmoji);
		GrabEmoji = GrabEmoji:lower();
		msg = string.gsub(msg, FindEmoji, "InsertSmiley");--Sheet[GrabEmoji]);
		return false, msg, ...
	elseif string.find(msg, "@") and (event == "CHAT_MSG_GUILD" or event == "CHAT_MSG_OFFICER") and string.find(msg, "@"..UnitName("player")) then
		msg = string.gsub(msg, msg, "\124cffe5ff00"..msg.."\124r")
		return false, msg, ...
	end
end

do
	local first = true;
	local k,v = nil, nil;

	for x=1,#EventList do
		if first then
			k,v = next(EventList);
			first = false;
			
			ChatFrame_AddMessageEventFilter(v, initilize);
		else
				k,v = next(EventList, k);
				ChatFrame_AddMessageEventFilter(v, initilize);
		end
	end
end










































