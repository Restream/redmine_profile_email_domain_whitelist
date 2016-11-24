require 'redmine'

Redmine::Plugin.register :redmine_profile_email_domain_whitelist do
  name 'Redmine profile email domain whitelist'
  author 'Restream, nettsundere'
  description 'This plugin enables configuring the email domain whitelist for Redmine.'
  version '1.10.0'

  default_settings = {
    'allowed_email_domains'               => [],
    'whitelist_enabled'                   => false,
    'mail_banner_message'                 => '',
    'mail_domain_not_whitelisted_message' => "denied. Your email domain isn't allowed by Redmine administrator."
  }

  settings(
    default: default_settings,
    partial: 'settings/redmine_profile_email_domain_whitelist')
end

require 'redmine_profile_email_domain_whitelist'
