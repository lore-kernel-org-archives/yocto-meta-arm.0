Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30522C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 18:56:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.353.1646420185875327469
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 10:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5AF540C22;
	Fri,  4 Mar 2022 18:56:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAgxwdXmrQzl; Fri,  4 Mar 2022 18:56:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C04240BC4;
	Fri,  4 Mar 2022 18:56:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E393B1747C9; Fri,  4 Mar 2022 13:56:13 -0500 (EST)
Date: Fri, 4 Mar 2022 13:56:13 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>
Cc: Tim Orling <ticotimo@gmail.com>,
	Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
	Drew Reed <Drew.Reed@arm.com>, Jon Mason <jdmason@kudzu.us>,
	Maxim Uvarov <maxim.uvarov@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Vishnu Banavath <Vishnu.Banavath@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Ross Burton <Ross.Burton@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Message-ID: <20220304185613.GS1766@denix.org>
References: <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
 <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
 <20220303233749.GP1766@denix.org>
 <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
 <CANx9H-B4N8_a6Vz3zn=zPw5Yc=QWvG0rhfLGL7iwa6fQYgS0Gw@mail.gmail.com>
 <AM5PR0801MB1716D50B772242967A3A3DD5FD059@AM5PR0801MB1716.eurprd08.prod.outlook.com>
 <AM5PR0801MB17162C36E0890FE1D0ABA750FD059@AM5PR0801MB1716.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <AM5PR0801MB17162C36E0890FE1D0ABA750FD059@AM5PR0801MB1716.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 18:56:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3117

On Fri, Mar 04, 2022 at 11:43:38AM +0000, Abdellatif El Khlifi wrote:
> I meant adding meta-python dependency to meta-arm layer like this:
> 
> In meta-arm/conf/layer.conf:
> 
> LAYERDEPENDS_meta-arm:append:qemuarm64-secureboot = " meta-python openembedded-layer"

optee-os dependency on python3-cryptography is NOT specific to qemuarm64-secureboot!


