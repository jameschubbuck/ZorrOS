{pkgs, ...}: let
  workspace-script = pkgs.writeShellScript "hypr-workspace-op" ''
    key="$1"
    ws_num="$2"
    lock_file="/tmp/hypr_tap_''${key}.lock"
    current_time=$(date +%s%N)

    # 300ms time window for double tap (300000000 nanoseconds)
    time_limit=300000000

    # Guard: Rofi check
    if ${pkgs.hyprland}/bin/hyprctl layers | ${pkgs.gnugrep}/bin/grep -q "rofi"; then
      exit 0
    fi

    if [ -f "$lock_file" ]; then
      # Read the previous timestamp and window address
      read prev_time target_window < "$lock_file"

      # Calculate time difference
      time_diff=$((current_time - prev_time))

      if [ "$time_diff" -lt "$time_limit" ]; then
        # --- DOUBLE TAP DETECTED ---
        # We are already on the new workspace (from the first press).
        # Now we pull the specific window address we saved earlier to here.

        ${pkgs.hyprland}/bin/hyprctl dispatch movetoworkspacesilent "$ws_num,address:$target_window"

        # Cleanup
        rm "$lock_file"
        exit 0
      fi
    fi

    # --- FIRST TAP (or Slow Tap) ---

    # 1. Get the address of the currently focused window BEFORE we switch
    active_window=$(${pkgs.hyprland}/bin/hyprctl activewindow -j | ${pkgs.jq}/bin/jq -r '.address')

    # 2. Save current time and window address to lock file
    echo "$current_time $active_window" > "$lock_file"

    # 3. INSTANTLY switch workspace
    ${pkgs.hyprland}/bin/hyprctl dispatch workspace "$ws_num"

    # 4. Optional: Run your fullscreen check logic here if desired
    # (Note: Logic removed for brevity, but can be pasted back here if needed)
  '';
in {
  home.packages = [pkgs.jq pkgs.coreutils];

  wayland.windowManager.hyprland = {
    settings = {
      bind =
        (
          builtins.concatLists (
            builtins.genList
            (
              i: let
                ws = i + 1;
                ws_key = toString ws;
              in [
                "$mainMod, ${ws_key}, exec, ${workspace-script} ${ws_key} ${ws_key}"
              ]
            )
            9
          )
        )
        ++ [
          "$mainMod, 0, exec, ${workspace-script} 0 10"
        ];
    };
  };
}
