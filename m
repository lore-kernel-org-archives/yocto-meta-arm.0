Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web09.12226.1608042029917407022
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 06:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=H60bBufH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id 186so19136583qkj.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2mbpAJplyOkUR0FqeN++rnArdSFJs+c0Wi+axaHhFoQ=;
        b=H60bBufH/R2ff61ALQ/n01QvmvtOonRhoX24zWR/D5sj0/uNGWGXzm7AEUoQyzHyN4
         tcEt/dncIfKn2R4Butrbgj0w/3QFkI4AJUuBnqxmxpdefS3NhCW25iVR5CV6sRs2csb4
         Wi4UeweteAVQWSaMqpa+YaySNObnNxV8t+kAcAMkfy36egTo6sjniaVwr2+ZLwcXgwdQ
         rk6Y52UcqaJQ/dtbxbm8aqiRad8/v0OVmVpXFHzv1qGZycn+WPNdd+HmkOYxS9FOp2IW
         GDEpdw6OSA25wMcdQgT/CVhmMHLy4ACH6aUr8o9OmFN3Zb7eJWAP12OZcXe8R25WhjXd
         kCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2mbpAJplyOkUR0FqeN++rnArdSFJs+c0Wi+axaHhFoQ=;
        b=uZgikd+EQIfmO8mpVi91JN7mEE8hnTbLcPj7RoQWu2Lguq+6bdqYLkc2FAVWulp5V/
         EuxJNtmQmyCpG/MRNVpI8kdrsTxxfFr8b7c50fI0xCKuM7eZ/IaI529kqjSOR2t+hKVK
         h7xDP3H/WNtxIaLlaYra96PmxmnWDJcbR4+WJQM/8k0W2z28qOBOFgoo8WYZM0mHl7lW
         07pNWBJt7sKt/w0WN+OnpSywNWBZJTv/X3F8xVgqXacsLl7rpCDfDylN/x1YhdRyS7rx
         PjmMrfxSAl+El0/iDlHySysX3r7Srj5NAqQF5aJEHe8DReAc79tL8/wvQb0x1N6k/R/2
         IxNA==
X-Gm-Message-State: AOAM530epPIC9j/LVuQaZkwFEyBdw9j6qkmzLR++1iUaGItijvkeYWtE
	iaLAaj00W9ixUnyvXtdKfxUypLaRpRx4VA==
X-Google-Smtp-Source: ABdhPJzgjCobIQveEwn6AMYKu6vCow0gt9x0bLfz5SKL5S/6Qmi98zm6lVRZbZBKRDzo8knDEsqSUw==
X-Received: by 2002:a37:a50c:: with SMTP id o12mr20892778qke.98.1608042028975;
        Tue, 15 Dec 2020 06:20:28 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:4438:99f1:e83e:f284])
        by smtp.gmail.com with ESMTPSA id u26sm17377209qke.57.2020.12.15.06.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:20:28 -0800 (PST)
