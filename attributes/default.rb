default['ntp']['servers'] = ['ntp.nict.jp', 'ntp2.jst.mfeed.ad.jp']
default['ntp']['conf'] = '/etc/ntp.conf'

default['ntp']['yum']['service_name'] = 'ntpd'
default['ntp']['yum']['autorun_cmd'] = "chkconfig #{node['ntp']['yum']['service_name']} on"

default['ntp']['apt']['service_name'] = 'ntp'
default['ntp']['apt']['autorun_cmd'] = "sysv-rc-conf #{node['ntp']['apt']['service_name']} on"
