Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECB3C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:45:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9531.1646919903563109280
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 05:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=d4pAibc4;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id h15so8039376wrc.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 05:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SF+iD7YgnhNaxy8BM0motPA/VLyRD5bAo8opnSWcVEc=;
        b=d4pAibc40cwjzw3mrtDbnbd7kUJIysFxSM3PNir8ULNzjJyj/BOXwUtspwJO105oI0
         MxCZz8cYh0RFqoD50OHVwhwmUKbhG9BpqFL8ZJRXDpVdsALgYkjBEbfZvlo1TuVoGxKh
         TXc3qK/7/+SWljJNQf9aHntPqrOj8EqMxVwIzuCFKqNmp8WYz4PvF4/RH7f302eDfDdJ
         eVrfAAVV56twbxqTXRNtPdAJdfefPHfHyJQ4ACxgke3Kp+SrKru4+MpLxRiXbhA1qNY7
         ImX8YuIvXloGJdb5z+aSPY2XRQEnDzfZy1a6k1c+CTI2DWBjVRlC/CM4HbJgmXTwJxxI
         uOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SF+iD7YgnhNaxy8BM0motPA/VLyRD5bAo8opnSWcVEc=;
        b=HFbyHT1voP8+pD++4hlODbdmCifo7LluI/hYWTZFoO15uW69bvN6CRe77VD5rQMbw1
         JyPMKaFEXEeVLumnHb8++ucekEl1UJLzPv/QT8b6A/U41YwAVRLAKUDbc8e9yIP3eMP4
         GkQSkGUp1kvoxyiJgzCMB9F7bwsn9q5+pC5xZNgBoPhh3ab3WSqSy+UXRJ22LHBaBA6s
         imutPITBrstfOFl7qQZmTuhEm1C+nqjywUyJDNM8r00wEpg834qE7rTZe2xxrkbjRoFM
         ZDSU6wRtmrhAl42aWc9apkM3FpcR4GOj/DQHWg5s2uBq4rMjhn/c8W9NvRgQ3PYs6Azi
         ohMg==
X-Gm-Message-State: AOAM530HAsnzljklL/OT9uVqCKdSTO991DYu+epRg1anhiFYQJUnxXq4
	3oH1v+doiJ9HnZtkCR2ii2mK6t/SiXW4XxWnm4vdH3BUDA7hkyuh
X-Google-Smtp-Source: 
 ABdhPJx+8YAu2t2vEeabvG00l+uqjYIq7WnIV32c2LrFyE83IT7DGDQrCzp+ckzEHe1dK2w4orO1+giMUbq3n2BUue8=
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr3600844wro.497.1646919901423; Thu, 10
 Mar 2022 05:45:01 -0800 (PST)
MIME-Version: 1.0
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
In-Reply-To: <f91a66b2-53da-4ba9-dc20-3d2b4d590206@linux.microsoft.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 13:44:50 +0000
Message-ID: 
 <CAAnfSTvdgZ2MBCmZ9j6s0uaxJDOGjud2_BWKsuZkoyFfsRSt3w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Cc: Jon Mason <jdmason@kudzu.us>, Denys Dmytriyenko <denis@denix.org>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Sumit Garg <sumit.garg@linaro.org>,
	Vishnu Banavath <vishnu.banavath@arm.com>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>, Drew Reed <Drew.Reed@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 13:45:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3147

On Thu, 10 Mar 2022 at 01:05, Alejandro Hernandez Samaniego
<alhe@linux.microsoft.com> wrote:
> I agree with Denys's point here, I think its likely there's other cases just like
> meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
> it would make sense to add a copy of python3-cryptography to meta-arm (especially since
> there's been similar situations in the past) and in parallel try to make a case for
> python3-cryptography to be moved from meta-python to OE-core.
>
> Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.
>
> This seems reasonable.  Can you rework your series to add this?  Also,
> we need to keep the older version of OPTEE for corstone1000 (for the
> kirkstone release).  So, if you can keep that around in v2, it would
> be appreciated.

Sorry for being late to this thread, I've been elbow-deep in Python
packaging changes.

As Tim said, moving python3-cryptography to meta-arm isn't one recipe:
it's two recipes and four or so classes.  This isn't a trivial
operation and I'm against that.

Can the use of python3-cryptography be a PACKAGECONFIG that is
disabled in optee out of the box, so machines which want to use it can
turn it on and add the dependency?

A less-worse option would be to DYNAMIC_LAYERS the optee recipes, so
they're only parsed if meta-python is around.

Long term we definitely need to move the crypto stack to oe-core.  I
wonder if RP would be open to moving it now...

Ross

