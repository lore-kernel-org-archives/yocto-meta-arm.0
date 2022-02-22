Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4C8C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:36:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.8076.1645497390482176137
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 69D5940C2E;
	Tue, 22 Feb 2022 02:36:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQg5m3tmXOaq; Tue, 22 Feb 2022 02:36:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C9F840951;
	Tue, 22 Feb 2022 02:36:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0DB98174767; Mon, 21 Feb 2022 21:36:28 -0500 (EST)
Date: Mon, 21 Feb 2022 21:36:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm-toolchain: Use renamed
 BB_BASEHASH_IGNORE_VARS variable
Message-ID: <20220222023627.GM26229@denix.org>
References: <20220216184220.3494070-1-raj.khem@gmail.com>
 <20220216185312.GP26229@denix.org>
 <CAMKF1spSUUVxamZz6CtVoKrr5q9pQ94qwTeXR11hMBrz4Sy_Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1spSUUVxamZz6CtVoKrr5q9pQ94qwTeXR11hMBrz4Sy_Xg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 02:36:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3035

On Wed, Feb 16, 2022 at 11:04:04AM -0800, Khem Raj wrote:
> On Wed, Feb 16, 2022 at 10:53 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > Just to clarify - both of these changes are in oe-core/master-next and have
> > not been merged to master yet...
> >
> 
> if you meant to say that these changes depend on oe-core changes in
> master-next then yes
> we will have to wait for those to land in master before merging these
> in meta-arm.
> however I sent it so folks who are doing CI with master-next can use them

Jon, Ross,

Please merge these 2 patches, along with the layer compatibility patch I just 
sent[1] to restore meta-arm compatibilty with OE-Core master/kirkstone. 
Thanks!

[1] https://lists.yoctoproject.org/g/meta-arm/message/3034


> > On Wed, Feb 16, 2022 at 10:42:19AM -0800, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta-arm-toolchain/conf/layer.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > > index fe23fd4..778910b 100644
> > > --- a/meta-arm-toolchain/conf/layer.conf
> > > +++ b/meta-arm-toolchain/conf/layer.conf
> > > @@ -15,4 +15,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "honister"
> > >  BB_DANGLINGAPPENDS_WARNONLY = "true"
> > >
> > >  # These variables are used for armcompiler license
> > > -BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > > +BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > > --
> > > 2.35.1

