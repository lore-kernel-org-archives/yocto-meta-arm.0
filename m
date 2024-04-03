Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BA1CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 16:40:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.16395.1712162455278186955
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 09:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Yz4JRLxv;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56df8e6a376so34833a12.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Apr 2024 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712162454; x=1712767254; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCwOvHHBeDAVg7t0yiuTvdHab5hO/wO4nlgyO6C8dm8=;
        b=Yz4JRLxvr6/v7TaielgQtd14oNz7w1YZ8LAVZ9IdTw0HRDI6coo8R+erLEV5IAZYVa
         Zpr7CFkqIYSaidrYqxVkzpuefhpDPb7euVBl0AS5er7r1GQtTZ4l9lyrd/ZcwTkbTt/Y
         VwMilwMxkRP02pyq82zG8JYOWS3IbqXlbSkspivf6kuka5v2zh1gcOR0fwluF30ZQmxX
         B0G2zbTWPL6LMqUyS0DC3fxEcA4hCZ3mZ6RpDoWZf80JYXnSYIFBVDnsxaQdEiIl3WPz
         c8GpPW9/LTHMQgLpawZlg/AJkZ0VA+B07hT33QZraATAadKuIpeha/rydmIvG5T9Op0D
         xpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712162454; x=1712767254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCwOvHHBeDAVg7t0yiuTvdHab5hO/wO4nlgyO6C8dm8=;
        b=jrp6YbewFaguKL3DSXOEjkemq4hs+sQLKQAN6rYKgWiZGClQU2vL2S+dOlBkhW/vvt
         QV3dAh1t431bn39sp2IGxZmiNpJImIVfFAEjJ5Ln9xjgZplyz2ttGwx2UEr38xjpe7eE
         X/uN1Qnzxs796ka+eNbXwVRTr85pUkzj/hWtaow9Lb5jIZhB30+AZH/3yHAdYrYvec9J
         Hz9OWyxye8j5eBV2F6OzXB1PKKUVzES1fqCsO7u9u3VH/gPl37iGLQp/N9FxQKA/W5Bn
         CHE/A8eF2eI6FCBCEZXup0f/1z7tcD/r0AnFNKXDxXZnIGAr1GCvt+mC2ykQgi2oKhCi
         ULyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJUEiVJxOCxd18D74ydA3AK7g/4qZpi6A5TrnHh1vnYXe7odukYlYA+ENKNeUWOf3ipBQLATu0nnrVtVQp5oLMVy3u9VKS6qaeLMJ1Vfqt
X-Gm-Message-State: AOJu0YwuVdOtVu6RWw123UaFt75/TgnZt4sauawNl4AZzjWYFyFKFsjF
	FBR7rHRPIQE58fLpXgdsIyZi1JN4hLIOqUB6GyFK7IdL0pJ8x2e3+xk5krBqvK78GGvwW8tdvUd
	UgqG5wFlcMM33q4APVTkEmVZYeS5j+Vc7dudakg==
X-Google-Smtp-Source: AGHT+IGHPm7ffhPe8pZkKaZvWBW0C6h8EEFFZFusyMhZqYoJfGpMzZ7qv6Tcy3EomRnDJsyrsSP/KS3RGNa+L7kykE4=
X-Received: by 2002:a50:d754:0:b0:568:9f77:9c0 with SMTP id
 i20-20020a50d754000000b005689f7709c0mr3212183edj.4.1712162453580; Wed, 03 Apr
 2024 09:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
 <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com> <CANLsYkz674p_HBq3tNuEi=65z8K7KTzNH8S-W29SpXspq8U=gA@mail.gmail.com>
 <ZgxI3qH5lk5yS+RU@kudzu.us>
In-Reply-To: <ZgxI3qH5lk5yS+RU@kudzu.us>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 3 Apr 2024 10:40:42 -0600
Message-ID: <CANLsYkzX50KzxVytv8dTBbFg2=2gU=XvvRem6NcG1RX7MZY71w@mail.gmail.com>
Subject: Re: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
To: Jon Mason <jdmason@kudzu.us>
Cc: Ross Burton <Ross.Burton@arm.com>, Jon Mason <Jon.Mason@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Apr 2024 16:40:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5509

