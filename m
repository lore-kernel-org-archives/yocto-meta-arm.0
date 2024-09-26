Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0ACCDE025
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 16:37:38 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.48656.1727368650286255581
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 09:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=JOhReZVf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.41, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e1b72fc5f3so636272eaf.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727368649; x=1727973449; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ezgj9duKRSxKhsERlqZnD7GmYatKq5HAsRWYxl9TGNM=;
        b=JOhReZVfIsQ4RfH3ZMu+Ov5NJr0Uw1kYfFKNwDHfvlZ9mOF4vRDyrb8b8737ETs6DB
         NCH4SARX85Rrst8lX92CSJk99nudeJA5nOhga4/+NebCtVM1fhQ5NOAI7ZbnYNYYVj2y
         3iF1P7tHrE0rhmIZCpkSmuGsrfs4saVYsR45xaXE5ksOxrb6uDCFzrbZ4mWzvy+ePjm9
         pYyD3BZsX/De9y+URIC0n5bdQy7wsi3YoJ3S0LD6xLx+5fLGukrG5rMa1RNADE/RmsGS
         IIci+P5N8HqciACJjlkJzRuEm5I/89phMdUyLV4awEd2z7rF+RSnGJzkIx5Tdr8dctsE
         UIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727368649; x=1727973449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ezgj9duKRSxKhsERlqZnD7GmYatKq5HAsRWYxl9TGNM=;
        b=lPalQcB4q6Cc2DqJ0vGl1Vqwv5hqJs0JIlAEp6xGd1BO5A3WZgxiTkT7wVab2srxPh
         nQnGml5Oc6ZjiVKDso5TSoZiuLWrx+qY2LMesSlgNCX5PU875iN11eQY9tliyzOlXnfA
         7DCdR+xRmOKXeY0F5Qg2mlRdYX4TPYpgbHfQScwZS9WrAS3ZvIvgSC32MRHKmrVAEtZQ
         lxYh8AYy95RFr53TkrcjxqAdv6bRWXk/p23gesN1xQ55+gt+Vhgb+jHAR1cC6eWiZ0I2
         Kpi9cJY85quYFJAa8cYpgphtV/3wzjLfgFxiPAdAfe5et6sd2pSAl2k2a02gT0w6Twrh
         4+bA==
X-Gm-Message-State: AOJu0YwGPvpomCVX2AYu3Xmpj8ScENnbBjXQGL8SEPZ40YF0hj6lftqP
	XWTWqS/AP9hqe1z3G15KQKvyc2FN/V9rhXxQq1ScczpwZBRWBS3w+9Hp7sfv5g6+W76cRQ8wrJi
	+FnVDn99RUxqqmkYSGQp/ahyCK0+mhtMtBuZhKv8/Xq0HNW4=
X-Google-Smtp-Source: AGHT+IFwbBIyYIxY5H9EUF75tgzy1Wb2kN8VEEkVG3zxsjwX1C2OXCzIMSgOpgW7u9/Z+ZyvdpfF32F0uueW3fXbT54=
X-Received: by 2002:a05:6870:8993:b0:270:c1e:41ad with SMTP id
 586e51a60fabf-28710ba72a0mr540901fac.35.1727368649542; Thu, 26 Sep 2024
 09:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240926154739.2379609-1-jon.mason@arm.com> <ZvWEmMhzov6EiJET@nuoska>
In-Reply-To: <ZvWEmMhzov6EiJET@nuoska>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 26 Sep 2024 12:37:18 -0400
Message-ID: <CAPoiz9yF2vvtrZrYSgnGvbjDET4bypjRRjfkky00=XqiT7qVmg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v7 0/4] UEFI secureboot
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 16:37:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6125

On Thu, Sep 26, 2024 at 11:58=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.=
org> wrote:
>
> Hi,
>
> On Thu, Sep 26, 2024 at 11:47:35AM -0400, Jon Mason via lists.yoctoprojec=
t.org wrote:
> > Sending a modified version of Javier's patches, combined with a subset
> > of the patches sent out by Mikko recently.  This was done to expedite
> > the acceptance of this series (given the code freeze tomorrow).  Also,
> > the optee update that Mikko's series included cannot be included (given
> > the code freeze).  2 of that series are needed for this one.  So,
> > combining everything into this and sending it out publicly for Javier,
> > Mikko, and anyone else to ack/nack.
>
> ACK, optee 4.3 stuff later then.

We'll probably create a styhead branch soon(-ish).  Once that happens,
I can apply the other patches from that series to master-next.

>
> Cheers,
>
> -Mikko
>
> > Thanks,
> > Jon
> >
> >
> > Javier Tia (3):
> >   arm/optee: Add optee udev rules
> >   arm: Enable Secure Boot in all required recipes
> >   arm/qemuarm64-secureboot: Enable UEFI Secure Boot
> >
> > Mikko Rapeli (1):
> >   arm/optee-client: fix systemd service dependencies
> >
> >  .gitlab-ci.yml                                |  1 +
> >  ci/uefi-secureboot.yml                        | 37 +++++++++++++
> >  meta-arm/classes/sbsign.bbclass               | 31 +++++++++++
> >  .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++
> >  .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++
> >  .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
> >  meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  2 +
> >  meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++
> >  .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 52 +++++++++++++++++++
> >  .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
> >  .../systemd/systemd-boot_%.bbappend           |  1 +
> >  meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
> >  .../recipes-core/systemd/systemd_%.bbappend   |  1 +
> >  .../linux/linux-yocto%.bbappend               |  2 +
> >  .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++
> >  .../recipes-security/optee/optee-client.inc   |  8 ++-
> >  .../optee/optee-client/optee-udev.rules       |  6 +++
> >  .../optee-client/tee-supplicant@.service      | 10 ++--
> >  18 files changed, 272 insertions(+), 5 deletions(-)
> >  create mode 100644 ci/uefi-secureboot.yml
> >  create mode 100644 meta-arm/classes/sbsign.bbclass
> >  create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
> >  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.=
inc
> >  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.=
cfg
> >  create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
> >  create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-sec=
ureboot.inc
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappe=
nd
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
> >  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secu=
reboot.inc
> >  create mode 100644 meta-arm/recipes-security/optee/optee-client/optee-=
udev.rules
> >
> > --
> > 2.39.5
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#6117): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/6117
> > Mute This Topic: https://lists.yoctoproject.org/mt/108670112/7159507
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [mikko.rap=
eli@linaro.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

