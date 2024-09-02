Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4D5CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 06:43:57 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.32869.1725259431743467055
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 Sep 2024 23:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mDgb9qK8;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5343e75c642so5046266e87.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 01 Sep 2024 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725259430; x=1725864230; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0irR2mZBf5gU6PDO6Vp+IebdSnse31V0i50w60iuwuI=;
        b=mDgb9qK8m1z7Gbs01DuZhYu8B0Bd9mon0H87XyB3+M7L56N7nBb2zgFj8GusXD3QAb
         b3pjQ7bHxr+O517PnuxMq2pmofBTwKciaRt6Pj84yvhwhwoNG4Esf2z8Flmv8zsP8XRR
         FLxdTrDZrPaxy61OOne4FmMGVlPXPbNNz3/QI3YB+VKjsf6hz0hFU2gVMbzDX2eft0rH
         J26jQQz9kk32nTTQIy7bi3iJ9UtKV8+CJKM71KaD3QTwv+Cd6DmunOmmMjGZ0hpYqVCg
         dnxCf2vkgLcHPSJDgkUBYfi8TjuBi1VNUsmiqsTkR+1bVXo17RcJN3oeXwyeq8wKGMWS
         bZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725259430; x=1725864230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0irR2mZBf5gU6PDO6Vp+IebdSnse31V0i50w60iuwuI=;
        b=APujzGO0SA0bvVbi0G/dP06a/gZw4D9aurJhG5UUles28881qyR5vIohaqaoqwCfMO
         WCzvp6TQyt4kjH9/ekDofCRZKiNqzM0b8sGjmRpTz45j2Ihr7y7gZc55UwV4AuUsF3Ha
         CMJ4gRESQHT5IfqXpSG+WjfMwzMeB7+TpoQhGK2ibncj1LdB34u57E/MFnAXw+FZXe9/
         SdEXyT4adXV/NuAQE5i8+OJp1KXPF8KgkhergRCPKdk+gDzKl21LUiBp6lut2H5JFi2j
         oc7L/yv4omBSBtsIIek0hS1bNOoYL88tUTjU2X1nbOAQ9v/vA4U+jhXL8qUIUt3w1fOW
         /BNA==
X-Forwarded-Encrypted: i=1; AJvYcCVL3ovCSbpjjiQxrUTN4Sxz9s+lo5LPFGi/7zUQPzXLKxhquTmph4ETy//FowSjbe18FfdgmCX4Tg==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyY1Trl0N+JwZ67G/DKe4QIg1E3Sd/D1rNUV0RXCBCUftasoQej
	X0c9bLBuAHVI6w5jracc3s5mP1nJutiElwRnryfYGFutIcIKwtbWOgoCc9fjzq4=
X-Google-Smtp-Source: AGHT+IHxj0lxB1/OKqiPirC416EbtloapcmHFqq7vVQp2rRPiDhfHSyWwJuKHtqDH4JEda97zRT35A==
X-Received: by 2002:a05:6512:15a5:b0:52e:9e70:d068 with SMTP id 2adb3069b0e04-53546afad74mr5380981e87.4.1725259429171;
        Sun, 01 Sep 2024 23:43:49 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac5f4sm1498215e87.107.2024.09.01.23.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:43:48 -0700 (PDT)
Date: Mon, 2 Sep 2024 09:43:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Javier Tia <javier.tia@linaro.org>, meta-arm@lists.yoctoproject.org,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 11/13] systemd: Add UEFI support
Message-ID: <ZtVeojaCH0M7Tmrn@nuoska>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-12-javier.tia@linaro.org>
 <ZtHkM_KRdW9Bv18u@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtHkM_KRdW9Bv18u@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Sep 2024 06:43:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6047

Hi,

On Fri, Aug 30, 2024 at 11:24:35AM -0400, Jon Mason wrote:
> On Thu, Aug 29, 2024 at 10:32:07AM -0600, Javier Tia wrote:
> > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> 
> I'm going to want a HUGE comment on why systemd is required here.  Are
> there some unique things in systemd that aren't present for sysvinit?
> Also, I think the systemd patches should be squashed together.

Extending secure boot to userspace is a lot easier with systemd
than with sysvinit where custom scripts will need to be written
for all use cases.

systemd supports dm-verity and TPM devices for encryption usecases
out of the box. Enabling them is a lot easier than writing custom
scripts for sysvinit.

systemd also supports EUFI signing the UKI binaries which merge
kernel, command line and initrd which helps in bringing secure boot
towards rootfs.

Granted, none of these are specific to ARM64 device but these do need
UEFI firmware to work which are available from meta-arm for qemu
in qemuarm64-secureboot.

Cheers,

-Mikko

> Thanks,
> Jon
> 
> > ---
> >  meta-arm/conf/machine/qemuarm64-secureboot.conf              | 5 +++++
> >  .../images/core-image-minimal-uefi-secureboot.inc            | 2 ++
> >  meta-arm/recipes-core/systemd/systemd-efi.inc                | 1 +
> >  meta-arm/recipes-core/systemd/systemd_%.bbappend             | 1 +
> >  4 files changed, 9 insertions(+)
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
> > 
> > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > index 2483c4ac..542d09a3 100644
> > --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > @@ -22,4 +22,9 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
> >  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> >  
> >  MACHINE_FEATURES += "optee-ftpm"
> > +MACHINE_FEATURES += "efi"
> >  MACHINE_FEATURES += "uefi-secureboot"
> > +
> > +INIT_MANAGER = "systemd"
> > +DISTRO_FEATURES += "systemd"
> > +DISTRO_FEATURES_NATIVE += "systemd"
> > diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> > index 06046f6e..07e315a3 100644
> > --- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> > +++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> > @@ -9,3 +9,5 @@ QB_KERNEL_ROOT = ""
> >  QB_DEFAULT_KERNEL = "none"
> >  
> >  KERNEL_IMAGETYPE = "Image"
> > +
> > +IMAGE_INSTALL += "systemd"
> > diff --git a/meta-arm/recipes-core/systemd/systemd-efi.inc b/meta-arm/recipes-core/systemd/systemd-efi.inc
> > new file mode 100644
> > index 00000000..5572e51a
> > --- /dev/null
> > +++ b/meta-arm/recipes-core/systemd/systemd-efi.inc
> > @@ -0,0 +1 @@
> > +PACKAGECONFIG:append = " efi"
> > diff --git a/meta-arm/recipes-core/systemd/systemd_%.bbappend b/meta-arm/recipes-core/systemd/systemd_%.bbappend
> > new file mode 100644
> > index 00000000..660358c2
> > --- /dev/null
> > +++ b/meta-arm/recipes-core/systemd/systemd_%.bbappend
> > @@ -0,0 +1 @@
> > +require ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'systemd-efi.inc', '', d)}
> > -- 
> > 2.46.0
> > 
> > 

