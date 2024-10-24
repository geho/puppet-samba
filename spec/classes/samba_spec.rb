# frozen_string_literal: true

require 'spec_helper'

describe 'samba' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('samba::install') }
      it { is_expected.to contain_class('samba::config') }
      it { is_expected.to contain_class('samba::ad_join') }
    end
  end
end
