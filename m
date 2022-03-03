Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A311C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:22:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9058.1646299378904725089
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 01:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78B561480;
	Thu,  3 Mar 2022 01:22:58 -0800 (PST)
Received: from [10.1.199.58] (e125920.cambridge.arm.com [10.1.199.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 051DA3F73D;
	Thu,  3 Mar 2022 01:22:57 -0800 (PST)
Message-ID: <f3c3a0cf-4ed0-c3bf-1115-b2030a09d3af@arm.com>
Date: Thu, 3 Mar 2022 09:22:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] arm-bsp/docs: Improve fvp-baser-aemv864 limitation
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com, robbie.cao@arm.com
References: <20220303091144.473704-1-peter.hoyes@arm.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <20220303091144.473704-1-peter.hoyes@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 09:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3095

On 03/03/2022 09:11, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> Add more details about the cache_state_modelled limitation, which can
> be worked around by setting cci400.force_on_from_start=3D1
>
> Issue-Id: SCM-3871
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Idde23278a87316dae842c6c3793b9836482e8c3a
> ---
>   meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-ar=
m-bsp/documentation/fvp-baser-aemv8r64.md
> index 85fabe5..44c755e 100644
> --- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
> +++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
> @@ -217,8 +217,11 @@ Known Issues and Limitations
>   - Only PSCI CPU\_ON and CPU\_OFF functions are supported
>   - Linux kernel does not support booting from secure EL2 on Armv8-R AA=
rch64
>   - Linux KVM does not support Armv8-R AArch64
> -- Enabling the FVP parameter `cache_state_modelled` is incompatible wi=
th virtio
> -  devices
> +- Device DMA memory cache-coherence issue: the FVP cache_state_modelle=
d
> +  parameter will affect the cache coherence behavior of peripherals=E2=
=80=99 DMA. When
> +  users set cache_state_modelled=3D1, they also have to set
> +  cci400.force_on_from_start=3D1 to force the FVP to enable snooping o=
n upstream
> +  ports.
>  =20
>   Change Log
>   ----------

Please can this patch chain also be merged into honister

Regards,

Peter


