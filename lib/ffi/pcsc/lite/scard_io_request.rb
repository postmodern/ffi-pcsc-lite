require 'ffi/pcsc/lite/types'

module FFI
  module PCSC
    module Lite
      class SCardIORequest < FFI::Struct

        layout :dwProtocol, :ulong,
               :cbPciLength, :ulong

      end
    end
  end
end
