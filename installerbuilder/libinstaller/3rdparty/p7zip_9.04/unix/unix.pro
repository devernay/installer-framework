pk7zip_library {
  TEMPLATE = lib
  CONFIG += static staticlib
  DESTDIR=../lib
  SOURCES += ../lib7z_facade.cpp
} else {
  TEMPLATE = app
}

TARGET = 7za

QT -= gui
CONFIG += console

DEFINES += FILE_OFFSET_BITS=64 _LARGEFILE_SOURCE NDEBUG _REENTRANT COMPRESS_BZIP2_MT COMPRESS_MT COMPRESS_MF_MT BREAK_HANDLER BENCH_MT

unix:DEFINES += ENV_UNIX
win32:DEFINES += _UNICODE _CRT_SECURE_NO_WARNINGS

INCLUDEPATH += .. CPP CPP/myWindows 
unix:INCLUDEPATH += CPP/include_windows

unix:SOURCES += CPP/myWindows/myGetTickCount.cpp \
                CPP/myWindows/wine_date_and_time.cpp \
                CPP/myWindows/myAddExeFlag.cpp \ 
                CPP/myWindows/mySplitCommandLine.cpp \
 
 win32:SOURCES += C/Alloc.c

 
SOURCES += \
 CPP/7zip/UI/Console/ConsoleClose.cpp \
 CPP/7zip/UI/Console/ExtractCallbackConsole.cpp \
 CPP/7zip/UI/Console/List.cpp \
 CPP/7zip/UI/Console/Main.cpp \
 CPP/7zip/UI/Console/MainAr.cpp \
 CPP/7zip/UI/Console/OpenCallbackConsole.cpp \
 CPP/7zip/UI/Console/PercentPrinter.cpp \
 CPP/7zip/UI/Console/UpdateCallbackConsole.cpp \
 CPP/7zip/UI/Console/UserInputUtils.cpp \
 CPP/Common/CommandLineParser.cpp \
 CPP/Common/CRC.cpp \
 CPP/Common/IntToString.cpp \
 CPP/Common/ListFileUtils.cpp \
 CPP/Common/StdInStream.cpp \
 CPP/Common/StdOutStream.cpp \
 CPP/Common/MyString.cpp \
 CPP/Common/StringToInt.cpp \
 CPP/Common/UTFConvert.cpp \
 CPP/Common/StringConvert.cpp \
 CPP/Common/MyWindows.cpp \
 CPP/Common/MyVector.cpp \
 CPP/Common/Wildcard.cpp \
 CPP/Windows/Error.cpp \
 CPP/Windows/FileDir.cpp \
 CPP/Windows/FileFind.cpp \
 CPP/Windows/FileIO.cpp \
 CPP/Windows/FileName.cpp \
 CPP/Windows/PropVariant.cpp \
 CPP/Windows/PropVariantConversions.cpp \
 CPP/Windows/Synchronization.cpp \
 CPP/Windows/System.cpp \
 CPP/Windows/Time.cpp \
 CPP/7zip/Common/CreateCoder.cpp \
 CPP/7zip/Common/CWrappers.cpp \
 CPP/7zip/Common/FilePathAutoRename.cpp \
 CPP/7zip/Common/FileStreams.cpp \
 CPP/7zip/Common/FilterCoder.cpp \
 CPP/7zip/Common/InBuffer.cpp \
 CPP/7zip/Common/InOutTempBuffer.cpp \
 CPP/7zip/Common/LimitedStreams.cpp \
 CPP/7zip/Common/LockedStream.cpp \
 CPP/7zip/Common/MemBlocks.cpp \
 CPP/7zip/Common/MethodId.cpp \
 CPP/7zip/Common/MethodProps.cpp \
 CPP/7zip/Common/OffsetStream.cpp \
 CPP/7zip/Common/OutBuffer.cpp \
 CPP/7zip/Common/OutMemStream.cpp \
 CPP/7zip/Common/ProgressMt.cpp \
 CPP/7zip/Common/ProgressUtils.cpp \
 CPP/7zip/Common/StreamBinder.cpp \
 CPP/7zip/Common/StreamObjects.cpp \
 CPP/7zip/Common/StreamUtils.cpp \
 CPP/7zip/Common/VirtThread.cpp \
 CPP/7zip/UI/Common/ArchiveCommandLine.cpp \
 CPP/7zip/UI/Common/ArchiveExtractCallback.cpp \
 CPP/7zip/UI/Common/ArchiveOpenCallback.cpp \
 CPP/7zip/UI/Common/DefaultName.cpp \
 CPP/7zip/UI/Common/EnumDirItems.cpp \
 CPP/7zip/UI/Common/Extract.cpp \
 CPP/7zip/UI/Common/ExtractingFilePath.cpp \
 CPP/7zip/UI/Common/LoadCodecs.cpp \
 CPP/7zip/UI/Common/OpenArchive.cpp \
 CPP/7zip/UI/Common/PropIDUtils.cpp \
 CPP/7zip/UI/Common/SetProperties.cpp \
 CPP/7zip/UI/Common/SortUtils.cpp \
 CPP/7zip/UI/Common/TempFiles.cpp \
 CPP/7zip/UI/Common/Update.cpp \
 CPP/7zip/UI/Common/UpdateAction.cpp \
 CPP/7zip/UI/Common/UpdateCallback.cpp \
 CPP/7zip/UI/Common/UpdatePair.cpp \
 CPP/7zip/UI/Common/UpdateProduce.cpp \
 CPP/7zip/Archive/Bz2Handler.cpp \
 CPP/7zip/Archive/GzHandler.cpp \
 CPP/7zip/Archive/LzmaHandler.cpp \
 CPP/7zip/Archive/SplitHandler.cpp \
 CPP/7zip/Archive/XzHandler.cpp \
 CPP/7zip/Archive/ZHandler.cpp \
 CPP/7zip/Archive/Common/CoderMixer2.cpp \
 CPP/7zip/Archive/Common/CoderMixer2MT.cpp \
 CPP/7zip/Archive/Common/CrossThreadProgress.cpp \
 CPP/7zip/Archive/Common/DummyOutStream.cpp \
 CPP/7zip/Archive/Common/FindSignature.cpp \
 CPP/7zip/Archive/Common/HandlerOut.cpp \
 CPP/7zip/Archive/Common/InStreamWithCRC.cpp \
 CPP/7zip/Archive/Common/ItemNameUtils.cpp \
 CPP/7zip/Archive/Common/MultiStream.cpp \
 CPP/7zip/Archive/Common/OutStreamWithCRC.cpp \
 CPP/7zip/Archive/Common/ParseProperties.cpp \
 CPP/7zip/Archive/7z/7zCompressionMode.cpp \
 CPP/7zip/Archive/7z/7zDecode.cpp \
 CPP/7zip/Archive/7z/7zEncode.cpp \
 CPP/7zip/Archive/7z/7zExtract.cpp \
 CPP/7zip/Archive/7z/7zFolderInStream.cpp \
 CPP/7zip/Archive/7z/7zFolderOutStream.cpp \
 CPP/7zip/Archive/7z/7zHandler.cpp \
 CPP/7zip/Archive/7z/7zHandlerOut.cpp \
 CPP/7zip/Archive/7z/7zHeader.cpp \
 CPP/7zip/Archive/7z/7zIn.cpp \
 CPP/7zip/Archive/7z/7zOut.cpp \
 CPP/7zip/Archive/7z/7zProperties.cpp \
 CPP/7zip/Archive/7z/7zSpecStream.cpp \
 CPP/7zip/Archive/7z/7zUpdate.cpp \
 CPP/7zip/Archive/Cab/CabBlockInStream.cpp \
 CPP/7zip/Archive/Cab/CabHandler.cpp \
 CPP/7zip/Archive/Cab/CabHeader.cpp \
 CPP/7zip/Archive/Cab/CabIn.cpp \
 CPP/7zip/Archive/Tar/TarHandler.cpp \
 CPP/7zip/Archive/Tar/TarHandlerOut.cpp \
 CPP/7zip/Archive/Tar/TarHeader.cpp \
 CPP/7zip/Archive/Tar/TarIn.cpp \
 CPP/7zip/Archive/Tar/TarOut.cpp \
 CPP/7zip/Archive/Tar/TarUpdate.cpp \
 CPP/7zip/Archive/Zip/ZipAddCommon.cpp \
 CPP/7zip/Archive/Zip/ZipHandler.cpp \
 CPP/7zip/Archive/Zip/ZipHandlerOut.cpp \
 CPP/7zip/Archive/Zip/ZipHeader.cpp \
 CPP/7zip/Archive/Zip/ZipIn.cpp \
 CPP/7zip/Archive/Zip/ZipItem.cpp \
 CPP/7zip/Archive/Zip/ZipOut.cpp \
 CPP/7zip/Archive/Zip/ZipUpdate.cpp \
 CPP/7zip/Compress/Bcj2Coder.cpp \
 CPP/7zip/Compress/BitlDecoder.cpp \
 CPP/7zip/Compress/BranchCoder.cpp \
 CPP/7zip/Compress/BranchMisc.cpp \
 CPP/7zip/Compress/ByteSwap.cpp \
 CPP/7zip/Compress/BZip2Crc.cpp \
 CPP/7zip/Compress/BZip2Decoder.cpp \
 CPP/7zip/Compress/BZip2Encoder.cpp \
 CPP/7zip/Compress/CopyCoder.cpp \
 CPP/7zip/Compress/DeflateDecoder.cpp \
 CPP/7zip/Compress/DeflateEncoder.cpp \
 CPP/7zip/Compress/DeltaFilter.cpp \
 CPP/7zip/Compress/ImplodeDecoder.cpp \
 CPP/7zip/Compress/ImplodeHuffmanDecoder.cpp \
 CPP/7zip/Compress/Lzma2Decoder.cpp \
 CPP/7zip/Compress/Lzma2Encoder.cpp \
 CPP/7zip/Compress/LzmaDecoder.cpp \
 CPP/7zip/Compress/LzmaEncoder.cpp \
 CPP/7zip/Compress/LzOutWindow.cpp \
 CPP/7zip/Compress/Lzx86Converter.cpp \
 CPP/7zip/Compress/LzxDecoder.cpp \
 CPP/7zip/Compress/PpmdDecoder.cpp \
 CPP/7zip/Compress/PpmdEncoder.cpp \
 CPP/7zip/Compress/QuantumDecoder.cpp \
 CPP/7zip/Compress/ShrinkDecoder.cpp \
 CPP/7zip/Compress/ZDecoder.cpp \
 CPP/7zip/Compress/LZMA_Alone/LzmaBench.cpp \
 CPP/7zip/Compress/LZMA_Alone/LzmaBenchCon.cpp \
 CPP/7zip/Crypto/7zAes.cpp \
 CPP/7zip/Crypto/HmacSha1.cpp \
 CPP/7zip/Crypto/MyAes.cpp \
 CPP/7zip/Crypto/Pbkdf2HmacSha1.cpp \
 CPP/7zip/Crypto/RandGen.cpp \
 CPP/7zip/Crypto/Sha1.cpp \
 CPP/7zip/Crypto/WzAes.cpp \
 CPP/7zip/Crypto/ZipCrypto.cpp \
 CPP/7zip/Crypto/ZipStrong.cpp \
 C/7zStream.c \
 C/Aes.c \
 C/Bra.c \
 C/Bra86.c \
 C/BraIA64.c \
 C/BwtSort.c \
 C/Delta.c \
 C/HuffEnc.c \
 C/LzFind.c \
 C/LzFindMt.c \
 C/Lzma2Dec.c \
 C/Lzma2Enc.c \
 C/LzmaDec.c \
 C/LzmaEnc.c \
 C/MtCoder.c \
 C/Sha256.c \
 C/Sort.c \
 C/Threads.c \
 C/Xz.c \
 C/XzCrc64.c \
 C/XzDec.c \
 C/XzEnc.c \
 C/XzIn.c \
 C/7zCrc.c \

!pk7zip_library {
SOURCES += CPP/7zip/Archive/7z/7zRegister.cpp \
 CPP/7zip/Archive/Cab/CabRegister.cpp \
 CPP/7zip/Archive/Tar/TarRegister.cpp \
 CPP/7zip/Archive/Zip/ZipRegister.cpp \
 CPP/7zip/Compress/Bcj2Register.cpp \
 #CPP/7zip/Compress/BcjRegister.cpp \
 CPP/7zip/Compress/BranchRegister.cpp \
 CPP/7zip/Compress/BZip2Register.cpp \
 CPP/7zip/Compress/CopyRegister.cpp \
 CPP/7zip/Compress/Deflate64Register.cpp \
 CPP/7zip/Compress/DeflateRegister.cpp \
 CPP/7zip/Compress/Lzma2Register.cpp \
 CPP/7zip/Compress/LzmaRegister.cpp \
 CPP/7zip/Compress/PpmdRegister.cpp \
 CPP/7zip/Crypto/7zAesRegister.cpp
 
 win32:LIBS += ole32.lib oleaut32.lib user32.lib
}
