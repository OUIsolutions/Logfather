local action =argv.get_next_unused()
if not action then
    print("Action is required")
    return
end
local profiles = get_prop("profiles") or {}

function get_profile (profile_name)
    for i=1,#profiles do
        if profiles[i].name == profile_name then
            return profiles[i]
        end
    end
    return nil
end
function get_or_create_profile(profile_name)
    local profile = get_profile(profile_name)
    if profile then
        return profile
    end
    local new_profile = { name = profile_name, sources = {} }
    profiles[#profiles+1] = new_profile
    return new_profile
end

if action == "set_profile" or action == "set" then 
    local profile =  argv.get_flag_arg_by_index({ "profile","p" },1)
     if not profile then
        print("Profile name is required")
        return
     end
    local token = argv.get_flag_arg_by_index({ "token","t" },1)
    if not token then
        print("Token is required")
        return
    end
    local chat_id = argv.get_flag_arg_by_index({ "chat_id","c" },1)
    if not chat_id then
        print("Chat ID is required")
        return
    end
    local profile_obj = get_or_create_profile(profile)
    profile_obj.token = token
    profile_obj.chat_id = chat_id
    set_prop("profiles",profiles)
else if action == "send" or action == "send_message" then 
    local profile =  argv.get_flag_arg_by_index({ "profile","p" },1)
     if not profile then
        print("Profile name is required")
        return
     end
    local message = argv.get_flag_arg_by_index({ "message","m" },1)
    if not message then
        local message_file = argv.get_flag_arg_by_index({ "message_file","mf" },1)
        if not message_file then
            print("Message or message_file is required")
            return
        end
        message = dtw.load_file(message_file)
        if not message then
            print("Failed to load message from file: "..message_file)
            return
        end     
    end
    local session = luaberrante.newTelegramSession({
            token = profile_obj.token,
            id_chat = profile_obj.chat_id
    }, luabear.fetch)
    session.sendMessage({ text = message })
else 
    print("Unknown action: "..tostring(action))
end
end