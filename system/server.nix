{ pkgs, ... }:
let
  domain = "katzenklapse.duckdns.org";
in
{
  # services.seafile = {
  #   enable = true;
  #   initialAdminPassword = "admin";
  #   adminEmail = "admin@example.com";
  #   seafileSettings = {
  #     fileserver = {
  #       port = 8082;
  #       host = "0.0.0.0";
  #     };
  #   };
  # };
  #
  # environment.etc."immich-typsense-api-key".text = "12318551487654187654";
  # services.immich = {
  #   enable = true;
  #   server.typesense.apiKeyFile = "/etc/immich-typsense-api-key";
  # };
  #
  # services.typesense = {
  #   enable = true;
  #   # In a real setup you should generate an api key for immich
  #   # and not use the admin key!
  #   apiKeyFile = "/etc/immich-typsense-api-key";
  #   settings.server.api-address = "127.0.0.1";
  # };
  #
  # services.postgresql = {
  #   enable = true;
  #   identMap = ''
  #     # ArbitraryMapName systemUser DBUser
  #     superuser_map      root      postgres
  #     superuser_map      postgres  postgres
  #     # Let other names login as themselves
  #     superuser_map      /^(.*)$   \1
  #   '';
  #   authentication = pkgs.lib.mkOverride 10 ''
  #     local sameuser all peer map=superuser_map
  #   '';
  #   ensureDatabases = ["immich"];
  #   ensureUsers = [
  #     {
  #       name = "immich";
  #       ensurePermissions = {
  #         "DATABASE immich" = "ALL PRIVILEGES";
  #       };
  #     }
  #   ];
  # };
  # services.vaultwarden = {
  #   enable = true;
  #   environmentFile = "/run/secrets/vaultwarden";
  #   backupDir = "/var/backup/vaultwarden";
  #   config = {
  #     SMTP_PORT = 465;
  #     SMTP_FROM_NAME = "Vaultwarden";
  #     SMTP_SECURITY = "force_tls";
  #     SIGNUPS_ALLOWED = false;
  #     DOMAIN = "https://bitwarden.${domain}";
  #     SHOW_PASSWORD_HINT = false;
  #     ROCKET_ADDRESS = "127.0.0.1";
  #     ROCKET_PORT = 8222;
  #     ROCKET_LOG = "critical";
  #   };
  # };
  # services.paperless = {
  #   enable = true;
  #   dataDir = "/data/paperless/data";
  #   mediaDir = "/data/paperless/media";
  #   consumptionDir = "/data/paperless/consume";
  #   passwordFile = "/run/secrets/paperlessPassword";
  #   address = "0.0.0.0";
  #   settings = {
  #     PAPERLESS_APPS = "allauth.socialaccount.providers.openid_connect";
  #     PAPERLESS_SOCIAL_AUTO_SIGNUP = "True";
  #     PAPERLESS_OCR_LANGUAGE = "deu+eng";
  #     PAPERLESS_ACCOUNT_DEFAULT_HTTP_PROTOCOL = "http";
  #   };
  # };
  # services.samba = {
  #   enable = true;
  #   openFirewall = true;
  #
  #   shares = {
  #     audiobooks = {
  #       path = "/data/audiobooks";
  #       browseable = "yes";
  #       "read only" = "no";
  #       "guest ok" = "no";
  #       "directory mask" = "0755";
  #       "create mask" = "0644";
  #       "force user" = "audiobookshelf";
  #       "force group" = "audiobookshelf";
  #     };
  #   };
  # };
  #   services.audiobookshelf = {
  #   enable = true;
  #   host = "0.0.0.0";
  #   openFirewall = true;
  #   port = 8234;
  # };
}
