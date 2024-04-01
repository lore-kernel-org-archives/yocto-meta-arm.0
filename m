Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE1CCD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 20:27:56 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.48550.1712003275258279668
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Apr 2024 13:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QbFPE9cv;
 spf=pass (domain: linaro.org, ip: 209.85.208.52, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso4217126a12.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Apr 2024 13:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712003274; x=1712608074; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh6IKKzryCkmOP0K7FFkNZrRAfm2E1iRv/KNG5PDSi0=;
        b=QbFPE9cv5J8SixMB7i/S8zruTNY0Q/eB5hncSC4rndh5U/qyz4bDKluCSxRqXSGSnO
         g9i2fqkyRL30Rpr03WaBKsLjP17euk8Sc9nIMbB0WLaLAPU9UDCHhsHn16yeHXDbzNgg
         Qt85k2iaf4OZBLoHsplESaXZD8snu0kmkQpN8+ZVRsPsCme0OajARKzaUOXJZVnsHyOO
         XQh7W5hJkUbfATo1sx/QE0Qh94AkmMh5+ifrDW+2JdJfeA0E45I22YTz6S6OdoztxWW0
         jVn0cXl2UZeFVNQqkBUrIW1+UbsQ+vsTs0VaL5Ta1vAdCtC/37JCV2Nzn06ve975A0bv
         /Aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712003274; x=1712608074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qh6IKKzryCkmOP0K7FFkNZrRAfm2E1iRv/KNG5PDSi0=;
        b=s1ATLHGaRtitcenm92xejfb+HVpx2fHne2fmhYzpzbvppQ8b3d+go18mIqaJTs2iar
         4lwrzHz7cSsdLvgJIsqslILlmNVGKWPoMm4X92k97hBwz7CJYye0ucPUlKbrad6JIZ5Q
         zxKSl0urCexUTluIM3g0ap4v5PN2eI6zhWavE7fe/VEd4p3lJ0sBr6Yy7by6YEA0FTMx
         4nFHEphv0JQj9OjHZS6hLtJuCmlLIiz7d3vz7fwzkspQHg04/M5wa982S1Sn6x3zTq4G
         kWGp/KaX/fOf3yRH1JkMkLRJs+zCMCL8kQ4oA4xTsa3PkR7uQ76GIwdM6V1ujOVKlkFW
         otMg==
X-Forwarded-Encrypted: i=1; AJvYcCWzenwnIEI7rWgm74eU5UfAsQxEmanOgJOZ/ZiGQopEurJm8bXkF8Wbmx/GEczvXzBjpN64lGVtwBCcwt94VW9z2lcxBe0eW8GpSDPPuX6d
X-Gm-Message-State: AOJu0Yx1hMfCWWHG7ViGBw0kWAi0czWcDLoGeFpBuc47DkTyT5T+kuT5
	L9PgIKmIBFpMysOhtA5gqHzKfM+e+JnkQAsgY/5gkDpn7maCv/A4rgoaZ5XMA6iGqr9/y+KzvgA
	HlvS5569HXX0wHBjg6IlhSmpFZ8LTFwR6A+mLfg==
X-Google-Smtp-Source: AGHT+IFVRZ17kSOryyMg1asS67onktGCYa1EGh8/22rKwmNqxw/8IW6LZV2xAxHm31ZedSOj6J9KjJgzX7IX4So1YWw=
X-Received: by 2002:a05:6402:3506:b0:56b:cecb:a4c8 with SMTP id
 b6-20020a056402350600b0056bcecba4c8mr10517735edd.39.1712003273703; Mon, 01
 Apr 2024 13:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org> <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com>
In-Reply-To: <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 1 Apr 2024 14:27:42 -0600
Message-ID: <CANLsYkz674p_HBq3tNuEi=65z8K7KTzNH8S-W29SpXspq8U=gA@mail.gmail.com>
Subject: Re: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
To: Ross Burton <Ross.Burton@arm.com>
Cc: Jon Mason <Jon.Mason@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Apr 2024 20:27:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5504

Hi Ross,

On Wed, 27 Mar 2024 at 07:05, Ross Burton <Ross.Burton@arm.com> wrote:
>
> Hi Mattieu,
>
> On 26 Mar 2024, at 20:20, Mathieu Poirier <mathieu.poirier@linaro.org> wr=
ote:
> > +SRC_URI_RMM     ?=3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.gi=
t;protocol=3Dhttps"
> > +SRCREV_rmm     ?=3D "0a02656945d69757b0779192cebb9b41dd9037d1"
> > +SRCBRANCH_rmm     ?=3D "main"
> > +
> > +SRC_URI =3D "${SRC_URI_RMM};name=3Drmm;branch=3D${SRCBRANCH_rmm} \
> > +   file://0001-build-lib-Add-extra-repositories-for-system-includes.pa=
tch \
> > + "
>
> Is there a good reason for all of this indirection?  If you want to suppo=
rt building from a local source tree/fork, there=E2=80=99s a class that doe=
s that generally (externalsrc).
>

I have addressed all your comments except the one above related to the
externalsrc classe.  What I currently have in the recipe follows what
is found in trusted-firmware-a and trusted-firmware-m.  Moreover, the
documentation in the externalsrc class mentions it is to "build a
piece of software rather than the usual fetch/unpack/patch process".
But for RMM we need to fetch and patch...

I am puzzled as to how to proceed - can you provide more details on
what you expect?

Thanks,
Mathieu

> > +RMM_CONFIG ?=3D "qemu_virt_defcfg"
>
> The =E2=80=9Cdefault=E2=80=9D isn=E2=80=99t qemu, as that isn=E2=80=99t u=
seful for anything but qemu.  A better solution would be:
>
> RMM_CONFIG ?=3D =E2=80=9C"
> RMM_CONFIG:qemuarm64 =3D =E2=80=9Cqemu_virt_defcfg=E2=80=9D
>
> Also this recipe needs some COMPATIBLE_MACHINE statements, so that a worl=
d build won=E2=80=99t try and build it for eg qemux86-64.
>
> > +B =3D "${WORKDIR}/build"
>
> cmake class sets B already, remove.
>
> > +# Supplement include path
> > +EXTRA_OECMAKE +=3D "-DCMAKE_INCLUDE_PATH=3D${WORKDIR}/recipe-sysroot/u=
sr/include"
>
> -DCMAKE_INCLUDE_PATH=3D${STAGING_INCDIR} would be neater, but this really=
 does feel like a bug in the CMakeLists.txt.  Why doesn=E2=80=99t it respec=
t the sysroot that the compiler is told to use?  We carefully configure a t=
oolchain that specifies exactly what compiler, sysroot, flags, etc to use.
>
> > +export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> > +export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fa=
lse)}"
>
> CMake class should be doing this, remove.
>
> Ross

