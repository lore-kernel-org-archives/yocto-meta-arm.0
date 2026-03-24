Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3789EF54AC3
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 14:21:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20892.1774362062214253177
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 07:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tOyx81Qu;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486b9675d36so44784985e9.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Mar 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774362060; x=1774966860; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmpgtHfGCOSH442XOrl/lIGqwUTVcGc7x1y3DMAYlxA=;
        b=tOyx81Qu0aBuj1kbsK4X8AEY4JWdZpEWRIHJDGun1rfQQEl48p3+fIdepfhNgox+Uj
         RJbzPlzmbArzvkAEbiqu3KtUpnbUX9xT245nhSjxeGi73QhDrpZdu4CrtKS/4u6auude
         iQh/KzC2zCzc8GpWH4lffHi+Xm1cPtmWOMNlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362060; x=1774966860;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmpgtHfGCOSH442XOrl/lIGqwUTVcGc7x1y3DMAYlxA=;
        b=NrkBxNnnJLGOlUWhuD1906ZMnZ6bJGJUOHvCo+uKix/X0nCA7tCeQmbL4X2N+KNOrd
         q0RHEEsVpmzxr+KZcaERIagzX0q0p/IoqlugqzjBrMic9iINJMb8aFx7SbLBapCMlxNb
         A6BQT6Ljz5bA99Ce3AxY5rcYo1XW6nX4e1zLAXa+3mMwKwcx6zzg2enPsbyUspVW3m0I
         zAPDbM39Qmfhr9KCbpbyj01RI/06E6C3ZZh5jhtX7rFe24eCNVHI1KL2VyoYtJaDyx5X
         wug5Hk5e+FzqDO8iLDcs0erbNMCIrbPU99U7CixYWeuLp2yD7z7hKrnZlMJeRvjFZ4Sr
         xfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaJFb7pk+gShmJE8vaDO1Z25uhtYkqXneccdxVH2T8dWu5yVyDoD7gH0z1X3P/Tdox1hfAxkVOMA==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwrHCNCrl6zV50zKgfA1H2kRarlYa0LHAG5vkAd1ZZpfgxTjU/U
	oG8ERYTIqPeBBteEYYRl59RSXMpqMv3YrUqV8uSNH1vR5XNvQClsZqCFjWqc5F6YYl4=
X-Gm-Gg: ATEYQzy8u945soHzeQpxTQ5d+0L9Y1k4NAHw71P2HW9nqkjhISoEFkrgQLr4hLQqw0O
	81d31oiS86sEjBJzc1ca6qIcbqYYe9pR543BgOvhVerU2HTwWUs6M01SkMsWw8vydy9djjD/Fwj
	ngZNgX1DaYvEqyMxvhRG1YFktD6UbsJXM9bSKQB7kPfYjnv6dpwgtnxixEgY9NYWTGc4gWxlh4y
	U7KXhQ3otW00S+rRUfUtgKDqfz0FKHxFMv5FxWFLIcsIdfhjdnr55+XPYJo8DEj+QfpeChxQjZa
	1uzwzsK/yJhJu+E0LGJgU45aL2LaelausuMl/5qgv2AD7vX3CxZtj548L4gLKeXakGdUUyd+7EO
	gfaC77strzuCZBZc1ZQ3Q7JGbxX4uRSqrXk0OAedQ+4nchclNo//lrw4GMFhtWA43mAzmpoikut
	XAEOiSxue7yVs3NZQdOmRH+6z6bOWKufDRVO3X/QkS5BefvqVEErVpD1JkgWSohugt8Ttf+NXES
	WKXDZwwPlw=
X-Received: by 2002:a05:600c:a085:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-486fedcc6e7mr233500455e9.15.1774362060572;
        Tue, 24 Mar 2026 07:21:00 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116d82f1sm52752095e9.11.2026.03.24.07.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 07:21:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 15:20:59 +0100
Message-Id: <DHB2UT9U65ZR.1A4WRTWWUTYG8@smile.fr>
Subject: Re: AB-INT failure in whinlatter/edk2-firmware do_compile
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Jon Mason" <jon.mason@arm.com>, "Ross Burton" <ross.burton@arm.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, "meta-arm ML"
 <meta-arm@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
References: <DH7ZEAMDKDZ2.3W0SJDQU59IXK@smile.fr>
In-Reply-To: <DH7ZEAMDKDZ2.3W0SJDQU59IXK@smile.fr>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Mar 2026 14:21:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6968

On Sat Mar 21, 2026 at 12:00 AM CET, Yoann Congal wrote:
> Hello,
>
> While testing my whinlatter branch in=20
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/75/builds/3301=
=20
> Worker: ubuntu2510-vk-1
> ... I got a build failure coming from edk2-firmware:
> | make[3]: Entering directory '/srv/pokybuild/yocto-worker/meta-arm/build=
/build/tmp/work/sbsa_ref-poky-linux/edk2-firmware/202408/sources/edk2/BaseT=
ools/Source/C/VfrCompile/Pccts/antlr'
> | gcc  -c -O -I. -I../support/set -I../h -DUSER_ZZSYN  -DZZLEXBUFSIZE=3D6=
5536  antlr.c -o antlr.o
> | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65536=
 -c dlg_p.c
> | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65536=
 -c dlg_a.c
> | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65536=
 -c main.c
> | main.c: In function =E2=80=98ProcessArgs=E2=80=99:
> | main.c:163:42: error: too many arguments to function =E2=80=98p->proces=
s=E2=80=99; expected 0, have 2
> |   163 |                                         (*p->process)( *argv, *=
(argv+1) );
> |       |                                         ~^~~~~~~~~~~~  ~~~~~
> | main.c:120:34: note: declared here
> |   120 |                         WildFunc process;
> |       |                                  ^~~~~~~
>
> It succedded when retried (same whinlatter commit, different worker:
> debian12-vk-7)
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/3303
>
> Regards,

Looks like "arm-bsp/edk2-firmware: fix build on newer hosts"[0] is
needed for the whinlatter branch (On Ubuntu 25.10 GCC version is 15 by
default [1])
[0]: https://git.yoctoproject.org/meta-arm/commit/?id=3D3afd7461b1b4fd49904=
43df10dee30bee4eb6449
[1]: https://documentation.ubuntu.com/ubuntu-for-developers/reference/avail=
ability/gcc/

Regards,
--=20
Yoann Congal
Smile ECS


