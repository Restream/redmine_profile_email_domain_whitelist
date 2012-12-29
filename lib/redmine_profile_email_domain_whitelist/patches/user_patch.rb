require 'unicode'

module RedmineProfileEmailDomainWhitelist
  module Patches
    module UserPatch
      class << self
        def included(base)
          base.class_eval do
            validate :email_domain_check
          end
        end
      end

      def mail_domain
        return '' if mail.empty?
        Unicode.downcase(mail.split("@")[-1])
      end

      def mail_name
        return '' if mail.empty?
        Unicode.downcase(mail.split("@")[0])
      end

      def email_domain_check
        p_s = Setting.plugin_redmine_profile_email_domain_whitelist
        is_enabled = p_s['whitelist_enabled']
        if is_enabled && mail.present? && mail_changed? && !admin?
          whitelisted_domains = p_s['allowed_email_domains']
          unless whitelisted_domains.any? { |d| Unicode.downcase(d) == mail_domain }
            mail_not_whitelisted_message = p_s['mail_domain_not_whitelisted_message']
            errors.add(:mail, mail_not_whitelisted_message)
          end
        end
      end
    end
  end
end