> It works as explained in the previous email.
> ________________________________
> From: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>
> Sent: 04 March 2022 11:35
> To: Tim Orling <ticotimo@gmail.com>; Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> Cc: Denys Dmytriyenko <denis@denix.org>; Drew Reed <Drew.Reed@arm.com>; Jon Mason <jdmason@kudzu.us>; Maxim Uvarov <maxim.uvarov@linaro.org>; Peter Griffin <peter.griffin@linaro.org>; Sumit Garg <sumit.garg@linaro.org>; Vishnu Banavath <Vishnu.Banavath@arm.com>; meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ross Burton <Ross.Burton@arm.com>
> Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
> 
> Hi guys,
> 
> Thanks for the feedback.
> 
> Since the machine is in meta-arm (meta-arm/conf/machine/qemuarm64-secureboot.conf), it makes sense to add the meta-python layer dependency as detailed below.
> 
> It works, meta-python  and python3-cryptography are detected. Please have a look at the logs below.
> 
> So, technically it works. But let's see what Jon and Ross think.
> 
> Suggested changes:
> 
> In ci/qemuarm64-secureboot.yml add:
> 
>     - ci/meta-openembedded.yml
> 
> In meta-arm/conf/layer.conf add:
> 
> LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot = " meta-python openembedded-layer"
> 
> Before the changes:
> 
> bitbake-layers show-layers
> 
> NOTE: Starting bitbake server...
> layer                 path                                      priority
> ==========================================================================
> meta-arm              /home/abdelk01/Work/qemu/meta-arm/meta-arm  5
> meta-arm-bsp          /home/abdelk01/Work/qemu/meta-arm/meta-arm-bsp  5
> meta-arm-toolchain    /home/abdelk01/Work/qemu/meta-arm/meta-arm-toolchain  5
> meta                  /home/abdelk01/Work/qemu/poky/meta        5
> meta-poky             /home/abdelk01/Work/qemu/poky/meta-poky   5
> 
> 
> After the changes:
> 
> bitbake-layers show-layers
> 
> NOTE: Starting bitbake server...
> layer                 path                                      priority
> ==========================================================================
> meta-arm              /home/abdelk01/Work/qemu/meta-arm/meta-arm  5
> meta-arm-bsp          /home/abdelk01/Work/qemu/meta-arm/meta-arm-bsp  5
> meta-arm-toolchain    /home/abdelk01/Work/qemu/meta-arm/meta-arm-toolchain  5
> meta-filesystems      /home/abdelk01/Work/qemu/meta-openembedded/meta-filesystems  5
> meta-networking       /home/abdelk01/Work/qemu/meta-openembedded/meta-networking  5
> meta-oe               /home/abdelk01/Work/qemu/meta-openembedded/meta-oe  5
> meta-python           /home/abdelk01/Work/qemu/meta-openembedded/meta-python  5
> meta                  /home/abdelk01/Work/qemu/poky/meta        5
> meta-poky             /home/abdelk01/Work/qemu/poky/meta-poky   5
> 
> bitbake-layers show-recipes | grep -A 1 python3-cryptography
> 
> python3-cryptography:
>   meta-python          36.0.1
> python3-cryptography-vectors:
>   meta-python          36.0.1
> 
> Kind regards
> ________________________________
> From: Tim Orling <ticotimo@gmail.com>
> Sent: 04 March 2022 03:58
> To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> Cc: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>; Denys Dmytriyenko <denis@denix.org>; Drew Reed <Drew.Reed@arm.com>; Jon Mason <jdmason@kudzu.us>; Maxim Uvarov <maxim.uvarov@linaro.org>; Peter Griffin <peter.griffin@linaro.org>; Sumit Garg <sumit.garg@linaro.org>; Vishnu Banavath <Vishnu.Banavath@arm.com>; meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
> 
> 
> 
> On Thu, Mar 3, 2022 at 7:16 PM Alejandro Hernandez Samaniego <alhe@linux.microsoft.com<mailto:alhe@linux.microsoft.com>> wrote:
> 
> 
> On 3/3/22 23:37, Denys Dmytriyenko wrote:
> 
> On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wrote:
> 
> 
> On 3/3/22 10:55, Abdellatif El Khlifi wrote:
> 
> 
> Hello,
> 
> I suggest the following:
> 
> In meta-arm-bsp/conf/layer.conf add :
> 
> LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot = "
> meta-python openembedded-layer"
> 
> 
> 
> This statement is a little confusing (to me), please correct me if
> I'm wrong, but you're saying
> 
> we should set a dependency from meta-arm-bsp layer, only for
> qemuarm64-secureboot,
> 
> however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,
> 
> AFAIC meta-arm-bsp has now knowledge of its existence, in fact
> there's no other mention of
> 
> qemuarm64-secureboot in meta-arm-bsp.
> 
> 
> Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on
> meta-arm, not meta-arm-bsp.
> 
> Depending on python3-cryptography which is only available in meta-python (part
> of meta-openembedded) should be avoided. Back in the day we pushed for moving
> other python3 dependencies like pycryptodome and pyelftools into OE-Core:
> 
> https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
> https://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571
> 
> We could try doing the same with this new python3-cryptography dependecy and
> propose moving it to OE-Core. Alternatively, consider adding it to meta-arm?
> Not ideal, but meta-arm-bsp briefly carried alternative/older version recently:
> 
> https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058
> 
> I agree with Denys's point here, I think its likely there's other cases just like
> meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
> it would make sense to add a copy of python3-cryptography to meta-arm (especially since
> there's been similar situations in the past) and in parallel try to make a case for
> python3-cryptography to be moved from meta-python to OE-core.
> 
> Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.
> 
> 
> I have suggested moving python3-cryptography (also python3-cryptography-vectors) to oe-core previously. It is heavily used for cryptography and needs to be kept up to date which is much more likely in oe-core.
> 
> This also means python3-pyo3, pyo3.bbclass, python3-setuptools-rust-native and the setuptools_rust.bbclass would also move to oe-core.
> 
> And then some tests. And documentation.
> 
> 
> 
> Alejandro

