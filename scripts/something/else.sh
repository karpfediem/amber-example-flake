#!/nix/store/izpf49b74i15pcr9708s3xdwyqs4jxwl-bash-5.2p32/bin/bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-09-23 20:23:36
len__14_v0() {
    local value=("${!1}")
            if [ 0 != 0 ]; then
            __AMBER_VAL_0=$(echo "${#value}");
            __AS=$?;
            __AF_len14_v0="${__AMBER_VAL_0}";
            return 0
else
            __AMBER_VAL_1=$(echo "${#value[@]}");
            __AS=$?;
            __AF_len14_v0="${__AMBER_VAL_1}";
            return 0
fi
}
args=("$0" "$@")
    len__14_v0 args[@];
    __AF_len14_v0__4_8="$__AF_len14_v0";
    if [ $(echo "$__AF_len14_v0__4_8" '<' 2 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        echo "Please tell me your name"'!'""
        exit 1
fi
    name="${args[1]}"
    echo "Hello, ${name}"'!'""
