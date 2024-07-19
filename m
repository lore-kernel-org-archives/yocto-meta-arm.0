Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A04C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 09:34:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.15182.1721381637579545609
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 02:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NB7IKTIw;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea7d2a039so1309992e87.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721381635; x=1721986435; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2C0c8YjcpMdz0Tpr/c0GQ4ByInQT7+g375EftKm6HgQ=;
        b=NB7IKTIwS77s3wOdM9BissvdvxVNYnhUObGtf2Cdz970hGEqU1eOrwCmaHjIDdy98N
         zALJFirXshm9R8uqVTKIsGud2f/Y21w5S7TJ8dZTaIfI0K8PvjT7fAXHaYU/bDXI5wL8
         LNHiCVuN9rPMlaA4DuL+yMEgRccutftSYJjM+p+jsg8kWOlHKEHTYEYxhclKuuv9FjWL
         olp1klBz8Kz5SnUf07jE7hKvWz3sILtov6ZHl+d4pEC9+u4+Eba9Y4IkayJa2MieWcfs
         utmqGDjUeNnGzeEh2LfCAwuJwkFr7ED6idMJuxw+XK9lwsfnUM/fniziLTLSE9GAjcDl
         BcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381635; x=1721986435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2C0c8YjcpMdz0Tpr/c0GQ4ByInQT7+g375EftKm6HgQ=;
        b=HJ1gdSewR5qo3WbV7CiuQ4GA0I6BVXkpMB9dQbeFAFiJdHUBF1CHX3SCK4n1zxyhrw
         O1eXbM4UPzgoL+zFYW+SSHOMkTCqKFI06w5VbVFSkvIMzEKVhOk8RZstPA7sUBJMujrY
         O/c7lr/2cLG+D/makHm9bSq9oYCJpyEV95SBxiFrsAvaOrtcU3waeydnxmThkzSwhQ/4
         Etid0foQ4gpBWQjo4oHCv4XHQYNsH62agwacdrCF3taEOLUHpcLVQqK5WAyrgute5GFI
         p9IjQ2RE4OYJTqquAScM2HkNHIbOdtkrTMC5BnkbxoQKoP8sCkox/Q3byrzu2q9J2Z0w
         p5JQ==
X-Gm-Message-State: AOJu0Ywpwh1I83aVJDDnahng1OBBlwieu5wzURx0Huw022PZS3vQR357
	UC1r8OP8ylyaZjJeyF5c63D7TwWth25G1HHraX7fAlwvsM8BPfTMj9knWviB6PE=
X-Google-Smtp-Source: AGHT+IHIPTcoGrt4FjebPB/4RBz7T6BQ2NeLMTcOXH4+v87eWChamG/sLxhnWuHhgPefgtK7Gi3Trw==
X-Received: by 2002:a05:6512:a92:b0:52c:a5cb:69e4 with SMTP id 2adb3069b0e04-52ee5441795mr3950202e87.54.1721381635403;
        Fri, 19 Jul 2024 02:33:55 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef55776eesm138324e87.255.2024.07.19.02.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:33:54 -0700 (PDT)
Date: Fri, 19 Jul 2024 12:33:52 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v1 4/7] qemuarm64-secureboot: Setup UEFI and Secure Boot
 in u-boot
Message-ID: <ZpozACl2RkAsQ7F_@nuoska>
References: <20240718203526.52214-1-javier.tia@linaro.org>
 <20240718203526.52214-5-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718203526.52214-5-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 09:34:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5908

Hi,

On Thu, Jul 18, 2024 at 02:35:23PM -0600, Javier Tia wrote:
> Add u-boot minimal UEFI definitions. Setup UEFI variables with the keys
> previously generated.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  .../u-boot/u-boot-qemuarm64-secureboot.inc     | 18 ++++++++++++++++++
>  .../qemuarm64-secureboot.cfg                   | 10 ++++++++++
>  .../recipes-bsp/u-boot/u-boot_%.bbappend       |  1 +
>  3 files changed, 29 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
> new file mode 100644
> index 00000000..0a0accd1
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
> @@ -0,0 +1,18 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${MACHINE}:"
> +
> +SRC_URI += "file://${MACHINE}.cfg"
> +
> +UBOOT_BOARDDIR = "${S}/board/emulation/qemu-arm"
> +UBOOT_ENV_NAME = "qemu-arm.env"
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
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg
> new file mode 100644
> index 00000000..d2edb5fb
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg
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
> index 11f332ad..8df993ae 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -5,6 +5,7 @@ MACHINE_U-BOOT_REQUIRE:corstone1000 = "u-boot-corstone1000.inc"
>  MACHINE_U-BOOT_REQUIRE:fvp-base = "u-boot-fvp-base.inc"
>  MACHINE_U-BOOT_REQUIRE:juno = "u-boot-juno.inc"
>  MACHINE_U-BOOT_REQUIRE:tc = "u-boot-tc.inc"
> +MACHINE_U-BOOT_REQUIRE:qemuarm64-secureboot = "${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-boot-qemuarm64-secureboot.inc', '', d)}"

I think this should be generic to all machines if uefi-secureboot is in
MACHINE_FEATURES.

I know meta-arm will only test qemuarm64-secureboot but users will have different
machine names and would expect this to work there too.

Cheers,

-Mikko

>  require ${MACHINE_U-BOOT_REQUIRE}
>  
> -- 
> 2.45.2
> 

