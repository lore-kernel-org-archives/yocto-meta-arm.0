Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9856DC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 13:55:02 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.225.1784728493251014595
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 06:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=yBgsHLK4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.47, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43cce34c881so5193272fac.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 06:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784728492; cv=none;
        d=google.com; s=arc-20260327;
        b=Rk1PW7YvfKWG7qrP7BniSqrp+3CA9Hs4DBVv2ZQfLcGwEuCYuX26QPT/KcwvcY6/Oc
         yF3phhIPtgn05UEYSHIgSkXxO/4ZaJ89bIcx0aX8WQ3AhCZCoB36PRfdKwV59N22XO4k
         2iMJj4FLUAdsrvjYZ1b2deL/DOVTDCda1r8XwjpJ0kwp5TxZkxZMnYEG1r9htjTH2FL4
         Lz3pjFzZ8rG97L/s2H8kY73aSEwq5Rc980cmPd0jawaK7dWnsmUIAp8oBfgBo1lH80h+
         x7OLhRiQWM5Xw0+j1GqpR8nRcloKl+p1ZaLJephlmR48BXnAOj9SPzdiq3s+PYl+w2EO
         CXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uHRvwyATJ6YOlsBMwWiCNCUX2/4bTAmHvu7IdKtf80g=;
        fh=Fa+beKWhJ+VIvY7wGqtST0E+Pz219SUFTWrt3wWX0ME=;
        b=A70LZCGmSg6lWrn67eRW20KBzUEDfZT7mh43ZSJ7pgU2koqNIuiNCwnzx5lf9g4xYp
         o80kz7k3/12x92eINO9pBoh0wTVRLgW+H6YRf2Nn5LXAGL8dyBGYCKUoVOS9H2CK65VV
         jZHQ4V4ttoBDOwoNFjhBvRNRRfrhhNm/BdhwdiWcQPyBLcie7UtWzx4G/6yCEqha/y1M
         r+0Io+ez4O5AFexsallj6hQwiIEAvNHF6KAU0CZ1ZG09TMIoFD2KVG27Z8S7Pbw2DWSo
         /403BYfwMm+qbTWS8FehTt3JCAniBur3KJhLl+jlz4VpD0AFXkO5gM/Ent9hB9bAYvX3
         EyjQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1784728492; x=1785333292; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uHRvwyATJ6YOlsBMwWiCNCUX2/4bTAmHvu7IdKtf80g=;
        b=yBgsHLK4HQNvEpr5hbBqYi4ZQcgKSpPp2Fy5PRnhj1tfra/riKNvlrweCZhhjon2sU
         43Yt2cxtIK+SFaInlrp5qelQVXwsLGPRsVr+0jcJlqyKIEN7rE0hn50lVASr+MI+6AcR
         TAdfnLAtykHeDVwtEwlOuKa+ZQbBKu6Dd0pOENjrmUp30UbW9xfDnXMpobeOKWR9aqdZ
         g/KV19aOaLCBVpfQoq5975BM6fnlLE+3hXNrumGOFxb2nw49cMnucZVDvZ2YVm61LZhi
         laW5Rk+eRgWATbJTnqhwAkVdy9TMbBC/oMD2OcV0Ty62ENe7Qa7VXstdqNWBpeZrDNSm
         nNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728492; x=1785333292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHRvwyATJ6YOlsBMwWiCNCUX2/4bTAmHvu7IdKtf80g=;
        b=fSPp87a96Q5wBLtfv5vtM9pRLyNHMJAHJ1cU0VjIfsdVOYf2bS8g4/iVfXnZS6RW06
         dAVEXK9gAKRbgPgBlLCmsUuHEV34K0OmvPszcvF86KvTUPbw6fBRGHrpWbUq8C1mzRhQ
         qAKiz8RW4PhaMuhNwvm7dTHcQgmPkU2LLbD1oDIzo3lRn4JSn92/xX6CpN9neE+DuWXH
         a9cOrjshLV7gbJIM5GB6bXp+48oqVzieb6RLGF0BZqYCnvz+OUVDbkjHuITZjpJ2tfxv
         uysoHxSSVo+bgaobni6jRwyvbVWSDBi0nSvPnyE1wb2nGHQXoZmvkcaRgCKhgJVax2Ul
         LO5A==
X-Gm-Message-State: AOJu0Yyz5P9BKxUHGS8yMgEH+85SwLl6EkM0I+yb42ILQPRVgksWhLRM
	C4qcy4xDfj+wlbMB5AKvOyANc773P/HFJLGZXHNUHNsq0mXiAIVmrT9WyZOBxU5KF1pVv8ZIjMe
	lTxCRy22+ie9/wB/8eQYvDbbvKi39s+V5tsb9NkrM
X-Gm-Gg: AR+sD12Ff1EpUiXrotN6ZxuNwPnAN7eZibnrpRl4y0g/e/M4zw1SwckMAj1co1aiynZ
	boy+LxyKnELlyw20OT9cpogg8X0afDNnjzTTXmmTww3DLtNyh4PGX+QCb6O0IZeHp60H0LhHuEp
	y6B5BB8JUpN1Khlro43MU0xbmpvDl5gKVfANbzjOWgfRgTxP6IqDwpwFl6ZEOEA10s8w1hFec3d
	AHwrMhR9Hk7dqlO5lLoLTWbhN+NGsMYdEs8/URdh+3/NDp/M/iYS6WfL3Eyxw==
X-Received: by 2002:a05:6870:e189:b0:456:ed5e:3536 with SMTP id
 586e51a60fabf-456ed5e414dmr7972767fac.41.1784728492315; Wed, 22 Jul 2026
 06:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260721130159.558910-1-ross.burton@arm.com> <178465938142.72400.7475289023349794901.b4-ty@arm.com>
 <20260721190233.GQ10186@denix.org>
In-Reply-To: <20260721190233.GQ10186@denix.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 22 Jul 2026 09:54:40 -0400
X-Gm-Features: AUfX_mwkPAT8zI_QrpN1J1LtPjyrVBaNjgCC2CosRI1qS956xhC9DcN7yvCLFfI
Message-ID: <CAPoiz9xAi5areusd=Ovy7fRxKkuxK3eufEy14hz29rKsDew6og@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] recipes: port LICENSE to SPDX
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 13:55:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7127

All of CI was red, and even my local builds were full of warnings
(making it difficult to debug the tests I was running).  I was
(over)eager to get it back to being sane.  Sorry about that.

Believe it or not, I usually let things sit on here for a few days
before pulling it in (unless someone is asking me to pull it in ASAP
for deadlines, etc.  and even then, I often push back).

On Tue, Jul 21, 2026 at 3:02=E2=80=AFPM Denys Dmytriyenko <denis@denix.org>=
 wrote:
>
> On Tue, Jul 21, 2026 at 02:43:01PM -0400, Jon Mason wrote:
> >
> > On Tue, 21 Jul 2026 14:01:59 +0100, Ross Burton wrote:
> > > openembedded-core now parses the LICENSE field as a SPDX license
> > > expression[1], so convert the license statements.
> > >
> > > This is mostly replacing "&" with "AND", but we can also use "WITH" i=
n
> > > the GCC recipes.
> > >
> > > [1] oe-core e9d424738d6 ("classes/conf/lib: Parse LICENSE as SPDX Exp=
ression")
> > >
> > > [...]
> >
> > Applied, thanks!
>
> What happened to review process and giving people time for that? Shouldn'=
t
> there be at least 24 hours given?
>
> As a matter of fact, I'm trying to confirm with Ross and Joshua that some=
 of
> the changes are correct (haven't heard from them for a few hours though)
>
> --
> Denys

