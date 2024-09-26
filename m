Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC7ECDE024
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 16:35:37 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.48453.1727368531590788948
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 09:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=QGMAP8Pn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.42, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-28706be9bd7so290210fac.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 09:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727368531; x=1727973331; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKr63cB6lXKgY6FoIJC6feiViceMfqFEZZtp5pnp90g=;
        b=QGMAP8Pncjt+z3df0u+8LdayJdn32P2t0AGNp3iFRk+tDdDFA55xS5N24hbY+B70sa
         8GQ1M7yDvSKRFDYdFn0AbXW9n/UNB5XecOYwDLF1X6CMMAJ4VNdI+hEl1ZN36r3RxAqU
         5R+AO8nFM3z3aPF5tdzT9wV9y9qCYA2WIV/T81Q5t9nhh8qB2j8WRVyOFnhhtWvR8Q8E
         Iku+KrHPeIq3rl2PvxbqwTuSkqCoKe2/HM6cjs4q3kkpCKmTUnBXVFK3daDSApj9EWFo
         pLDDl2nvg2HIgfrx1IOW6InavwNhd+GyIq+ktqCe0lcHzw1md4n1RwBW5VYDp55US2wM
         uHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727368531; x=1727973331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKr63cB6lXKgY6FoIJC6feiViceMfqFEZZtp5pnp90g=;
        b=o7An3E+FSK4/oa7cI8ORaw4d/Zad3tXn6Rj2sB4pcXePGj+u+ExTFw7jt7KnA3V26q
         8v9syqGwbiH+waGBZGeEnljr/sTbKdb1Z0pRavTvTvvJeSAFh/CSGTSoPBmRZ9JKcyoN
         lT2JKnM89neTalmW9quVcgZ7QaZJwTOam0Vx+xJ2mUyxSV5jd4zzHWeifwPbHknSUeZp
         t6zw7CiMiE6M4tecT4UTJHbc9Cnzd+GWP/timklQw8otN9hMaXP5xFJoBMltR0JqD4NX
         hWRLAMZ4yHmTu1ObizlAHUvPC5SswGM555iKV1dz5wcoZv7bGsGIFkmUO/4OKcSbRla8
         uQHA==
X-Gm-Message-State: AOJu0Yxt3msQoZhFa2r0QwtyD79wm224RdXf3ea6zXSb8IWEBhBeuvNi
	rboR+n2EoCq0EFaTJPx8vVCiD+d5suI5ayeBLYZI2NFcoycjwnfFuLPm0xCkX5paBNxxm0IrL6F
	uWSVGxDMEd8/h+bhzPuDy2quBHtr5Wf1Wx1ZrqjgT7Xrthjg=
X-Google-Smtp-Source: AGHT+IHglUEllGsEfMR6rHvgJtp8D3RuMytYVCJflggePohN9xh4qEw5mtHmIlrCwrcLP/s+gzFFtSV4Wu+twYTSs3M=
X-Received: by 2002:a05:6870:3b86:b0:277:d995:423b with SMTP id
 586e51a60fabf-28710abaddcmr529246fac.24.1727368530771; Thu, 26 Sep 2024
 09:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240926154739.2379609-1-jon.mason@arm.com> <a44c39f0-4282-4438-a3d6-c916dbcb28c7@linaro.org>
In-Reply-To: <a44c39f0-4282-4438-a3d6-c916dbcb28c7@linaro.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 26 Sep 2024 12:35:19 -0400
Message-ID: <CAPoiz9zk+1z-Pa3+x-2z-Ec2ZPDiuRR7UDAQaPAByJOAr43k=w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v7 0/4] UEFI secureboot
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 16:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6124

On Thu, Sep 26, 2024 at 11:55=E2=80=AFAM Javier Tia <javier.tia@linaro.org>=
 wrote:
>
> Hi Jon,
>
> On 9/26/24 9:47 AM, Jon Mason via lists.yoctoproject.org wrote:
> > Sending a modified version of Javier's patches, combined with a subset
> > of the patches sent out by Mikko recently.  This was done to expedite
> > the acceptance of this series (given the code freeze tomorrow).  Also,
> > the optee update that Mikko's series included cannot be included (given
> > the code freeze).  2 of that series are needed for this one.  So,
> > combining everything into this and sending it out publicly for Javier,
> > Mikko, and anyone else to ack/nack.
>
> Thank you for sending them ahead of me, as I was just preparing the cover=
 letter to send them out as v7.

Sorry about that.  I'm very eager to get this in (as I'm sure you are
too).  It's in master-next now

>
> > Thanks,
> > Jon
> >
> >
> > Javier Tia (3):
> >    arm/optee: Add optee udev rules
> >    arm: Enable Secure Boot in all required recipes
> >    arm/qemuarm64-secureboot: Enable UEFI Secure Boot
> >
> > Mikko Rapeli (1):
> >    arm/optee-client: fix systemd service dependencies
> >
> >   .gitlab-ci.yml                                |  1 +
> >   ci/uefi-secureboot.yml                        | 37 +++++++++++++
> >   meta-arm/classes/sbsign.bbclass               | 31 +++++++++++
> >   .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++
> >   .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++
> >   .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
> >   meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  2 +
> >   meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++
> >   .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 52 ++++++++++++++++++=
+
> >   .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
> >   .../systemd/systemd-boot_%.bbappend           |  1 +
> >   meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
> >   .../recipes-core/systemd/systemd_%.bbappend   |  1 +
> >   .../linux/linux-yocto%.bbappend               |  2 +
> >   .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++
> >   .../recipes-security/optee/optee-client.inc   |  8 ++-
> >   .../optee/optee-client/optee-udev.rules       |  6 +++
> >   .../optee-client/tee-supplicant@.service      | 10 ++--
> >   18 files changed, 272 insertions(+), 5 deletions(-)
> >   create mode 100644 ci/uefi-secureboot.yml
> >   create mode 100644 meta-arm/classes/sbsign.bbclass
> >   create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
> >   create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot=
.inc
> >   create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot=
.cfg
> >   create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
> >   create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
> >   create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-se=
cureboot.inc
> >   create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbapp=
end
> >   create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
> >   create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
> >   create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-sec=
ureboot.inc
> >   create mode 100644 meta-arm/recipes-security/optee/optee-client/optee=
-udev.rules
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#6117): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/6117
> > Mute This Topic: https://lists.yoctoproject.org/mt/108670112/7165667
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [javier.ti=
a@linaro.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> =C2=BB Javier Tia =F0=9F=96=8B

