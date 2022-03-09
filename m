Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362DDC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 20:01:13 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.1217.1646856072052168889
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 12:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=YvnEvo9p;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id bm39so2760916qkb.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 12:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ehdrim3Fl2vzqqNfe32EzhN1iLgtiIXmp5hYVWMdoyk=;
        b=YvnEvo9pvwGDwXD1oLFuvOIzycYMNvp1bhAyQyh9Qc6TV832LgXdtjagyy4wykH9TD
         WsaXf6TPd9N9ru6+jbcS4RXAsT6gxWHrdLnAa3w3vU4xKquFMAGh2R0t6pk6YhxlKaGW
         S6Lk4FwG3KT1YD+qZaTNZyHfQaeoYkVTCSCFzaH6qx/4u45StkG/rGkQhyIsS1uRoFPh
         XFS0PPtB6H/q6x1dJQ03TCwfUjfYXrPRrLwCW6Gwzbr9q2prPSJ7LZLjP/mCwi4d6z/k
         DRvEN6LjQrE6GB7phA7G8XA3/oCbR80NbIYqpT0R5+BUmnFLx33bxy+UQzWa1YtXsvS7
         SHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ehdrim3Fl2vzqqNfe32EzhN1iLgtiIXmp5hYVWMdoyk=;
        b=7DRon52cVDvQf7lWX/uVhgbnv8qkj5FDsLDTG98ic3/xkJ0bQst/D4sOEbqeUHpb7m
         swzy3qLdYbfDHKjEus6gsPEgnV89/9YeiLMrcl1uUOjB41/ZJa479jorg9C6bKaPkmTi
         zCGLxVn+ZD57ul4U+/lgMjZE8qCF8wwYWnXy3B05ZySMG3Jx/wRWo5o3Vpd0+fjzN0Ix
         AFMvDpk53w3zAzEFq8BB5ZzzD9pRI5i3fvL05THdBP2gM3jFZu9y4Uo06yY993GnZVQH
         l+gFATL6IacqQA+o/lX/cfffnjKHzAxVQu5q7BSRI1+sK2RQUvV5KINyLW0iKkadQlG3
         iV5w==
X-Gm-Message-State: AOAM530o5+JQOBu9+OHH+Nivvl/smcIE+na1xo25je8oRY2zzyGj5daj
	cAJq9wPvXMbKBeksarMRTthvog==
X-Google-Smtp-Source: 
 ABdhPJyTilf1ZbnD2/HOkm3yLoje/uRDFpuY7N2Ukpbi2twlpTHrQv03HNiHc/TQXy27KJDttWj49A==
X-Received: by 2002:a05:620a:17a6:b0:67b:cd:72d0 with SMTP id
 ay38-20020a05620a17a600b0067b00cd72d0mr924157qkb.406.1646856071068;
        Wed, 09 Mar 2022 12:01:11 -0800 (PST)
Received: from kudzu.us ([2605:a601:a66c:b900:141b:4e9c:bbb2:fbd])
        by smtp.gmail.com with ESMTPSA id
 i20-20020ac85c14000000b002de4b6004a7sm1782157qti.27.2022.03.09.12.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 12:01:10 -0800 (PST)
Date: Wed, 9 Mar 2022 15:01:08 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Alejandro Hernandez <alhe@linux.microsoft.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Vishnu Banavath <Vishnu.Banavath@arm.com>,
	Maxim Uvarov <maxim.uvarov@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Drew Reed <Drew.Reed@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Message-ID: <YikHhHc7RcwyEcua@kudzu.us>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
 <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
 <20220303233749.GP1766@denix.org>
 <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Mar 2022 20:01:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3142

On Fri, Mar 04, 2022 at 03:16:31AM +0000, Alejandro Hernandez wrote:
> 
> On 3/3/22 23:37, Denys Dmytriyenko wrote:
> > On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wrote:
> > > On 3/3/22 10:55, Abdellatif El Khlifi wrote:
> > > > Hello,
> > > > 
> > > > I suggest the following:
> > > > 
> > > > In meta-arm-bsp/conf/layer.conf add :
> > > > 
> > > > LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot = "
> > > > meta-python openembedded-layer"
> > > 
> > > This statement is a little confusing (to me), please correct me if
> > > I'm wrong, but you're saying
> > > 
> > > we should set a dependency from meta-arm-bsp layer, only for
> > > qemuarm64-secureboot,
> > > 
> > > however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,
> > > 
> > > AFAIC meta-arm-bsp has now knowledge of its existence, in fact
> > > there's no other mention of
> > > 
> > > qemuarm64-secureboot in meta-arm-bsp.
> > Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on
> > meta-arm, not meta-arm-bsp.
> > 
> > Depending on python3-cryptography which is only available in meta-python (part
> > of meta-openembedded) should be avoided. Back in the day we pushed for moving
> > other python3 dependencies like pycryptodome and pyelftools into OE-Core:
> > 
> > https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
> > https://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571
> > 
> > We could try doing the same with this new python3-cryptography dependecy and
> > propose moving it to OE-Core. Alternatively, consider adding it to meta-arm?
> > Not ideal, but meta-arm-bsp briefly carried alternative/older version recently:
> > 
> > https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058
> 
> I agree with Denys's point here, I think its likely there's other cases just like
> meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
> it would make sense to add a copy of python3-cryptography to meta-arm (especially since
> there's been similar situations in the past) and in parallel try to make a case for
> python3-cryptography to be moved from meta-python to OE-core.
> 
> Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.

This seems reasonable.  Can you rework your series to add this?  Also,
we need to keep the older version of OPTEE for corstone1000 (for the
kirkstone release).  So, if you can keep that around in v2, it would
be appreciated.

Thanks,
Jon

> 
> Alejandro

