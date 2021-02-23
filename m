Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1905.1614110696501936327
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Feb 2021 12:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C9A4440BE6;
	Tue, 23 Feb 2021 20:04:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0PYjBfqTd8m; Tue, 23 Feb 2021 20:04:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B33640BA7;
	Tue, 23 Feb 2021 20:04:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 110CE174522; Tue, 23 Feb 2021 15:04:54 -0500 (EST)
Date: Tue, 23 Feb 2021 15:04:54 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ravindra.Ankam@Honeywell.com
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] Error while building the custom image
Message-ID: <20210223200454.GA4892@denix.org>
References: <SN1PR07MB39493750FC8337D03E5E87DE81809@SN1PR07MB3949.namprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SN1PR07MB39493750FC8337D03E5E87DE81809@SN1PR07MB3949.namprd07.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

You seem to have a very strange combination of layers and mix of branches!

For example, is this a Poky distro or Arago? Why do you include meta-poky if 
DISTRO = "arago"?
Why do you have some layers on "gatesgarth" and some on unstable "master"?
And finally, Arago distro currently does not fully support master or 
gatesgarth with the external Arm toolchain, only dunfell.

-- 
Denys


On Tue, Feb 23, 2021 at 02:47:48PM +0000, Ankam, Ravindra via lists.yoctoproject.org wrote:
> Hi,
>                 Please attached the error logs.
> Can you please help how to address this issue?
> 
> Thanks and regards,
> Ravi


> poky/build$ MACHINE=am335x-evm bitbake custom-base-image
> Loading cache: 100% |####################################################################################################################################| Time: 0:00:00
> Loaded 4805 entries from dependency cache.
> WARNING: No recipes in default available for:
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/recipes-graphics/wayland/weston_8.0.0.bbappend
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION           = "1.48.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "ubuntu-16.04"
> TARGET_SYS           = "arm-linux-gnueabi"
> MACHINE              = "am335x-evm"
> DISTRO               = "arago"
> DISTRO_VERSION       = "2020.09"
> TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-yocto-bsp
> meta-custom          = "my-yocto-3.2.1:943ef2fad8428f002850e3655a3312e13d0dcb2c"
> meta-arm
> meta-arm-toolchain   = "gatesgarth:7185d29de9f54d2cb5b2da35b0c3f1e5f381db2c"
> meta-clang           = "master:16f757de2d90594476d2c8feefd3a850c3c24931"
> meta-ti              = "master:fb4726a88cbb5a6311bdb3095b81d314e344a322"
> meta-arago-distro
> meta-arago-extras    = "master:f90d1bed7e775ac59bf1fcd95e95e9109d0953db"
> meta-qt5             = "master:23f7a1c8eabaf1beb80cc6214954c0e1751c4cbd"
> meta-virtualization  = "master-next:3389eb0f128b1ef1d1aaf518afdf298a88f89619"
> meta-networking
> meta-python
> meta-perl
> meta-oe
> meta-gnome
> meta-multimedia
> meta-filesystems     = "gatesgarth:cef93b7b00e620d90a610112ee574fa60b691cf8"
> meta-tpm
> meta-security
> meta-security-compliance = "master:16ee7308c9fd48d69b02c5519d2e5edddc560658"
> meta-selinux         = "gatesgarth:36db146d56535318d343dc9138358885356f2172"
> meta-linaro
> meta-optee           = "master:11091b487e1ad4c6a4adfac34d958a3d9d9ccd17"
> 
> Initialising tasks: 100% |###############################################################################################################################| Time: 0:00:02
> Sstate summary: Wanted 1003 Found 0 Missed 1003 Current 22 (0% match, 2% complete)
> NOTE: Executing Tasks
> ERROR: external-arm-toolchain-2019.12-r0 do_install: '_sre.SRE_Match' object is not subscriptable
> ERROR: Logfile of failure stored in: /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/temp/log.do_install.22351
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/rsync/rsync_3.2.3.bb:do_populate_sysroot', 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_populate_sysroot', 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['patch-native', 'rsync-native', 'xz-native', 'bison-native', 'pkgconfig-native', 'quilt-native', 'pseudo-native', 'texinfo-dummy-native', 'libtool-native', 'gnu-config-native', 'gettext-minimal-native', 'automake-native', 'flex-native', 'autoconf-native', 'attr-native', 'acl-native', 'popt-native', 'm4-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libanl.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libanl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libBrokenLocale.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libBrokenLocale-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libc.so.6 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libc-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libcrypt.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libcrypt-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libdl.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libdl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libm.so.6 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libm-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnsl.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnsl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_compat.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_compat-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_db.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_db-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_dns.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_dns-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_files.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_files-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_hesiod.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_hesiod-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libpthread.so.0 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libpthread-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libresolv.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libresolv-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/librt.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/librt-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libutil.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libutil-2.30.so, keep it
> | rmdir: failed to remove '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/usr/bin': Directory not empty
> | rmdir: failed to remove '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/usr/sbin': Directory not empty
> | rmdir: failed to remove '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/sbin': Directory not empty
> | NOTE: make -j 3 HOSTCC=gcc  HOSTCPP=gcc  -E headers_install INSTALL_HDR_PATH=/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/external-arm-toolchain-2019.12/usr
> |   INSTALL /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/external-arm-toolchain-2019.12/usr/include
> | mv: cannot stat '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnueabihf': No such file or directory
> | WARNING: /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/temp/run.do_install.22351:415 exit 1 from 'mv /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnueabihf /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-linux-gnueabi'
> | WARNING: Backtrace (BB generated script):
> |       #1: do_install, /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/temp/run.do_install.22351, line 415
> |       #2: main, /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/temp/run.do_install.22351, line 415
> | ERROR: '_sre.SRE_Match' object is not subscriptable
> ERROR: Task (/home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 242 tasks of which 239 didn't need to be rerun and 1 failed.
> 
> Summary: 1 task failed:
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_install
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.

> 
> 
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
