module RedmineProfileEmailDomainWhitelist
  module Patches
    module UserPatch
      class << self
        def included(base)
          base.class_eval do
            alias_method_chain :validate, :email_domain_check
          end
        end
      end

      def validate_with_email_domain_check
        if mail.present? && mail_changed? && !admin?
          mail_domain = mail.split("@")[-1]

          p_s = Setting.plugin_redmine_profile_email_domain_whitelist
          whitelisted_domains = p_s['allowed_email_domains']
          unless whitelisted_domains.any? { |d| Unicode.downcase(d) == Unicode.downcase(mail_domain) }
            mail_not_whitelisted_message = p_s['mail_domain_not_whitelisted_message']
            errors.add(:mail, mail_not_whitelisted_message)
          end
        end

        validate_without_email_domain_check
      end
    end
  end
end
