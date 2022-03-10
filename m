Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9B4C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 16:53:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.11695.1646931196942902305
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 08:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=U5vRs9o+;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id j17so9024007wrc.0
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0R9A/vdWU8fbuAD3ZPv6iBbe5bsCKY3qGJhRiCPEcjs=;
        b=U5vRs9o+21oO8HZBAuYriicbl44QnAh8NbF8DVXbYgqkz7d5zb+m+VBmBF5qsKZKFG
         BuOFJQLRTRGULoCDXtM9NW3D9Bwi7R8r1MkVUh5VfZdRyZC4v1Ixz4U5bNfijBA4goNM
         yRf1m7I5U5bPcc3w3S1nnpNYGbuiCMAn1JbjubYuhIbn8XWHk5l+Q9To8LHDFojNGfu6
         Cbwk2soNlti7W8nOqFdqjZhKmXvRQZ3tYkcYBtWS+6ii2OWXu4RhKrAWlKMtJZox+g3q
         jtQ6pg7xSzCohcN4rKDym7VFjpFu+LRg6FqN435Ih2m7OxuX0ryc4N/O57tDvlEf9OsI
         eCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0R9A/vdWU8fbuAD3ZPv6iBbe5bsCKY3qGJhRiCPEcjs=;
        b=ahBsiOeUS/zdKkeSthSruG/WCgwFlWJsRFiR1Z3+WawWy4yUKHb+rz+P9BfVT+ulJE
         y6US3ug9JkbQPX/VNW1xiq405iZuFWvEFVQS0n5FflZ5+gDVOwyzvSFbWLU4JgLeqGcQ
         Vt8tgd0NCV++bSc+gLIhnbryFBhPIHsYJb6PJRH7H9oVwcRstP1q8Mtm3FWoBYfPBiWT
         iINFRk7UcXdy9cnjinKrTFyg8ccIls/Rcf0pSfmsYU53/v9wVo4SY63J3rxL0yEZ3ZjA
         Le1vyN97lHM+IOsdl9av88DsOXrg+dA+Lj+pSF+EWiL095q31bTFOsxt7kPvSuQ8Hbky
         61Sg==
X-Gm-Message-State: AOAM533uVE+sID4OSdQsNhYQ4wedlBQohEHEz/QV4zkA/CuchnKaCLin
	W+zLzku91iVKzRqUWYiILeqwvlu4lJYounKTIFOU3Q==
X-Google-Smtp-Source: 
 ABdhPJycUEArIWzg+9A5ZoKUpKvCGeVhdDb6GgBxny8E3fMqlCzcNMnwRAKVTkNs1+bNulOWwXE0dj5p8BH6GvlTNbQ=
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr4212829wrs.620.1646931195122; Thu, 10
 Mar 2022 08:53:15 -0800 (PST)
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
 <CAAnfSTvdgZ2MBCmZ9j6s0uaxJDOGjud2_BWKsuZkoyFfsRSt3w@mail.gmail.com>
 <d42fd52e84f23fe29161e0cbab6fd838bec9eae4.camel@linuxfoundation.org>
In-Reply-To: 
 <d42fd52e84f23fe29161e0cbab6fd838bec9eae4.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 16:53:04 +0000
Message-ID: 
 <CAAnfSTtyUOVJESM6_FbsY4yS7xn5y7h9S7Def6-asHAR9bHf1Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 Jon Mason <jdmason@kudzu.us>,
	Denys Dmytriyenko <denis@denix.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Sumit Garg <sumit.garg@linaro.org>,
 Vishnu Banavath <vishnu.banavath@arm.com>,
	Maxim Uvarov <maxim.uvarov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
	Drew Reed <Drew.Reed@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 16:53:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3149

From Tim earlier in the thread:

> I have suggested moving python3-cryptography (also python3-cryptography-vectors) to oe-core previously. It is heavily used for cryptography and needs to be kept up to date which is much more likely in oe-core.
> This also means python3-pyo3, pyo3.bbclass, python3-setuptools-rust-native and the setuptools_rust.bbclass would also move to oe-core.

A few recipes and their ancillary classes.

Ross

On Thu, 10 Mar 2022 at 16:37, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-03-10 at 13:44 +0000, Ross Burton wrote:
> > On Thu, 10 Mar 2022 at 01:05, Alejandro Hernandez Samaniego
> > <alhe@linux.microsoft.com> wrote:
> > > I agree with Denys's point here, I think its likely there's other cases just like
> > > meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
> > > it would make sense to add a copy of python3-cryptography to meta-arm (especially since
> > > there's been similar situations in the past) and in parallel try to make a case for
> > > python3-cryptography to be moved from meta-python to OE-core.
> > >
> > > Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.
> > >
> > > This seems reasonable.  Can you rework your series to add this?  Also,
> > > we need to keep the older version of OPTEE for corstone1000 (for the
> > > kirkstone release).  So, if you can keep that around in v2, it would
> > > be appreciated.
> >
> > Sorry for being late to this thread, I've been elbow-deep in Python
> > packaging changes.
> >
> > As Tim said, moving python3-cryptography to meta-arm isn't one recipe:
> > it's two recipes and four or so classes.  This isn't a trivial
> > operation and I'm against that.
> >
> > Can the use of python3-cryptography be a PACKAGECONFIG that is
> > disabled in optee out of the box, so machines which want to use it can
> > turn it on and add the dependency?
> >
> > A less-worse option would be to DYNAMIC_LAYERS the optee recipes, so
> > they're only parsed if meta-python is around.
> >
> > Long term we definitely need to move the crypto stack to oe-core.  I
> > wonder if RP would be open to moving it now...
>
> I'm wondering how many classes/recipes are involved but I'm open to the idea...
>
> Cheers,
>
> Richard
>

