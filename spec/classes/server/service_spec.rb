# frozen_string_literal: true

require 'spec_helper'

describe 'samba::server::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:pre_condition) { 'include samba::server' }
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
