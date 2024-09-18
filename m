Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31B1CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 14:53:18 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.17283.1726671189900439054
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Sep 2024 07:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ob+xYkwv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a95efbaf49so410786385a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Sep 2024 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1726671189; x=1727275989; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9DDPkP0tJYLRVzo6Vgop0VlFyZ7TjJEH/2UxixCbClc=;
        b=ob+xYkwvdZ0j+pwciq4erYKFVIwpYZUJhc2VodMHIjKJhMfKsw6yirWoM9n9349cwu
         WNUcWZ1w98PmfhaPYsYFQRs1HmtgQhdoQSDsIk3wlYXcUOwXNk4i15yKkOEeGV/E2+E+
         UDZfVMALOnduYHBqLpBlmQ7HC7BJEFOROKD1+o06gSkwZP7RuQ7YeHOcHibHesj55Glq
         bhw6qB5p+S0naRVhXyhgXAWzYDE0snmCBAsVr5/+xgJAYDMBP49AsNvmwix6869Yb12M
         g8eZjUOAdlyZoBJW3TwhYDgOGSqUKqV12nh5XlMyyd3V6gwSBLYQLO1rZ3IdhJFQdlxZ
         M0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726671189; x=1727275989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DDPkP0tJYLRVzo6Vgop0VlFyZ7TjJEH/2UxixCbClc=;
        b=lVsaznxSjqbkanNbimhFBPDIWSACMa6x30rbxYtPQmqEb3E1XXgVHVRP0pBa3Pi7CI
         P81ghhUQbobWA1bjIF082KIO+OEhJ+XjFZbntqbvEQNyM9CxxapTX3v45wQoZnTgcosi
         2RaIuJTawr8gNpi0T3MJpbbmhmyH0H2w5rFWXxwX/3PPxRGYHZL0QedQmGivnFX2UinD
         J086kHtSpMJyiKx0/tsTjrVIqAnS/zU+ueIZYmGnlzpHDDkOuJBBpeg76uRrC2DkjS2G
         aGOzlfXr4ul9/9Fz8m2TbFA5fqLCDZ5+ek4tyAihQ5o3uzA/XVhQVsF3Ie8eVdec+5/D
         IofQ==
X-Gm-Message-State: AOJu0Yy9crVfUqKb76VgWI2xlE2dgbZ4cwyCs2uvuDFOowXv0i+o7D8H
	X83tteW/5cYzCK5w5Vjdn1SqSnUyYwEuZgJaBgDnsqov9q44XFxxxaV8Na5+0RrhlkgoY60nRP8
	=
X-Google-Smtp-Source: AGHT+IFdVDX//ajxSWnHZOQA4UQ8KF6A8qGyJf688YNv8L9XQb/GMXYI8Dl0fWIwipC8IKFUdNI0fQ==
X-Received: by 2002:a05:620a:454c:b0:7a9:bbcb:d39d with SMTP id af79cd13be357-7ab30d0b966mr3037655885a.4.1726671188726;
        Wed, 18 Sep 2024 07:53:08 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ab3e9b36edsm459111985a.58.2024.09.18.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 07:53:08 -0700 (PDT)
Date: Wed, 18 Sep 2024 10:53:06 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v5 2/2] qemuarm64-secureboot: Enable UEFI Secure Boot
Message-ID: <ZurpUsLg_312TYpO@kudzu.us>
References: <20240904224349.108885-1-javier.tia@linaro.org>
 <20240904224349.108885-3-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240904224349.108885-3-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Sep 2024 14:53:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6081

On Wed, Sep 04, 2024 at 04:43:49PM -0600, Javier Tia wrote:
> Encapsulate all UEFI Secure Boot required settings in one Kas
> configuration file.
> 
> Introduce SBSIGN_KEYS_DIR variable where UEFI keys will be generated
> to sign UEFI binaries.�
> 
> Introduce uefi-secureboot machine feature, which is being used to
> conditionally set the proper UEFI settings in recipes.
> 
> Replace Grub bootloader with systemd-boot, which it makes easier to
> enable Secure Boot.
> 
> Advantages using systemd as Init Manager:
> 
> - Extending secure boot to userspace is a lot easier with systemd than
> with sysvinit where custom scripts will need to be written for all use
> cases.
> 
> - systemd supports dm-verity and TPM devices for encryption usecases out
> of the box. Enabling them is a lot easier than writing custom scripts
> for sysvinit.
> 
> - systemd also supports EUFI signing the UKI binaries which merge kernel,
> command line and initrd which helps in bringing secure boot towards
> rootfs.
> 
> - systemd offers a modular structure with unit files that are more
> predictable and easier to manage than the complex and varied scripts
> used by SysVinit. This modularity allows for better control and
> customization of the boot process, which is beneficial in Secure Boot
> environments.
> 
> Add one test to verify Secure Boot using OE Testing infraestructure:
> 
> $ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml
> ...
> RESULTS - uefi_secureboot.UEFI_SB_TestSuite.test_uefi_secureboot: PASSED (0.62s)
> ...
> SUMMARY:
> core-image-base () - Ran 73 tests in 28.281s
> core-image-base - OK - All required tests passed (successes=19, skipped=54, failures=0, errors=0)
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  ci/qemuarm64-secureboot.yml                   |  1 +
>  ci/uefi-secureboot.yml                        | 34 +++++++++++++++++++
>  .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 ++++++++++++++++
>  3 files changed, 64 insertions(+)
>  create mode 100644 ci/uefi-secureboot.yml
>  create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
> 
> diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
> index b26941e0..7866adbb 100644
> --- a/ci/qemuarm64-secureboot.yml
> +++ b/ci/qemuarm64-secureboot.yml
> @@ -4,6 +4,7 @@ header:
>    version: 14
>    includes:
>      - ci/base.yml
> +    - ci/uefi-secureboot.yml

