Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.11750.1625602248344820640
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 13:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB19440C56;
	Tue,  6 Jul 2021 20:10:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndvusc_w7fnd; Tue,  6 Jul 2021 20:10:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B56040B13;
	Tue,  6 Jul 2021 20:10:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4F53D17461F; Tue,  6 Jul 2021 16:10:46 -0400 (EDT)
Date: Tue, 6 Jul 2021 16:10:46 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-toolchain/armcompiler: fix checksums and installation on arm64
Message-ID: <20210706201046.GR1528@denix.org>
References: <20210706154256.3643237-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210706154256.3643237-1-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 06, 2021 at 04:42:55PM +0100, Ross Burton wrote:
> The tarball has been regenerated with new license texts, so the
> checksums are different.
> 
> Also, patch out the host architecture test in the installer: we might
> want to package the armcompiler for a x86 target on a arm64 machine.
> 
> Change-Id: Iedf0113c53b6567e3e4e716e2a0db98776d1da6d
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../armcompiler/no-uname.patch                  | 14 ++++++++++++++
>  .../external-arm-toolchain/armcompiler_6.16.bb  | 17 ++++++++++++-----
>  2 files changed, 26 insertions(+), 5 deletions(-)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler/no-uname.patch
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler/no-uname.patch b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler/no-uname.patch
> new file mode 100644
> index 0000000..7c95807
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler/no-uname.patch
> @@ -0,0 +1,14 @@
> +The install script has an explicit check that the current host is x86-64, which
> +means we can't build armcompiler for x86-64 targets on arm64. Pad the
> +replacement host with whitespace so that the installer offset doesn't change.

I see you have a patch file, but you also do a sed replacement in do_patch(). 
I guess the sed replacement is generic enough to work w/o the patch file?
Alternatively, would this shell line in the patch file work alone as well:

host="x86_64         "

Otherwise you'd lose those whitespaces at the end of the line due to any 
MUA/MTA/Patchwork transitions...


> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +--- a/install_x86_64.sh.orig	2021-07-06 14:11:47.632155370 +0100
> ++++ b/install_x86_64.sh	2021-07-06 14:11:58.393163350 +0100
> +@@ -470,3 +470,3 @@
> + fi
> +-host=`/bin/uname -m`
> ++host=x86_64         
> + echo --- Host target check...[${host}]
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.16.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.16.bb
> index 60656b8..f192c61 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.16.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.16.bb
> @@ -17,24 +17,31 @@ LICENSE = "Armcompiler-License-agreement & Armcompiler-Redistributables & \
>             Armcompiler-Supplementary-terms & Armcompiler-Third-party-licenses"
>  LICENSE_FLAGS = "armcompiler"
>  
> -LIC_FILES_CHKSUM = "file://license_terms/license_agreement.txt;md5=40cd57dbb1f9d111fb6923945849d51c \
> +LIC_FILES_CHKSUM = "file://license_terms/license_agreement.txt;md5=19faf912b534478d28f60dfa24659c17 \
>                      file://license_terms/redistributables.txt;md5=e510e47f7f5be1356ea6218f5b1f6c55 \
>                      file://license_terms/supplementary_terms.txt;md5=17a2efdbd320ceda48a3521747e02dd9 \
> -                    file://license_terms/third_party_licenses.txt;md5=6273fa29eb26c0093e1a7deaef7bafec "
> +                    file://license_terms/third_party_licenses.txt;md5=c351a9bed613cf88d4fccd6f0a5e57af "
>  
>  ARMCLANG_VERSION = "DS500-BN-00026-r5p0-18rel0"
>  
>  COMPATIBLE_HOST = "x86_64.*-linux"
>  
> -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/compiler/${ARMCLANG_VERSION}.tgz;subdir=${ARMCLANG_VERSION}"
> -SRC_URI[md5sum] = "d41d8cd98f00b204e9800998ecf8427e"
> -SRC_URI[sha256sum] = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
> +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/compiler/${ARMCLANG_VERSION}.tgz;subdir=${ARMCLANG_VERSION} \
> +           file://no-uname.patch"
> +SRC_URI[sha256sum] = "d9fb99e7550366f884c31f74953066da64301fb30601cb55278d738459c22557"
>  
>  UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/embedded/arm-compiler/downloads/"
>  UPSTREAM_CHECK_REGEX = "Download Arm Compiler.*,(?P<pver>[\d\.]+)"
>  
>  S = "${WORKDIR}/${ARMCLANG_VERSION}"
>  
> +do_patch() {
> +    # The script has an explicit check that the current host is x86-64, which means we can't
> +    # build armcompiler for x86-64 targets on arm64. Pad the replacement host with whitespace
> +    # so that the installer offset doesn't change.
> +    sed -ie 's/^host=.*/host=x86_64         /' ${S}/install_x86_64.sh
> +}
> +
>  do_install() {
>      install -d ${D}${datadir}/armclang/
>      # Commercial license flag set, so recipe will only install when explicitly agreed to it already
> -- 
> 2.25.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
