Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67CBC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 11:52:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.11872.1645530771669575492
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 03:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=yv0KMYy3;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id i19so11356713wmq.5
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 03:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17wlfpnkUKjlAIBHklVw7bTCdM+NZUCk+0QHm7JQivk=;
        b=yv0KMYy3X8mVs3YKvbpTvy05NFVU6ljd2rjhr0r5Yp0rNQ0pBY2fztqtp6eQN398dS
         HFqL1PVsY38Fv+vHnmeBSAftxVH4k7zayVuL5mZbk0VazDP6I1K73sSSonMpT6aP/uTp
         8dSUI3g1WO/CTksxnBW0BTyrHU1L1JeolorRmj5TOW1wDBxWCx/xWu9ZylBTUOxw9FF7
         4gXHfP6at12RTqIpGdC/kpC+5ORQNrZdr+RkH7RvNtcBtax5Vev+t8QqzISVI1up1lV8
         1IMAVjoHiRDhUc8MSDXYmMGB2qqIVgkOAjxp2za0zxs9BZBJK7D+J8rze4MORZ3HMtrR
         ix6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17wlfpnkUKjlAIBHklVw7bTCdM+NZUCk+0QHm7JQivk=;
        b=3LsMy9+p6IElMcpjytob8DdP028n6810x0xKTx/ESgg1cEEfSSLnKcGoD2xVRZMpc4
         uFXVmvwrarGhHvnYoPSBT6qxnSgZGnVw7ElFmWv95KO6QfoCuaSlyST0soySAtgqvzw8
         V2aGgE3LI7ogpzi56Cq0GNUix4BfTeKmAk618eK5SSPU8qMjpET6818tdjilQQPZ78Nf
         /vRtmEh8gyx9djp8o/mbAVlN9kJTVd1EUcQIMm1Tm58BYzQAHWap7Og8hLG32Og2VMeH
         gIzw5K6l8n07eJDuwOaRGMGSneawt5B+JASUkkOj5fm1/U9mtA/dlCvU5o0QQ+gW5/lW
         D8XQ==
X-Gm-Message-State: AOAM531KRCtGx28oZcxtlxjZhaTV/dEappowEiOFM5ODL6BE9QCMfMoq
	HzL+6kmM5z3j5BLuHSHv8fwQDrjLe3r8fbsrkkMIQMxBfV+GHg==
X-Google-Smtp-Source: 
 ABdhPJzO1XdFyo/GVPCkPtGlCsGrQB/U5yY0EmZGrwZ5bnwKNbv74sULa3IPGiaO9GZO7PZoHduoSOOPmgOXZdeKpn0=
X-Received: by 2002:a05:600c:4ec6:b0:352:cc24:1754 with SMTP id
 g6-20020a05600c4ec600b00352cc241754mr2977820wmq.184.1645530769795; Tue, 22
 Feb 2022 03:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20220216184220.3494070-1-raj.khem@gmail.com>
 <20220216185312.GP26229@denix.org>
 <CAMKF1spSUUVxamZz6CtVoKrr5q9pQ94qwTeXR11hMBrz4Sy_Xg@mail.gmail.com>
 <20220222023627.GM26229@denix.org>
In-Reply-To: <20220222023627.GM26229@denix.org>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 22 Feb 2022 11:52:39 +0000
Message-ID: 
 <CAAnfSTuV0EBoKb3AKjyTojR9JiKGu6=r6RAqx66LTs+B0ffWtg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm-toolchain: Use renamed
 BB_BASEHASH_IGNORE_VARS variable
To: Denys Dmytriyenko <denis@denix.org>
Cc: Khem Raj <raj.khem@gmail.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 11:52:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3037

There are more patches than those needed, so I'll merge the complete
update once CI has validated that the build is successful.

Rosss

On Tue, 22 Feb 2022 at 02:36, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Wed, Feb 16, 2022 at 11:04:04AM -0800, Khem Raj wrote:
> > On Wed, Feb 16, 2022 at 10:53 AM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > Just to clarify - both of these changes are in oe-core/master-next and have
> > > not been merged to master yet...
> > >
> >
> > if you meant to say that these changes depend on oe-core changes in
> > master-next then yes
> > we will have to wait for those to land in master before merging these
> > in meta-arm.
> > however I sent it so folks who are doing CI with master-next can use them
>
> Jon, Ross,
>
> Please merge these 2 patches, along with the layer compatibility patch I just
> sent[1] to restore meta-arm compatibilty with OE-Core master/kirkstone.
> Thanks!
>
> [1] https://lists.yoctoproject.org/g/meta-arm/message/3034
>
>
> > > On Wed, Feb 16, 2022 at 10:42:19AM -0800, Khem Raj wrote:
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta-arm-toolchain/conf/layer.conf | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > > > index fe23fd4..778910b 100644
> > > > --- a/meta-arm-toolchain/conf/layer.conf
> > > > +++ b/meta-arm-toolchain/conf/layer.conf
> > > > @@ -15,4 +15,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "honister"
> > > >  BB_DANGLINGAPPENDS_WARNONLY = "true"
> > > >
> > > >  # These variables are used for armcompiler license
> > > > -BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > > > +BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > > > --
> > > > 2.35.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3035): https://lists.yoctoproject.org/g/meta-arm/message/3035
> Mute This Topic: https://lists.yoctoproject.org/mt/89192253/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

