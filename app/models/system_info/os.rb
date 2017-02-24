require 'rbconfig'
require 'sys/filesystem'

module SystemInfo
  class OS
    def self.os_type
      case RbConfig::CONFIG['host_os']
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        'Windows'
      when /darwin|mac os/
        'Mac OS'
      when /linux/
        'Linux'
      else
        RbConfig::CONFIG['host_os']
      end
    end

    def self.os_arch
      RbConfig::CONFIG['arch']
    end

    def self.get_disk_stat(mount_point)
      disk_stat = {}

      disk_stat[:mount_point] = Sys::Filesystem.mount_point(mount_point)

      stat = Sys::Filesystem.stat(disk_stat[:mount_point])
      disk_stat[:total] = (stat.blocks * stat.block_size).to_f / 1024 / 1024 / 1024
      disk_stat[:available] = (stat.blocks_available * stat.block_size).to_f / 1024 / 1024 / 1024

      disk_stat
    end
  end
end
