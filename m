Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9038C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 08:14:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4974.1685434436593246688
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 May 2023 01:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41640C14;
	Tue, 30 May 2023 01:14:41 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979823F663;
	Tue, 30 May 2023 01:13:55 -0700 (PDT)
Message-ID: <16f91472-4f18-e8f5-38fd-e58a0a2106ea@arm.com>
Date: Tue, 30 May 2023 09:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arm] runFVP with FoundationModel
To: peron.clem@gmail.com, meta-arm@lists.yoctoproject.org
References: <CAJiuCcdj20VWVHkAtiTB_VA9ENssbF_RmaWaxPNvBoPQC7MbNw@mail.gmail.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <CAJiuCcdj20VWVHkAtiTB_VA9ENssbF_RmaWaxPNvBoPQC7MbNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 May 2023 08:14:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4715

On 29/05/2023 14:41, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org w=
rote:
> Hi,
>
> At the moment I'm running FVP with the Base Model (FVP_Base_RevC-2xAEMv=
A).
>
> As I understand, the FoundationModel is much lighter and I would like
> to test it.
>
> I have tried to simply switch the FVP_EXE argument of my fvpconf to
> "Foundation_Platform" but without success..
>
> My machine inherits from "fvp-base" and as I understand it, it should
> be both compatible with Foundation and Base model, right?
>
> Before looking a bit deeper, is there any documentation of script that
> could help me to run the FoundationModel?

Hi Clement,

 From a quick look at the TF-A device trees [1], there do seem to be=20
significant hardware differences between the Foundation and Base/RevC=20
models. I'm not aware of any recent BSP work for the Foundation model so=20
it would probably be a significant undertaking to port and support this=20
in meta-arm.

Peter

[1] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/fdts


