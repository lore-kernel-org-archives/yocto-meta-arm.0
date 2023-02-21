Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E93C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:23:26 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.39333.1676975004642307941
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 02:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dfMgtDx4;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id w42so3802138qtc.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 02:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKyY1AOjlYIifFvYFX5Oe8xtIDt0fwWM4ArOcPoHx3Y=;
        b=dfMgtDx4PuNuBOl4VABBNVfEE8b+YKZBBIg2ubvQS7mG87i3LGNrWKSC9Xh9DqPSHI
         facMr339OK+5iZDowlZ+ar8bXhBeOACIS4dSCeeBuKRdKx2uQ+ytnFL15JQ69NsvlMd3
         t3Y00UJRfchKtouMgH5r1kOg33b+7Ra2emLbo7BkAMrOK/MzkT0bC16QMDvegPPYeO37
         ftVPTfdCT4SVsqdnFZ0GH3kBNGOJqsYnp1FBtQIxFC4P4aRoX6eJ4ZMduB8BaXunR5ar
         xf23LcZSV8jNckaNfPJF4Fgwh4IhzyrDtKTnkll44kKVcGnxunKhZB8TNXztkyadhLjb
         BRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKyY1AOjlYIifFvYFX5Oe8xtIDt0fwWM4ArOcPoHx3Y=;
        b=RTA5ODhIYrIPLrGxqL8ZlivId20i0nutBZQvp/q/5/pLsUFz+DPwro4MdwMbcysl0W
         J+AIn6ZI1DnUTbgliqWoxnNzMyqp/9NSHqgaz9GHU8EUyHTq8qHUqY4wNX4r2IreyQNh
         M26tF7P6NsC7YVF6GwkWSCtrej45jE1SJ/HWjaYW982iGgm7UfGDfSQRiR1ngmxjitG7
         5prfq5H75O8HGImJHwjKnt06Ay6Hke70l0XRW7lcsIZgFEBbJjdDCkLr9HcoJi2e0Lez
         G2cQqnciTsFWnLeSzqGz7WYDGHC5m5NxSwH4swh/w7uyqIX6/MoPJkf5e778PnV9UMU5
         JJTg==
X-Gm-Message-State: AO0yUKWwHCtzPLzqhX/lkRppmZ5x8eRhWG0MyRlU5F3WXkp9MRPzf2Aw
	rjwCCCkx5VfiLXpKPCApTqI1kcJIBKAEzfVNOiE=
X-Google-Smtp-Source: AK7set+dZLX7iP3pGtHj+e2mj7czegA4xhiiAPzBRJCULVgE/bTPhHcXi5bkvgRfzKycVdQBGlF3sgs7QoowLQ1XTbI=
X-Received: by 2002:ac8:4997:0:b0:3bb:92c4:9441 with SMTP id
 f23-20020ac84997000000b003bb92c49441mr483257qtq.13.1676975003576; Tue, 21 Feb
 2023 02:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20230207151952.94769-1-peron.clem@gmail.com> <485A1B59-6AC8-4439-AB6F-F9CCFA445706@arm.com>
 <Y+purpuFMnQrBaDH@kudzu.us>
In-Reply-To: <Y+purpuFMnQrBaDH@kudzu.us>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 21 Feb 2023 11:23:12 +0100
Message-ID: <CAJiuCcfECE474dGG-2BF+_Y19E31NH9t0T1RqqOb7aK_QXcAeg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator-daemon: bump to 8.3.0
To: Jon Mason <jdmason@kudzu.us>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 10:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4426

Hi,

On Mon, 13 Feb 2023 at 18:09, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, Feb 08, 2023 at 01:31:54PM +0000, Ross Burton wrote:
> > On 7 Feb 2023, at 15:19, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject=
.org <peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > +DEPENDS =3D "boost libmxml protobuf protobuf-native"
> >
> > This does mean that the CI needs work because libmxml is in meta-oe, no=
t oe-core.
> >
> > For example, https://gitlab.com/jonmason00/meta-arm/-/jobs/3735010875
> >
> > Ross
> >
>
> I tried adding ci/meta-openembedded.yml to ci/base.yml to see if that
> would be sufficient to get this patch working, but I'm seeing another
> issue:
>    None of the required 'mxml>=3D3' found

I tested on hardknott but indeed in kirkstone it failed due to missing
a DEPENDS on pkgconfig-native to allow cmake to find the mxml lib.

I will send a v2.

Regards,
Clement
>
>
> Thanks,
> Jon

