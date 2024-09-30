Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B718CEB2CD
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 23:02:25 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.68673.1727737343610394950
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 16:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LR4gzC4m;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.46, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-286f0dcead5so3190762fac.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727737343; x=1728342143; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leEbPIinJXApjVot2ynxnnjdPBo16HrLUHUOPK65MrA=;
        b=LR4gzC4mb5pWOst2WT9SsyGrYC1ik6WuPsl83WtJ9aqp2RX2Iha+afiP3Lkd6DgsNY
         nX9SEEcW9FhiWwrNbtBuv+GpwR8qR4jdvt/p/S0Eq6wpmvmsusdVxLr5jOuUHYr+GeWG
         pIuIVNKDs9H6D52QeCYxshR+bRPnYfRQTTyZVMm99SNVp7YVgrpNppsYsQElcK7/KEAK
         vQSVc4rh9ypFycZqlSlmYZ9QgPTBVYI62F7xvSrQVg5MIVN2XiCeEcINjUU4TgHf3gAz
         H/gB5dXWyznpKWUIK59E2zAEegpDeYcmbGh9g7RkvflhndsgDlbM5/ZP5TjKVMHlzhAc
         wCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727737343; x=1728342143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leEbPIinJXApjVot2ynxnnjdPBo16HrLUHUOPK65MrA=;
        b=QwRc9AjxmEK/meU0fHg5p+/aEUBBhrVf7Wig13WIGJvSr4uFNPt3uDC+aDXryi6/Yb
         btiAtFVQAA6RKQeN9oOAJJbQR+/sY0KAHY43YaVHV1M5cEbVBNdNsmqfSV32degJHtr1
         xe3hFFnHmPSgREoLI3rNHezZH9n6O4T9VzkjwSK6/m4L1xXYZQjRJbbUiCSQ0BdCd6h4
         Lg1jc0SMgXTSJN/6ESmHqVtst41bOCsRGryrc6Xl5WYzDy1ExiRVxO53N4fQUNcUUsii
         1hMGplm2Ug2cqkau413aZu1wjbOlIGfzXLkzGjtVausyarP8LbMrzj7Xin0TT12maPSp
         3UMw==
X-Forwarded-Encrypted: i=1; AJvYcCWlN/1lqrqzSGWcAI1eisyjbMhR3KI2t9kB5khaYtqNpXaYtiYdZZKYtOALRELU6SIhrFomN/qcVA==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyMllre2mQ7qGekGqT5g52QBm+LdhVooCLMxuVfML3R1pOPmeIO
	4WU0hYoal4X8YVF4LdzJpu65wNf5waYehMJupMrysfAhZNWj71hRfu1RmPg2j08608KWytfetG2
	+m3R4MQyjgZWrpvc5tG2V53hs8olSRKLsKPQh
X-Google-Smtp-Source: AGHT+IHalLbW9XjT17DSiOu25ZmO5WUYxbLLsbWC6o/verKpugRTREH6z6wPMSLQTXo/fc8wzb6R47G9j7+RowYvDkw=
X-Received: by 2002:a05:6870:1c7:b0:267:af82:431b with SMTP id
 586e51a60fabf-2876e4d9b59mr597525fac.21.1727737342729; Mon, 30 Sep 2024
 16:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240928155436.1145975-1-radian.dc@gmail.com> <ZvqvFhYoRXQ9RQ4H@kudzu.us>
 <7afc0d4f-cf91-4750-93a3-3fc9c9a1b364@linaro.org>
In-Reply-To: <7afc0d4f-cf91-4750-93a3-3fc9c9a1b364@linaro.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 30 Sep 2024 19:02:12 -0400
Message-ID: <CAPoiz9xr1DyEP-XWCRK_uhShDbb0kRrfcw8V8PL_CGwcCAP2PA@mail.gmail.com>
Subject: Re: [PATCH] trusted-firmware-a: fix build error when using ccache
To: Javier Tia <javier.tia@linaro.org>
Cc: Adrian DC <radian.dc@gmail.com>, meta-arm@lists.yoctoproject.org, 
	Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 23:02:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6151

