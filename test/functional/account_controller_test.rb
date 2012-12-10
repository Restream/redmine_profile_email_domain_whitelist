class AccountControllerTest < ActionController::TestCase
  fixtures :users, :roles

  def setup
    @settings_stub = {
      'whitelist_enabled' => true,
      'allowed_email_domains' => ['gooDDomain.com'],
      'mail_domain_not_whitelisted_message' => "denied. Your E-Mail domain isn't allowed by redmine admin"
    }

    Setting.stubs(:plugin_redmine_profile_email_domain_whitelist) \
      .returns(@settings_stub)
  end

  def test_should_render_register
    get :resiter
    assert_response :success
  end

  def test_should_render_register_with_disabled_whitelist
    @settings_stub['whitelist_enabled'] = false
    get :register
    assert_response :success
  end
end
