Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40B0CA1002
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:16:39 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.18750.1725030997280654046
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 08:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=FTM05drU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a8125458e4so49517285a.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725030996; x=1725635796; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=COygTS1Bc/wEIvaJEy77DJnSoVPdHqvb4NAkht6JrqM=;
        b=FTM05drUh4DCNjOAovE3ITXO357P70IvdWUSVh4bAKOwl8ypZoGGrlUKmquv2dKNGY
         fd7ceI45zGjwxgwYbqhH2Y0AM08h17qEIyM64hPhTRrhhSAFIlgNXmgKVaHmPEYTqa3w
         JPHaUVFgB7zfPGddA7ESu9aCeI41iXulcAWkmyyQAPGVyEMjYCv1PPbiLcp4O8MqZUOf
         nqp2QonRudEoU6DGs+bfLvTZbvRZNPj4/6+zbiQHgSAj5Gvb1Nloay7dXhUhLQ8ZEQSI
         6enffc6GSfJEIKpLLRP/0YIemCV+Wyf1RcEUpeq8zmBSi+hNbd15yL+z6bljCtZNzhtG
         Fw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725030996; x=1725635796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COygTS1Bc/wEIvaJEy77DJnSoVPdHqvb4NAkht6JrqM=;
        b=jQf/xzABIe2zdf/TELjYGuHlo64gMiDLqQ9Fr7lZ6QuzPNgmmZtnXu+TdL6MfPByyu
         B23Cd+6H+RFRuExyraOdjkS0fPC+TnbZHJhkuRUFeHT0Pk8Vo13upEl8buyCSUPo3zBr
         4FldG9vYUAGJKDQ8SVwtKLAHesXuECuHTKN/rfQVpzYmzl3rIxLytiTQReOBSDvWFEpA
         ozhY2KFT8d44kAXe0Se6OkIbv7p5Iyau0m+bi5fjd2PmuK6ndX+ix0jPzOXMz8ugEJ0S
         i9Nczr1eYXxVrNrV6LKt2eiyDiFDz+XbcYIhWZe0Hw4oZ8XajbEXfS3xE0p9UZUDmVe5
         pGYw==
X-Gm-Message-State: AOJu0YzQfmDDyi6OVkegyc9h3102Egmdj2kz6nq5F5FIdLhfNoNcznZS
	nDuR+/Chv2yBcvzxwN66uV+4keL33BKa11SMJKacd5CrRNuv8to/CEIguIkk4g==
X-Google-Smtp-Source: AGHT+IERL2Z19IymitaV8425yjYh0mB1VO6ypOjVI2xtUiEQyiK0SP/nBwZcH6AKhjqCCx2MSJXEoA==
X-Received: by 2002:a05:620a:c44:b0:7a6:5dbf:72d7 with SMTP id af79cd13be357-7a8042797e4mr873724885a.57.1725030996164;
        Fri, 30 Aug 2024 08:16:36 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806c2aefcsm149435585a.50.2024.08.30.08.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:16:35 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:16:34 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 10/13] linux-yocto: Setup UEFI and sign kernel image
Message-ID: <ZtHiUh717gEP6T05@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-11-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-11-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 15:16:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6036

On Thu, Aug 29, 2024 at 10:32:06AM -0600, Javier Tia wrote:
> efivarfs kernel module is required to access EFI vars.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  .../core-image-minimal-uefi-secureboot.inc    |  8 ++++++++
>  .../linux/linux-yocto%.bbappend               |  2 ++
>  .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
> 
> diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> index 2232d3b3..06046f6e 100644
> --- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> +++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> @@ -1,3 +1,11 @@
>  inherit uefi-sb-keys
>  
>  WKS_FILE = "efi-disk-no-swap.wks.in"
> +
> +# Detected by passing kernel parameter
> +QB_KERNEL_ROOT = ""
> +
> +# kernel is in the image, should not be loaded separately
> +QB_DEFAULT_KERNEL = "none"
> +

QB's are qemu testing variables.  I don't think they should be here.
Either move them to the machine conf, or the yml file, or make a
machine just for this based on qemuarm64-secureboot.

> +KERNEL_IMAGETYPE = "Image"
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
> index a287d0e1..29c21355 100644
> --- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
> @@ -25,3 +25,5 @@ SRC_URI:append:qemuarm = " \
>  
>  FFA_TRANSPORT_INCLUDE = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'arm-ffa-transport.inc', '' , d)}"
>  require ${FFA_TRANSPORT_INCLUDE}
> +
> +require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'linux-yocto-uefi-secureboot.inc', '', d)}
> \ No newline at end of file
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
> new file mode 100644
> index 00000000..cb62fdee
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
> @@ -0,0 +1,19 @@
> +KERNEL_FEATURES += "cfg/efi-ext.scc"
> +
> +DEPENDS += 'gen-uefi-sb-keys'
> +
> +inherit sbsign
> +
> +SBSIGN_KEY = "${UEFI_SB_KEYS_DIR}/db.key"
> +SBSIGN_CERT = "${UEFI_SB_KEYS_DIR}/db.crt"
> +
> +# shell variable set inside do_compile task
> +SBSIGN_TARGET_BINARY = "$KERNEL_IMAGE"
> +
> +do_compile:append() {
> +    KERNEL_IMAGE=$(find ${B} -name ${KERNEL_IMAGETYPE} -print -quit)
> +    do_sbsign
> +}
> +
> +RRECOMMENDS:${PN} += "kernel-module-efivarfs"
> +RRECOMMENDS:${PN} += "kernel-module-efivars"
> -- 
> 2.46.0
> 
> 