I don't think we want this.  What I think we want is to keep this file
as-is, then use the uefi-secureboot.yml as an add on.  Using the kas
line above, it would be:
$ kas build ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml

Then, we would want to modify .gitlab-ci.yml with something like:

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7568c25e9d13..075e523c7d29 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -117,6 +117,7 @@ update-repos:
 #  TCLIBC: [glibc, musl]
 #  FIRMWARE: [u-boot, edk2]
 #  TS: [none, trusted-services]
+#  UEFISB: [none, uefi-secureboot]
 #  VIRT: [none, xen]
 #  TESTING: testimage
 #  SECUREDEBUG: [none, secure-debug]
@@ -274,6 +275,7 @@ qemuarm64-secureboot:
         TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TS: [none, qemuarm64-secureboot-ts]
+        UEFISB: [none, uefi-secureboot]
         TESTING: testimage
       - KERNEL: linux-yocto-dev
         TESTING: testimage

When this is added, it'll be built and checked with our Gitlab CI.
Honestly, I think this is the only thing keeping it from being
included (unless Ross has additional feedback).

Thanks,
Jon

>  
>  machine: qemuarm64-secureboot
>  
> diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
> new file mode 100644
> index 00000000..d65beed3
> --- /dev/null
> +++ b/ci/uefi-secureboot.yml
> @@ -0,0 +1,34 @@
> +# yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
> +
> +header:
> +  version: 14
> +  includes:
> +    - ci/meta-openembedded.yml
> +    - ci/meta-secure-core.yml
> +
> +local_conf_header:
> +  uefi_secureboot: |
> +    SBSIGN_KEYS_DIR = "${TOPDIR}/sbkeys"
> +    BB_ENV_PASSTHROUGH_ADDITIONS = "SBSIGN_KEYS_DIR"
> +
> +    # Detected by passing kernel parameter
> +    QB_KERNEL_ROOT = ""
> +
> +    # kernel is in the image, should not be loaded separately
> +    QB_DEFAULT_KERNEL = "none"
> +
> +    WKS_FILE = "efi-disk-no-swap.wks.in"
> +    KERNEL_IMAGETYPE = "Image"
> +
> +    MACHINE_FEATURES:append = " efi uefi-secureboot"
> +
> +    EFI_PROVIDER = "systemd-boot"
> +
> +    # Use systemd as the init system
> +    INIT_MANAGER = "systemd"
> +    DISTRO_FEATURES:append = " systemd"
> +    DISTRO_FEATURES_NATIVE:append = " systemd"
> +
> +    IMAGE_INSTALL:append = " systemd systemd-boot util-linux coreutils efivar"
> +
> +    TEST_SUITES:append = " uefi_secureboot"
> \ No newline at end of file
> diff --git a/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py b/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
> new file mode 100644
> index 00000000..9e47ea8d
> --- /dev/null
> +++ b/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
> @@ -0,0 +1,29 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.oetimeout import OETimeout
> +
> +
> +class UEFI_SB_TestSuite(OERuntimeTestCase):
> +    """
> +    Validate Secure Boot is Enabled
> +    """
> +
> +    @OETimeout(1300)
> +    def test_uefi_secureboot(self):
> +        # Validate Secure Boot is enabled by checking
> +        # 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot.
> +        # The GUID '8be4df61-93ca-11d2-aa0d-00e098032b8c' is a well-known
> +        # identifier for the Secure Boot UEFI variable. By checking the value of
> +        # this variable, specifically
> +        # '8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot', we can determine
> +        # whether Secure Boot is enabled or not. This variable is set by the
> +        # UEFI firmware to indicate the current Secure Boot state. If the
> +        # variable is set to a value of '0x1' (or '1'), it indicates that Secure
> +        # Boot is enabled. If the variable is set to a value of '0x0' (or '0'),
> +        # it indicates that Secure Boot is disabled.
> +        cmd = "efivar -d -n 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot"
> +        status, output = self.target.run(cmd, timeout=120)
> +        self.assertEqual(output, "1", msg="\n".join([cmd, output]))
> -- 
> 2.46.0
> 
> 

