Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759CDC54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 07:30:01 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.19119.1709191800236761278
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 23:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F05zo0LQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e45ef83c54so388388a34.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 28 Feb 2024 23:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709191799; x=1709796599; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14XndAD62NaA8utTQYkFxeVuUFS6qUtj1eBG7KXGADE=;
        b=F05zo0LQsMrvebcND3Asn4aAkLYR2XdZ7fbI3JhRXdc5ieU/ETOVvB84l/aAjdhNUG
         szX05oo/jTCHZpIjbJfOYcuynNWYiROUTjq46HO1uQwd5FwEyVwR+pST+9mUhH3B+Pss
         mtLLH9vVv36OFtrNH1SZe/KDjdcaQKKvFi0CPpkEMDeaVCs9cDzIFbPkW5TFawtQlK3N
         aqZmXVmGt5nUlY/KxiBAf0tZH4EaQIQcCSCVCLCbvyF5gYvu2PFVSOx/lhorAo8Y+e3U
         vjA6H/WKxMHW/NJ88tGnIfHJYH/XrBMXRw9oF9rDjupAFSFy2b3NSmEYyQfVoGECzAjU
         D9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709191799; x=1709796599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14XndAD62NaA8utTQYkFxeVuUFS6qUtj1eBG7KXGADE=;
        b=L/tBiIwBXdtS0oOMgUxSMJfz804N21XfDjBNqYP7xBAO+zHDccId6633M/i2W99MmU
         rcF3LZNTAXozu+Mqcmi+xCCv3i0Ni0Fh7qyKbL3BHNbkmetobIFey39hd/WcCj8Ais3Q
         lV6iXWEv0R6ZHrqp2G57sQb/L5QDHy25h1r1qCiieBmlgjX9A/2J6etfgCQAyak9fThP
         YjUg6/epnmxAbmnSTZsU5qvwDIf/ojLSArSfz7QHGCPvbtcBr7YfMnVYx8nRdo6YkjjS
         Y3chx+MOxVsm7tDnw5g1kBS0yl9W6hRG3WAlZNkjSQjogbJrcp1xFk02Tktst/PJK9/K
         MsBQ==
X-Gm-Message-State: AOJu0Yz7Mue+ddvPzVe7PsvM1szjYk/hSOyr2fh8uff5vOMU2xr6ZO6r
	pFiXYl65qmO7uXU3U6zmh8o08RPHVrPlhXa0wGdZPuqqqvJMJUOXOmScWhRnBIpiGz4vY2NRwhf
	zC6AqRjb4762HP6bVBzQx4dfsTS0=
X-Google-Smtp-Source: AGHT+IE3rHQOGTjqp61o2mggrQZfnv1nHlLsVNIeQS7oxxG2huDOfqLN24dLVDWdW56QemPq7RiUdfQjxGEuB8iXTzs=
X-Received: by 2002:a05:6870:9d10:b0:21f:2589:418c with SMTP id
 pp16-20020a0568709d1000b0021f2589418cmr1332142oab.13.1709191799052; Wed, 28
 Feb 2024 23:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20240229071922.76043-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20240229071922.76043-1-alexander.sverdlin@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2024 23:29:32 -0800
Message-ID: <CAMKF1soEsPnc15A381wxMXyBjv=YbOVdorYRvYRBiVTS_9hnLw@mail.gmail.com>
Subject: Re: [PATCH v2] optee-ftpm: fix EARLY_TA_PATHS passed to optee-os
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>, 
	Peter Marko <peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Feb 2024 07:30:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5404

lgtm

On Wed, Feb 28, 2024 at 11:19=E2=80=AFPM A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Fix the build with DISTRO_FEATURES containing "usrmerge":
> make: *** No rule to make target '/.../optee-os/4.1.0/recipe-sysroot/lib/=
optee_armtz/bc50d971-d4c9-42c4-82cb-343fb7f37896.stripped.elf', needed by '=
/.../optee-os/4.1.0/build/core/early_ta_bc50d971-d4c9-42c4-82cb-343fb7f3789=
6.c'.  Stop.
>
> Fixes: 6a105f47b920 ("optee-ftpm: Install artifacts into nonarch_base_lib=
dir")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changes in v2:
> base_libdir -> nonarch_base_libdir
>
>  meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/m=
eta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> index 40423615..4829bc10 100644
> --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> @@ -10,6 +10,6 @@ DEPENDS:append =3D "\
>  EXTRA_OEMAKE:append =3D "\
>                         ${@bb.utils.contains('MACHINE_FEATURES', \
>                        'optee-ftpm', \
> -                      'CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${STAGING_DIR_=
TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', \
> +                      'CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${STAGING_DIR_=
TARGET}/${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf"', \
>                        '', \
>                        d)} "
> --
> 2.43.2
>

