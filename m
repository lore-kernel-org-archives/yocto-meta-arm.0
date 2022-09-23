Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADBBC54EE9
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 01:21:39 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.2860.1663896092691236866
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 18:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=owQjgg01;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1279948d93dso16351176fac.10
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 18:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=y9DFIucqmbgcYyegdnpb9hfwLmY6P/lXm3rJY7X8w70=;
        b=owQjgg011+Z8mG6L8pCydjUujw5vyzn0M7ox9J/z+kkz5hvj3GOWkolDsUh9WSFWX0
         JNdUiUykUJTC775aQruOXhz+PLO35y5M0Kq1+POupTe2Jh0AAYXbkoVx8BFsxE+cpPhV
         lG7GomwBBKb48RggHyaAx01XZmm8gpBiyTuZVipewP3abxh9/V+faaQ2P6sPccdXxzYU
         ibA7e9OHFLbdUMsVnGysViHNUqU916d16MMezJZu6j/xQRjyCZE9kTG46oH7KEe124W8
         0ngzr6Z+iXqBCnkJ5BG8hw+r9L88ouLnYH40uXgs9KWd5kXBpoLdP2uZQFLUlIJGXpxU
         rQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=y9DFIucqmbgcYyegdnpb9hfwLmY6P/lXm3rJY7X8w70=;
        b=rw9ngRumq0T63Usa5iQELhFxAQaGICQ7wS9uNP89B6gh4pHiUD4GqEIA5rZlpK60Tj
         GMgfCR4/nlztyN750PbcytD5EufdqY8YEO5CHgkWBMb6HoChPYB8SQNLYi9QhqJq735a
         Hx904NpPBbN8j2/vEJpN8lMBj3/6BLT93Sb5cNNjuaAmDAD/v0fcv39Vx48Ki7I0UtG0
         kO37U/j5d/rsuJdo7k/MoA+tsQ863EM8NbCcodeKjM9Xx+ZBJzJ9IVtSapF2pkhbE7T/
         MoKRX/IXMZOTZyZ19apHAP7L0h78+jJCr24tLTi86XgVrX3A9j9nOQ7MSKBk+49D6MAf
         5kng==
X-Gm-Message-State: ACrzQf1NT4lkX1SkCjq6B/BOGQPTyph+4pWG2W72kMqe6mOrrBWxJoAo
	lWT09c2PvdmuAesZYcsEGaaTgnJK9Gbk/0E+J5E=
X-Google-Smtp-Source: 
 AMsMyM6yDMWkRhA7kC7N5uKpK0XGmxCYI8vNR8JikgmZpovEmMLBuwWHOVoLLtLJ7IZBNPlV1n6yiyvuHG1CRwYRWqI=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr9757082oae.262.1663896091966; Thu, 22
 Sep 2022 18:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220922005409.3378701-1-raj.khem@gmail.com>
 <20220922005409.3378701-3-raj.khem@gmail.com>
 <Yy0AlN5vMSG63Ndd@kudzu.us>
In-Reply-To: <Yy0AlN5vMSG63Ndd@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Sep 2022 21:21:06 -0400
Message-ID: 
 <CAMKF1spyftmqJ5KUMOnJAUct7n__EXdQPsrA4gTDqpe2eazB=g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] linux-yocto: Add bbappend for 5.19
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 01:21:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3815

On Thu, Sep 22, 2022 at 8:40 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, Sep 21, 2022 at 05:54:08PM -0700, Khem Raj wrote:
> > Enable tee and arm-ffa driver on qemuarm/qemuarm64 by default
>
> Per Anton's comment, I don't see why this is necessary for
> qemuarm/qemuarm64 by default.  Can you explain a little more please?
>

since meta-arm has these kernel module recipes which fail in world
builds. We can also do it other way
where these modules are excluded from world builds and then we dont
need to enable them.

> Aside from this, the series looks fine.
>
> Thanks,
> Jon
>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Rebased
> >
> >  meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
> >
> > diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
> > new file mode 100644
> > index 0000000..7dec2f5
> > --- /dev/null
> > +++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
> > @@ -0,0 +1,9 @@
> > +# enable arm_ffa regardless on 5.19
> > +SRC_URI:append:qemuarm = " \
> > +    file://tee.cfg \
> > +    file://arm-ffa-transport.cfg \
> > +"
> > +SRC_URI:append:qemuarm64 = " \
> > +    file://tee.cfg \
> > +    file://arm-ffa-transport.cfg \
> > +"
> > --
> > 2.37.3
> >
> >

