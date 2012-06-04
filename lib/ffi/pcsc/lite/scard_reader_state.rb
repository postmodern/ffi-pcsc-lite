require 'ffi/pcsc/lite/types'

require 'ffi'

module FFI
  module PCSC
    module Lite
      class SCardReaderState < FFI::Struct

        layout :szReader, :string,
               :pvUserData, :pointer,
               :dwCurrentState, :DWORD,
               :dwEventState, :DWORD,
               :dbAtr, :DWORD,
               :rgbAtr, [:uchar, MAX_ATR_SIZE]

      end
    end
  end
end
