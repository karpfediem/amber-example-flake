#!/nix/store/vpvy79k1qq02p1vyqjk6nb89gwhxqvyb-bash-5.2p32/bin/bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-09-10 12:46:17

len__32_v0() {
    local value=("${!1}")
            if [ 0 != 0 ]; then
            __AMBER_VAL_0=$(echo "${#value}");
            __AS=$?;
            __AF_len32_v0="${__AMBER_VAL_0}";
            return 0
else
            __AMBER_VAL_1=$(echo "${#value[@]}");
            __AS=$?;
            __AF_len32_v0="${__AMBER_VAL_1}";
            return 0
fi
}
exit__80_v0() {
    local code=$1
    exit "${code}";
    __AS=$?
}
args=("$0" "$@")
    len__32_v0 args[@];
    __AF_len32_v0__5_8="$__AF_len32_v0";
    if [ $(echo "$__AF_len32_v0__5_8" '<' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        echo "Please tell me your name"'!'""
        exit__80_v0 1;
        __AF_exit80_v0__7_9="$__AF_exit80_v0";
        echo "$__AF_exit80_v0__7_9" > /dev/null 2>&1
fi
    name="${args[0]}"
    echo "Hello, ${name}"'!'""