On Tue, 2 Apr 2024 at 12:05, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Apr 01, 2024 at 02:27:42PM -0600, Mathieu Poirier wrote:
> > Hi Ross,
> >
> > On Wed, 27 Mar 2024 at 07:05, Ross Burton <Ross.Burton@arm.com> wrote:
> > >
> > > Hi Mattieu,
> > >
> > > On 26 Mar 2024, at 20:20, Mathieu Poirier <mathieu.poirier@linaro.org=
> wrote:
> > > > +SRC_URI_RMM     ?=3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rm=
m.git;protocol=3Dhttps"
> > > > +SRCREV_rmm     ?=3D "0a02656945d69757b0779192cebb9b41dd9037d1"
> > > > +SRCBRANCH_rmm     ?=3D "main"
> > > > +
> > > > +SRC_URI =3D "${SRC_URI_RMM};name=3Drmm;branch=3D${SRCBRANCH_rmm} \
> > > > +   file://0001-build-lib-Add-extra-repositories-for-system-include=
s.patch \
> > > > + "
> > >
> > > Is there a good reason for all of this indirection?  If you want to s=
upport building from a local source tree/fork, there=E2=80=99s a class that=
 does that generally (externalsrc).
> > >
> >
> > I have addressed all your comments except the one above related to the
> > externalsrc classe.  What I currently have in the recipe follows what
> > is found in trusted-firmware-a and trusted-firmware-m.  Moreover, the
> > documentation in the externalsrc class mentions it is to "build a
> > piece of software rather than the usual fetch/unpack/patch process".
> > But for RMM we need to fetch and patch...
> >
> > I am puzzled as to how to proceed - can you provide more details on
> > what you expect?
>
> IIUC, he is saying the above should be:
>
> SRC_URI =3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=
=3Dhttps;branch=3Dmain \
>            file://0001-build-lib-Add-extra-repositories-for-system-includ=
es.patch \
>           "
> SRCREV =3D "0a02656945d69757b0779192cebb9b41dd9037d1"
>
>
> All the "_rmm" indirection is only needed if you are going to have
> multiple sources.  Since this only has one, it just adds unnecessary
> complexity.  Similarily, the "?=3D" is only needed if there is going to
> be an override of the values in those fields.  Since this is all in
> one file and nothing is referencing this file, this shouldn't be
> neessary.

Ok, but in my case I have a .bbappend file that does the following:

SRC_URI_RMM         =3D
"gitsm://git.codelinaro.org/linaro/dcap/rmm.git;protocol=3Dhttps"
SRCREV_rmm          =3D "3212a781573db80df815db4b0e493c87f734840c"
SRCBRANCH_rmm       =3D "rmm-v1.0-eac5"

Should I keep my current solution as I submitted it, keep the current
solution but get rid of the {_rmm | RMM] or use what you have above
and redefine SRC_URI and SRCREV in the .bbappend file?

>
> TF-A and TF-M are based on ".inc" files that can (and do) have
> multiple "versioned" files.  For example,
> ./meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
> ./meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb
> ./meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.2.bb
>
> Each one of those is just the minor modifications to get that version
> working, with a core ".inc" file doing all the work.  Since rmm is a
> more simple recipe, none of that is needed here.
>
> Thanks,
> Jon
>
>
> >
> > Thanks,
> > Mathieu
> >
> > > > +RMM_CONFIG ?=3D "qemu_virt_defcfg"
> > >
> > > The =E2=80=9Cdefault=E2=80=9D isn=E2=80=99t qemu, as that isn=E2=80=
=99t useful for anything but qemu.  A better solution would be:
> > >
> > > RMM_CONFIG ?=3D =E2=80=9C"
> > > RMM_CONFIG:qemuarm64 =3D =E2=80=9Cqemu_virt_defcfg=E2=80=9D
> > >
> > > Also this recipe needs some COMPATIBLE_MACHINE statements, so that a =
world build won=E2=80=99t try and build it for eg qemux86-64.
> > >
> > > > +B =3D "${WORKDIR}/build"
> > >
> > > cmake class sets B already, remove.
> > >
> > > > +# Supplement include path
> > > > +EXTRA_OECMAKE +=3D "-DCMAKE_INCLUDE_PATH=3D${WORKDIR}/recipe-sysro=
ot/usr/include"
> > >
> > > -DCMAKE_INCLUDE_PATH=3D${STAGING_INCDIR} would be neater, but this re=
ally does feel like a bug in the CMakeLists.txt.  Why doesn=E2=80=99t it re=
spect the sysroot that the compiler is told to use?  We carefully configure=
 a toolchain that specifies exactly what compiler, sysroot, flags, etc to u=
se.
> > >
> > > > +export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> > > > +export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d=
, False)}"
> > >
> > > CMake class should be doing this, remove.
> > >
> > > Ross
> >

