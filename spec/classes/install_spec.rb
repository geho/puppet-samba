# frozen_string_literal: true

require 'spec_helper'

describe 'samba::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('samba::install::common') }
      it { is_expected.to contain_class('samba::install::utils') }
      it { is_expected.to contain_class('samba::install::plugins') }
    end
  end
end