On Mon, Sep 30, 2024 at 6:47=E2=80=AFPM Javier Tia <javier.tia@linaro.org> =
wrote:
>
> Hi,
>
> On 9/30/24 8:00 AM, Jon Mason wrote:
> > On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:
> >> From: Javier Tia <javier.tia@linaro.org>
> >>
> >> When ccache is enabled trusted-firmware-a recipe fails with this
> >> error message:
> >>
> >>      make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.
> >>
> >> ccache prefix CC variable with 'ccache' word before compiler. Because
> >> there are no quotes assigned to CC, only 'ccache' is assigned. The
> >> compiler becomes a make target, producing the build error.
> >>
> >> Add single quotes to LD is a good measure to prevent this kind of erro=
r.
> >>
> >> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> >> Signed-off-by: Jon Mason <jon.mason@arm.com>
> >> Signed-off-by: Adrian DC <radian.dc@gmail.com>
> >
> > I have questions about this patch's origins, given the above s-o-b's.
> > Signed-off-by's state an authorship or handling (see Developer=E2=80=99=
s
> > Certificate of Origin).  Since I have not seen this patch, I should
> > not be listed.  It's on me to add my s-o-b.  Also, the ordering tends
> > to matter, as each person handling the patch adds their s-o-b at the
> > end of the patch.  So, you should be second, since you are taking this
> > from Javier and submitting it for him (nd I would be last since
> > I'mtaking it from you).
> >
> > Also, this feels like it needs a "Fixes:" line.  So, I know how far to
> > pull this back in the stable branches.
> >
> > Finally, I find it weird that Javier isn't submitting this himself.
> > Javier appears to be the author, and it includes his Linaro emaila
> > ddress, and you are sending it from a gmail account.  Are you
> > co-authors?  Are you sending it with his approval because he is
> > busy/vacationing/ill?
> >
> > Overall the patch is fine and I would normally include it, but this is
> > weird to me.  If Javier acks it to confirm his authoer, then I'll move
> > my s-o-b to the end and include it.
>
> Oh, this is a surprise.
>
> Jon has a good point.
>
> I have not approved sending this patch on my behalf. Yes, it looks like I=
 am the original author because I recall fixing some issues around ccache a=
 time ago; maybe last year if I remember correctly. But, before I acked it,=
 I would like to know from where it was taken to have a bit more context. U=
RL? Was the patch accepted or rejected?

I think I know what might've happened.  It's already in the tree
(commit f2efb2a45610216cb6c2d72bdb5d5e61b990064a).
I'm guessing that Adrian accidentally sent it to this list while
trying to backport it to an older release.  I got overly concerned
with the s-o-b lines and didn't think to check what it wasn't applying
:)

Anyway, I think we can disregard this.

Thanks,
Jon

>   >
> > Jon
> >
> >
> >> ---
> >>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++=
--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> >> index 2e3b50c5..5d3da59b 100644
> >> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> >> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> >> @@ -101,9 +101,9 @@ def remove_options_tail (in_string):
> >>       from itertools import takewhile
> >>       return ' '.join(takewhile(lambda x: not x.startswith('-'), in_st=
ring.split(' ')))
> >>
> >> -EXTRA_OEMAKE +=3D "LD=3D${@remove_options_tail(d.getVar('LD'))}"
> >> +EXTRA_OEMAKE +=3D "LD=3D'${@remove_options_tail(d.getVar('LD'))}'"
> >>
> >> -EXTRA_OEMAKE +=3D "CC=3D${@remove_options_tail(d.getVar('CC'))}"
> >> +EXTRA_OEMAKE +=3D "CC=3D'${@remove_options_tail(d.getVar('CC'))}'"
> >>
> >>   # Verbose builds, no -Werror
> >>   EXTRA_OEMAKE +=3D "V=3D1 E=3D0"
> >> --
> >> 2.43.0
> >>
> >>
>
> Thanks,
>
> =C2=BB Javier Tia =F0=9F=96=8B

