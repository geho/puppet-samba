# frozen_string_literal: true

require 'spec_helper'

describe 'samba::server::share' do
  let(:title) { 'namevar' }
  let(:params) do
    {}
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include samba::config' }
      let(:params) { { 'path' => '/srv' } }

      it { is_expected.to compile }
    end
  end
end
