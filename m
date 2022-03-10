Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B22C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 16:37:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.11576.1646930235656552742
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 08:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fdA5xtYR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id r6so8441399wrr.2
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 08:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5PC7v8pMZmfnDY9qgE1WUsE92TKE0caXpouXjvGCeEg=;
        b=fdA5xtYRsoNGlqiWdt01Tj1iUFj+0sIlityTo7JuD3X51mnCry+roaLYc5kc0y1vhT
         R2imTpjsaBXsfkY+KO+MYLuKwgXbs4KiBl4nDYWrBcn2Sg+8emxUzNSIjY0vhBsOcnuj
         rCR/EnWLSnPeC7FIMTF9wz4/XkmZ/mvcKFv6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5PC7v8pMZmfnDY9qgE1WUsE92TKE0caXpouXjvGCeEg=;
        b=3mRd3lrKkBaN+NhsZuGW8LBilM7QB+YJK/zY+gWo8ICHckxpbECZtCs+CahlaEhS4K
         7PLsl3bR12NRoiueZHY5Ohwbx2RK8VG2M2qIjM7z1TMnFhIBeDAZsxSHBIeHTzOxve8P
         KIFe0JHBZLD3MgFFfUED1CrlyHk/M9QQ60w7yFSydSLmNQKMUe2f43Tj94f7wxtc+GNu
         Z4vFjC55LYiCxTSCvMgEcT4k5Fzz7tGsHER4WM6kUqD3QkIl5OOGOk3HFFR2Q8mYNfJ+
         SX542l/24zvsbjVBMWYo6CE/uQ8IpeUC7OzfjD0dJ6++Jls2JunFdHQiYQP2Z9iIcR1a
         wkxA==
X-Gm-Message-State: AOAM533GHqFLXcm+0eZugr0abccN5GZ4XOQk0lOGkYPZmkDku0dUAv6K
	YDwgRxjeX+gUTjH6niOwsnvadA==
X-Google-Smtp-Source: 
 ABdhPJyjqXQ6oUSPndGYLzIw1QgyrsONh78oc/ZCSQgH1t98k4TkKAtX1EdZxEJwqKnz5PcKZ5hoRw==
X-Received: by 2002:a5d:5850:0:b0:1f0:2d5b:dc35 with SMTP id
 i16-20020a5d5850000000b001f02d5bdc35mr4133071wrf.344.1646930233917;
        Thu, 10 Mar 2022 08:37:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4dd4:e08f:40b6:a45e?
 ([2001:8b0:aba:5f3c:4dd4:e08f:40b6:a45e])
        by smtp.gmail.com with ESMTPSA id
 e20-20020adfa454000000b001f01a14dce8sm4650102wra.97.2022.03.10.08.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 08:37:13 -0800 (PST)
Message-ID: 
 <d42fd52e84f23fe29161e0cbab6fd838bec9eae4.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, "meta-arm@lists.yoctoproject.org"
	 <meta-arm@lists.yoctoproject.org>
Cc: Jon Mason <jdmason@kudzu.us>, Denys Dmytriyenko <denis@denix.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, Sumit Garg
 <sumit.garg@linaro.org>, Vishnu Banavath <vishnu.banavath@arm.com>, Maxim
 Uvarov <maxim.uvarov@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
 Drew Reed <Drew.Reed@arm.com>
Date: Thu, 10 Mar 2022 16:37:10 +0000
In-Reply-To: 
 <CAAnfSTvdgZ2MBCmZ9j6s0uaxJDOGjud2_BWKsuZkoyFfsRSt3w@mail.gmail.com>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
	 <Yh5JYWMmAd6SnmOS@kudzu.us>
	 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
	 <Yh+DX8uaoS1VPpQ8@kudzu.us>
	 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
	 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
	 <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
	 <20220303233749.GP1766@denix.org>
	 <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
	 <YikHhHc7RcwyEcua@kudzu.us>
	 <f91a66b2-53da-4ba9-dc20-3d2b4d590206@linux.microsoft.com>
	 <CAAnfSTvdgZ2MBCmZ9j6s0uaxJDOGjud2_BWKsuZkoyFfsRSt3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 16:37:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3148

On Thu, 2022-03-10 at 13:44 +0000, Ross Burton wrote:
> On Thu, 10 Mar 2022 at 01:05, Alejandro Hernandez Samaniego
> <alhe@linux.microsoft.com> wrote:
> > I agree with Denys's point here, I think its likely there's other cases just like
> > meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
> > it would make sense to add a copy of python3-cryptography to meta-arm (especially since
> > there's been similar situations in the past) and in parallel try to make a case for
> > python3-cryptography to be moved from meta-python to OE-core.
> > 
> > Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.
> > 
> > This seems reasonable.  Can you rework your series to add this?  Also,
> > we need to keep the older version of OPTEE for corstone1000 (for the
> > kirkstone release).  So, if you can keep that around in v2, it would
> > be appreciated.
> 
> Sorry for being late to this thread, I've been elbow-deep in Python
> packaging changes.
> 
> As Tim said, moving python3-cryptography to meta-arm isn't one recipe:
> it's two recipes and four or so classes.  This isn't a trivial
> operation and I'm against that.
> 
> Can the use of python3-cryptography be a PACKAGECONFIG that is
> disabled in optee out of the box, so machines which want to use it can
> turn it on and add the dependency?
> 
> A less-worse option would be to DYNAMIC_LAYERS the optee recipes, so
> they're only parsed if meta-python is around.
> 
> Long term we definitely need to move the crypto stack to oe-core.  I
> wonder if RP would be open to moving it now...

I'm wondering how many classes/recipes are involved but I'm open to the idea...

Cheers,

Richard


