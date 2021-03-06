property :locale_name, String, name_property: true

default_action :update

action :update do
  return if new_resource.locale_name.to_s.empty?

  powershell_script "Update system locale to #{new_resource.locale_name}" do
    code <<-EOH
      Set-WinSystemLocale -SystemLocale "#{new_resource.locale_name}"
    EOH
    action :run
  end
end