Date: Tue, 15 Dec 2020 09:20:26 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/4] arm: new recipes for EDK2
Message-ID: <20201215142026.GA20024@kudzu.us>
References: <20201214232442.4371-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201214232442.4371-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 14, 2020 at 06:24:39PM -0500, Jon Mason wrote:
> Rework the EDK2 recipes to allow for multiple versions, and create a
> recipe for the latest version.  This will allow for BSPs using the older
> version to continue to function while waiting to be upgraded.  Also,
> rework the n1sdp recipe to use the 201911 recipe, but overwrite
> everything with its unique git trees.
> 
> Change-Id: I96869191bcf896ea17304d2ccf93da58605c72a1
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Series applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf                     | 1 +
>  meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc    | 9 +--------
>  .../recipes-bsp/uefi/edk2-firmware_201911.bbappend       | 8 ++++++++
>  .../recipes-bsp/uefi/edk2-firmware_202008.bbappend       | 7 +++++++
>  ...rmware_git.bbappend => edk2-firmware_202011.bbappend} | 4 ----
>  .../recipes-bsp/uefi/files/{ => n1sdp}/initialise.patch  | 0
>  .../uefi/{edk2-firmware_git.bb => edk2-firmware.inc}     | 3 ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb        | 5 +++++
>  meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb        | 4 ++++
>  meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb        | 4 ++++
>  10 files changed, 30 insertions(+), 15 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
>  create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend
>  rename meta-arm-bsp/recipes-bsp/uefi/{edk2-firmware_git.bbappend => edk2-firmware_202011.bbappend} (52%)
>  rename meta-arm-bsp/recipes-bsp/uefi/files/{ => n1sdp}/initialise.patch (100%)
>  rename meta-arm/recipes-bsp/uefi/{edk2-firmware_git.bb => edk2-firmware.inc} (94%)
>  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb
>  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb
>  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index acb0f5c..67363ac 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -33,6 +33,7 @@ PREFERRED_VERSION_scp-firmware ?= "2.7%"
>  
>  #UEFI EDK2 firmware
>  EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
> +PREFERRED_VERSION_edk2-firmware ?= "201911%"
>  
>  #grub-efi
>  EFI_PROVIDER ?= "grub-efi"
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> index 3c57bd0..07a41b0 100644
> --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> @@ -1,12 +1,7 @@
> -EDK2_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2.git"
> -EDK2_PLATFORMS_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>  
>  SRC_URI += "file://initialise.patch"
>  
> -# TAGS and commit ID as per N1SDP-2020.03.26 release
> -SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
> -SRCREV_edk2-platforms = "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
> -
>  # N1SDP specific EDK2 configurations
>  EDK2_BUILD_RELEASE = "0"
>  EDK2_PLATFORM      = "n1sdp"
> @@ -16,8 +11,6 @@ EDK2_ARCH          = "AARCH64"
>  
>  COMPATIBLE_MACHINE = "n1sdp"
>  
> -PV = "201908+git${SRCPV}"
> -
>  # UEFI EDK2 on N1SDP is unable to detect FS2 during boot resulting in launching of
>  # EDK2 shell instead of launching grub. The startup.nsh will force launching of grub
>  EFIDIR             = "/EFI/BOOT"
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
> new file mode 100644
> index 0000000..cc25ee0
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
> @@ -0,0 +1,8 @@
> +EDK2_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2.git"
> +EDK2_PLATFORMS_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git"
> +
> +# TAGS and commit ID as per N1SDP-2020.03.26 release
> +SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
> +SRCREV_edk2-platforms = "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
> +
> +require edk2-firmware-n1sdp.inc
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend
> new file mode 100644
> index 0000000..fb4abed
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend
> @@ -0,0 +1,7 @@
> +# Include machine specific configurations for UEFI EDK2
> +
> +MACHINE_EDK2_REQUIRE ?= ""
> +
> +MACHINE_EDK2_REQUIRE_sgi575 = "edk2-firmware-sgi575.inc"
> +
> +require ${MACHINE_EDK2_REQUIRE}
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
> similarity index 52%
> rename from meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
> index 8cfd6c5..8a656d7 100644
> --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
> @@ -1,11 +1,7 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -
>  # Include machine specific configurations for UEFI EDK2
>  
>  MACHINE_EDK2_REQUIRE ?= ""
>  
> -MACHINE_EDK2_REQUIRE_n1sdp = "edk2-firmware-n1sdp.inc"
> -MACHINE_EDK2_REQUIRE_sgi575 = "edk2-firmware-sgi575.inc"
>  MACHINE_EDK2_REQUIRE_fvp-base = "edk2-firmware-fvp-base.inc"
>  
>  require ${MACHINE_EDK2_REQUIRE}
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/initialise.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/initialise.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/uefi/files/initialise.patch
> rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/initialise.patch
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> similarity index 94%
> rename from meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> rename to meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index a594971..43b635a 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -20,9 +20,6 @@ SRC_URI = "\
>      ${EDK2_PLATFORMS_SRC_URI};name=edk2-platforms;destsuffix=edk2/edk2-platforms;nobranch=1 \
>  "
>  
> -PV = "202008+git${SRCPV}"
> -SRCREV_edk2           ?= "06dc822d045c2bb42e497487935485302486e151"
> -SRCREV_edk2-platforms ?= "7aab81a35aef7b295e73d7d6dfd528cc812790ed"
>  SRCREV_FORMAT         = "edk2_edk2-platforms"
>  
>  EDK2_BUILD_RELEASE   ?= "1"
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb
> new file mode 100644
> index 0000000..1ff24ff
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb
> @@ -0,0 +1,5 @@
> +SRCREV_edk2           ?= "bd85bf54c268204c7a698a96f3ccd96cd77952cd"
> +SRCREV_edk2-platforms ?= "46df7b29afeb846ee664e48949f9c8161abf1f2f"
> +
> +require edk2-firmware.inc
> +
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb
> new file mode 100644
> index 0000000..60363d8
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb
> @@ -0,0 +1,4 @@
> +SRCREV_edk2           ?= "06dc822d045c2bb42e497487935485302486e151"
> +SRCREV_edk2-platforms ?= "7aab81a35aef7b295e73d7d6dfd528cc812790ed"
> +
> +require edk2-firmware.inc
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
> new file mode 100644
> index 0000000..1d47d3e
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
> @@ -0,0 +1,4 @@
> +SRCREV_edk2           ?= "872f953262d68a11da7bc2fb3ded16df234b8700"
> +SRCREV_edk2-platforms ?= "46df7b29afeb846ee664e48949f9c8161abf1f2f"
> +
> +require edk2-firmware.inc
> -- 
> 2.17.1
> 

> 
> 
> 

