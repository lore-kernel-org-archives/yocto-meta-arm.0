Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.17902.1617377178880282619
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 08:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=dTeA9GZT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id 1so3965809qtb.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Apr 2021 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BddhauS/Mw/dIJOwEW/z46X5FW1P6uneJ5+1S0W1iGI=;
        b=dTeA9GZTYo1poYRFDOuW1MVHDNUb34lKQtXjDdMv/ust1DkNJUwQmILvdW3WgoozbW
         XQxH1cWw6MEXOm5ifK7/3mJ8k16kH8yqiwyUdjjzL9cjLIflfDcex9+HIFH1u+TG7SPD
         bI7OSXnkdespD0cw5oVzhIdabBwB5qM1T+RwZlMXYxFWzPQ6OoDGN1UHOG7V3VHzXeon
         FdkcN7WzaU/T2g6E0YMuewbqCjUUqw2IQpxQR0C671Scx2lSsiqUEsp9hnRwXVxdLEcP
         N50KjC31URjTJWcavbPK0ksv5hbMkzSgCEm27H1Ieks3txsEBNy1Cq8umjqYNLeOTNvX
         uK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BddhauS/Mw/dIJOwEW/z46X5FW1P6uneJ5+1S0W1iGI=;
        b=LQWhrR8rvqQlonVWDCmFSB89j9UhOjfH3ppJbnW5yywwGmlwUpvpmeW40C9E1o1rMV
         b+EUScMadDi0Mss6sUPveC+jhSeMbg0hr/VmtqYs5thINKpz0nrz3goYlBSnMHsFsaLR
         FHx8VN0PfLHzEhSdtw4eIjZpbl5bGv4R8Z0I05YEAsbY3enimicZzZghhiw2RO+Fg3rz
         adu1HrQFB6u68yXdcpjHPkWRYiDMkJKE2ku1lY4+rNye132NUr1WLsR6m0iGdoYzNHwC
         BBZF5lg150hwIFDgRtVowj6/Kcw/RmcuBxmpDxAuRbv20q+T7o9ngoIjXCIV7VJk37SH
         bbpg==
X-Gm-Message-State: AOAM533f6HEo9QMbzzCCOhaiG6Gemd3BM5QJzQp8jopLCBqpW+3zrdea
	5YdR9xCpl5EbAMLjpjbkBn8Mdw==
X-Google-Smtp-Source: ABdhPJw/pTxMOw6z7iLfmpM5giNLYq9x3BKdN8BApZrNVX5LsTPB/rv6UgKb/VFt0E5oYTwrICAuKg==
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr11585012qtv.299.1617377178054;
        Fri, 02 Apr 2021 08:26:18 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:995e:34b5:8e34:d202])
        by smtp.gmail.com with ESMTPSA id d26sm4274624qtw.72.2021.04.02.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 08:26:17 -0700 (PDT)
Date: Fri, 2 Apr 2021 11:26:16 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/sbsa-acs: add SBSA Architecture Compliance Suite
Message-ID: <20210402152615.GA5054@kudzu.us>
References: <20210401092922.2585351-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210401092922.2585351-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 01, 2021 at 10:29:22AM +0100, Ross Burton wrote:
> Add a recipe for SBSA Architecture Compliance Suite, a test suite for
> SBSA.
> 
> As this is implemented as a module for the EDK2 Shell application, this
> can include the edk2-firmware recipe to do the heavy lifting.
> 
> Change-Id: I890ea41d7d1068d74a541c06411aad894728f44d
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Applied to master with slight fix for reference to recently updated
(by you) EDK recipe.

Thanks,
Jon

>  .../sbsa-acs/sbsa-acs/shell.patch             | 26 +++++++++++++++++++
>  .../recipes-test/sbsa-acs/sbsa-acs_3.0.bb     | 25 ++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch
>  create mode 100644 meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> 
> diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch
> new file mode 100644
> index 0000000..0cbbb47
> --- /dev/null
> +++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch
> @@ -0,0 +1,26 @@
> +Patch in the paths to the SBSA test suite
> +
> +Upstream-Status: Inappropriate (required action)
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
> +index c42bc9464a..ea21f07a31 100644
> +--- a/ShellPkg/ShellPkg.dsc
> ++++ b/ShellPkg/ShellPkg.dsc
> +@@ -20,6 +20,8 @@
> +   SKUID_IDENTIFIER               = DEFAULT
> + 
> + [LibraryClasses.common]
> ++  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf
> ++  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.inf
> +   UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
> +   UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
> +   UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
> +@@ -83,6 +85,7 @@
> +   # Build all the libraries when building this package.
> +   # This helps developers test changes and how they affect the package.
> +   #
> ++  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf 
> +   ShellPkg/Library/UefiShellLib/UefiShellLib.inf
> +   ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLib.inf
> +   ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf
> diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> new file mode 100644
> index 0000000..9601f24
> --- /dev/null
> +++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> @@ -0,0 +1,25 @@
> +require recipes-bsp/uefi/edk2-firmware_202011.bb
> +
> +PROVIDES_remove = "virtual/uefi-firmware"
> +
> +LICENSE += "& Apache-2.0"
> +LIC_FILES_CHKSUM += "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
> +
> +SRC_URI += "git://github.com/ARM-software/sbsa-acs;destsuffix=edk2/ShellPkg/Application/sbsa-acs;protocol=https;branch=release;name=acs \
> +            git://github.com/tianocore/edk2-libc;destsuffix=edk2/edk2-libc;protocol=https;branch=master;name=libc \
> +            file://shell.patch"
> +
> +SRCREV_acs = "1b3a37214fe6809e07e471f79d1ef856461bc803"
> +SRCREV_libc = "61687168fe02ac4d933a36c9145fdd242ac424d1"
> +
> +EDK2_ARCH = "AARCH64"
> +EDK2_PLATFORM = "Shell"
> +EDK2_PLATFORM_DSC = "ShellPkg/ShellPkg.dsc"
> +EDK2_EXTRA_BUILD = "--module ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf"
> +
> +PACKAGES_PATH .= ":${S}/edk2-libc"
> +
> +do_install() {
> +    install -d ${D}/firmware
> +    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/*/Sbsa.efi ${D}/firmware/
> +}
> -- 
> 2.25.1
> 

> 
> 
> 

