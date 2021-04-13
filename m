Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.4542.1618351827897208655
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 15:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=ELzEkZrv;
 spf=pass (domain: foundries.io, ip: 209.85.167.179, mailfrom: ricardo@foundries.io)
Received: by mail-oi1-f179.google.com with SMTP id e66so3264099oif.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Apr 2021 15:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ck9lGZUf9F+1UJZo7n8VM+mjf6K55qTkfcVE6Ww5m4U=;
        b=ELzEkZrvTYOKPlFZWHa3xXExVbBivJLeLmQA7sX+p4vTHiLjxSrso59zBX2nlNuXK5
         aWEHC9B4ecUA9OTdwTcBjEKpf3dC88c+/sGClW4FK6AC2ydoXuVE8UdAnSi2S/tBSfjo
         01AjXlls/o1r1GI+4ok2ur2aS0h/jZ/NN+E0kVcNh3MKBPEcHQkhOsKnTb/OmzO0rtHX
         a4zZkCQAiP3q3RsnHWzeQM5Y2wvrQaJZTJb108AloqV0HjN5faHMBB0RjgOAYuhEFODi
         cQVL/FgUG6ypjSx7ts2WlLH4RzU1jx7t22NhlfGYPII8/kLkTW3mrbuXFt4sKW27gYSi
         3vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ck9lGZUf9F+1UJZo7n8VM+mjf6K55qTkfcVE6Ww5m4U=;
        b=fu4+3QiKKMHxChxueb4Xr2eFjvkhzD38MM2j+L/mBsJamfVJ38mEaoi0hZNzEt8e/5
         UB54WFSbAMWRcpTefnmFefsn6AhrK2bxXm1sELyFESZvIH3SqGNkwbizSLnvuQ1jsvrL
         zcogAcOkcaylNURCzJDgMncc2uTbP2gxGmcFtuf1b8znT5Dx1u0KH5A6MPBGd4aNe6Fp
         pElHBJ/s/l/MMTZ1Zuo5bcPhAUQsu1qbj2laIOEAC3Wa4ViMGg1DachEz4YAc8a9OwTk
         nVIyBBztvxrxT3aBAisyC5PaqywLI1/XnVFK2/dZjks0+7SeD1bJCRZ0k1JKJ4Ez8ck2
         BMYw==
X-Gm-Message-State: AOAM53216iHv9jY7CvYh78YDE3VsCzRQ0Cg4XUX4MTk7gaM2CUikV6/q
	tMUZgZOznhNpwJfu2rpIUvv+ShVCqkOAvZit2CYG
X-Google-Smtp-Source: ABdhPJyjFvmZzEFGFz0aoraSQOYKn4AT//vSuI2FnfIbXWlJvTLnumjuh8rWcsgeQnhXslJdyG0QQs1OZYRTWnx6lxo=
X-Received: by 2002:aca:6701:: with SMTP id z1mr1405531oix.3.1618351827066;
 Tue, 13 Apr 2021 15:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210413094038.3577754-1-yann@blade-group.com> <20210413094038.3577754-5-yann@blade-group.com>
In-Reply-To: <20210413094038.3577754-5-yann@blade-group.com>
From: "Ricardo Salveti" <ricardo@foundries.io>
Date: Tue, 13 Apr 2021 19:09:51 -0300
Message-ID: <CAAaKDhFKmaoNqxe9QYUTAYbdBGcAz_nZmAqMbXnkw96h=h9yDQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/4] arm/optee-client: create the /data/tee/ directory needed by tee-supplicant
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 13, 2021 at 6:41 AM Yann Dirson <yann.dirson@blade-group.com> wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> With a writable rootfs, tee-supplicant will create this directory as needed,
> but on a readonly rootfs it's obviously not possible.
>
> Getting a readonly-rootfs use-case fully working still require a proper writable
> filesystem to be mounted there, but how to do that is distro policy, and correct
> OP-TEE can be at least be checked by mounting a tmpfs there.

It might be better here to follow FHS and use a standard directory for
the writable content (e.g. /var) instead. This should cover most
distro configuration.

> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta-arm/recipes-security/optee/optee-client.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
> index f697386..0198433 100644
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -24,6 +24,8 @@ do_install_append() {
>      install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
>      install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
>
> +    install -d -m755 ${D}/data/tee
> +

You could give 'CFG_TEE_FS_PARENT_PATH=${localstatedir}/tee' to
EXTRA_OEMAKE, for example.

Cheers,
-- 
Ricardo Salveti
