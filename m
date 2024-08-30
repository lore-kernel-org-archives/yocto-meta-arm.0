Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BE6CA0FFD
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 14:23:49 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.17000.1725027823649382681
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 07:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=wXaqsPqp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c353f2f954so1215496d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725027823; x=1725632623; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6geBXYZPDpg6fJv2GB6LXQuOrVjJpPHSSWpsjloqDc=;
        b=wXaqsPqpWKFE3nXnMaQe6hf5Sb1QF+h/rK91ePE/gphEMLTuDqhE2VFibZzGbHFuhO
         bot60mtVN8QZqmNZMX/eK74bovyhh+BPvAceXWYDoug5A7rekQP06sxfJABw7CST2t9N
         wXe14not7mLXafEDvs7tUJx0vJSb/HNY6GeQ+p4/5oP1PqD16HvS/AjdDGb/ajukCEpa
         +xNfXxAwkI70+tnKKoOfKDeRQB3OYKLrorAsC3kc6yHh68aQEpCaTwEjs9KtttPZmBdD
         bDXLsb/EDAv5PuudgO3L+rtU8c/pEoG8uPEY7+VwO3pf5X0WoIvK9La/5EFIETeCtxEf
         uMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027823; x=1725632623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6geBXYZPDpg6fJv2GB6LXQuOrVjJpPHSSWpsjloqDc=;
        b=MWvCq71Kzvux9HkfGnH8O7nXdedwy8z1S1c52oAAwzwN/efVfM8Zt89zrdljdSRyzH
         iz3mtOWeZ66CZtbaHGBzJXTvV27iEM+WmH8Zd6Pev4x1RSuJHpLu6YCw4ai8sgM+krAF
         yO2jDjevNqVKpVIbdNO2eMbVWrfSCw5pFys0rV0O2o5nw9OBzlxFKgSmusQDCylieKhV
         NvDApNHOkhmqwizNiVwAeZ1/4p4eC5576RyvGcV2i0LR22sC4mcU0CPRa5Q3ILoxnhjl
         Y9Y71JIGQjKjmJRpJ0EArfQ8wiRW5HWoxFJER3cd6jrZ1CG48NvUWCpc2E+VZrojZ88Q
         olIA==
X-Gm-Message-State: AOJu0YzNof1d30vpmJWlR9zTjxoClGwo1xxYWiZxHRp+AxFOU5aLrcbb
	zIOxFJj2XSn7/d+gY5cGoHVVdqJt6AVMU7pI+4XEu/LqmmrvPeHFfknDbFTm3A==
X-Google-Smtp-Source: AGHT+IFEzx8xW6BlPtoB1BWViiXYavCs9I84s42lBdYdmBJTb+Rk7XmYm1Xa20peXQ/tqvalm9xQaQ==
X-Received: by 2002:a05:6214:5905:b0:6c1:6f54:2930 with SMTP id 6a1803df08f44-6c33e615b0amr68476606d6.12.1725027822486;
        Fri, 30 Aug 2024 07:23:42 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340bfa85asm14916636d6.23.2024.08.30.07.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:23:42 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:23:40 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 08/13] u-boot: Setup UEFI and Secure Boot
Message-ID: <ZtHV7Cq54lnot0hD@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-9-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-9-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 14:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6034

On Thu, Aug 29, 2024 at 10:32:04AM -0600, Javier Tia wrote:
> Add U-Boot minimal UEFI definitions.
> 
> Embedded UEFI variables with the keys previously generated. It's to
> enable UEFI Secure Boot and verify the authenticity of the firmware and
> operating system.
> 
> When U-Boot is built with UEFI support, it includes a set of efivars
> that are used to store the Secure Boot variables. These efivars are
> embedded in the U-Boot binary and are stored in the flash memory of the
> system.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  .../u-boot/u-boot-qemuarm64-secureboot.inc     | 18 ++++++++++++++++++
>  .../u-boot/u-boot/uefi-secureboot.cfg          | 10 ++++++++++
>  .../recipes-bsp/u-boot/u-boot_%.bbappend       |  2 +-
>  3 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
> new file mode 100644
> index 00000000..ffad08e4
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
> @@ -0,0 +1,18 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://uefi-secureboot.cfg"
> +
> +UBOOT_BOARDDIR = "${S}/board/emulation/qemu-arm"
> +UBOOT_ENV_NAME = "qemu-arm.env"

I'm not seeing these variable referenced anywhere (but I could be
missing it).  Per my comment below, if removed this could be generic.

> +
> +DEPENDS += 'python3-pyopenssl-native'
> +
> +do_compile:prepend() {
> +    export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
> +
> +    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n pk  -d "${UEFI_SB_KEYS_DIR}"/PK.esl  -t file
> +    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n kek -d "${UEFI_SB_KEYS_DIR}"/KEK.esl -t file
> +    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n db  -d "${UEFI_SB_KEYS_DIR}"/db.esl  -t file
> +    "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n dbx -d "${UEFI_SB_KEYS_DIR}"/dbx.esl -t file
> +    "${S}"/tools/efivar.py print -i "${S}"/ubootefi.var
> +}
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
> new file mode 100644
> index 00000000..d2edb5fb
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
> @@ -0,0 +1,10 @@
> +CONFIG_CMD_BOOTMENU=y
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_BOOTCOMMAND="bootmenu"
> +CONFIG_USE_PREBOOT=y
> +CONFIG_EFI_VAR_BUF_SIZE=65536
> +CONFIG_FIT_SIGNATURE=y
> +CONFIG_EFI_SECURE_BOOT=y
> +CONFIG_EFI_VARIABLES_PRESEED=y
> +CONFIG_PREBOOT="setenv bootmenu_0 UEFI Boot Manager=bootefi bootmgr; setenv bootmenu_1 UEFI Maintenance Menu=eficonfig"
> +CONFIG_PREBOOT_DEFINED=y
> \ No newline at end of file
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index 11f332ad..ee815b6a 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -5,6 +5,6 @@ MACHINE_U-BOOT_REQUIRE:corstone1000 = "u-boot-corstone1000.inc"
>  MACHINE_U-BOOT_REQUIRE:fvp-base = "u-boot-fvp-base.inc"
>  MACHINE_U-BOOT_REQUIRE:juno = "u-boot-juno.inc"
>  MACHINE_U-BOOT_REQUIRE:tc = "u-boot-tc.inc"
> +MACHINE_U-BOOT_REQUIRE += "${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-boot-qemuarm64-secureboot.inc', '', d)}"

This seems like it should be generic, but references
"qemuarm64-secureboot"

>  
>  require ${MACHINE_U-BOOT_REQUIRE}
> -
> -- 
> 2.46.0
> 
> 

