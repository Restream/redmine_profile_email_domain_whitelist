require_dependency 'account_controller'

module RedmineProfileEmailDomainWhitelist
  module Patches
    module AccountControllerPatch
      class << self
        def included(base)
          base.class_eval do
            with_options only: :register do |c|
              c.before_filter :combine_mail_name_and_mail_domain_into_mail
              c.before_filter :init_whitelisted_domains
              c.before_filter :init_mail_banner_message
            end
          end
        end
      end

      def init_whitelisted_domains
        p_s = Setting.plugin_redmine_profile_email_domain_whitelist
        if p_s['whitelist_enabled']
          @whitelisted_domains = p_s['allowed_email_domains']
        end
        true
      end

      def init_mail_banner_message
        p_s                  = Setting.plugin_redmine_profile_email_domain_whitelist
        @mail_banner_message = p_s['mail_banner_message']
        true
      end

      def combine_mail_name_and_mail_domain_into_mail
        if params['user']
          mail_name   = params['user']['mail_name']
          mail_domain = params['user']['mail_domain']

          if mail_name && mail_domain
            params['user']['mail'] = [mail_name, mail_domain].join('@')
          end
        end
        true
      end
    end
  end
end
