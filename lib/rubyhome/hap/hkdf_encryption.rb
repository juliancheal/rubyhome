require 'rbnacl/libsodium'

module Rubyhome
  module HAP
    class HKDFEncryption
      def initialize(salt:, info: )
        @salt = salt
        @info = info
      end

      def encrypt(source)
        HKDF.new(source, hkdf_opts).next_bytes(BYTE_LENGTH)
      end

      private

      BYTE_LENGTH = 32

      attr_reader :info, :salt, :source

      def hkdf_opts
        {
          algorithm: algorithm,
          info: info,
          salt: salt
        }
      end

      def algorithm
        'SHA512'
      end
    end
  end
end
