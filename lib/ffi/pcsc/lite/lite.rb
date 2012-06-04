require 'ffi/pcsc/lite/types'
require 'ffi/pcsc/lite/scard_reader_state'
require 'ffi/pcsc/lite/scard_io_request'

require 'ffi'

module FFI
  module PCSC
    module Lite
      extend FFI::Library

      ffi_lib ['pcsclite', 'libpcsclite.so.1']

      attach_variable :g_rgSCardT0Pci,  SCardIORequest
      attach_variable :g_rgSCardT1Pci,  SCardIORequest
      attach_variable :g_rgSCardRawPci, SCardIORequest

      attach_function :pcsc_stringify_error, [:long], :string

      #
      # winscard.h
      #
      attach_function :SCardEstablishContext, [:DWORD, :LPCVOID, :LPCVOID, :LPSCARDCONTEXT], :LONG

      attach_function :SCardReleaseContext, [:SCARDCONTEXT], :LONG

      attach_function :SCardIsValidContext, [:SCARDCONTEXT], :LONG

      attach_function :SCardConnect, [:SCARDCONTEXT, :LPCSTR, :DWORD, :DWORD, :LPSCARDHANDLE, :LPDWORD], :LONG

      attach_function :SCardReconnect, [:SCARDHANDLE, :DWORD, :DWORD, :DWORD, :LPDWORD], :LONG

      attach_function :SCardDisconnect, [:SCARDHANDLE, :DWORD], :LONG

      attach_function :SCardBeginTransaction, [:SCARDHANDLE], :LONG

      attach_function :SCardEndTransaction, [:SCARDHANDLE, :DWORD], :LONG

      attach_function :SCardStatus, [:SCARDHANDLE, :LPSTR, :LPDWORD, :LPDWORD, :LPDWORD, :LPBYTE, :LPDWORD], :LONG

      attach_function :SCardGetStatusChange, [:SCARDCONTEXT, :DWORD, :LPSCARD_READERSTATE, :DWORD], :LONG

      attach_function :SCardControl, [:SCARDHANDLE, :DWORD, :LPCVOID, :DWORD, :LPVOID, :DWORD, :LPDWORD], :LONG

      attach_function :SCardTransmit, [:SCARDHANDLE, :pointer, :LPCBYTE, :DWORD, :pointer, :LPBYTE, :LPDWORD], :LONG

      attach_function :SCardListReaderGroups, [:SCARDCONTEXT, :LPSTR, :LPDWORD], :LONG

      attach_function :SCardListReaders, [:SCARDCONTEXT, :LPCSTR, :LPSTR, :LPDWORD], :LONG

      attach_function :SCardFreeMemory, [:SCARDCONTEXT, :LPCVOID], :LONG

      attach_function :SCardCancel, [:SCARDCONTEXT], :LONG

      attach_function :SCardGetAttrib, [:SCARDHANDLE, :DWORD, :LPBYTE, :LPDWORD], :LONG

      attach_function :SCardSetAttrib, [:SCARDHANDLE, :DWORD, :LPCBYTE, :DWORD], :LONG
    end
  end
end
