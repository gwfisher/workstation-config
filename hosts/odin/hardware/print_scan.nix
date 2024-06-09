{ config, pkgs, ...}:

{
    services.printing.enable = true;

    hardware.sane.enable = true;
    hardware.sane.extraBackends = [ pkgs.sane-airscan ];
}