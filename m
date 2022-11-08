Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2F1C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 13:13:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7548.1667913208264837285
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 05:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CBF123A;
	Tue,  8 Nov 2022 05:13:33 -0800 (PST)
Received: from [10.1.199.60] (unknown [10.1.199.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C42FF3F73D;
	Tue,  8 Nov 2022 05:13:26 -0800 (PST)
Message-ID: <a01a63e7-856b-de0f-5097-3120a8ec1744@arm.com>
Date: Tue, 8 Nov 2022 13:13:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-arm] [PATCH] arm,arm-bsp/recipes-kernel: don't use PN in
 arm-ffa-transport.inc
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
References: <20221107091145.4373-1-luca.fancellu@arm.com>
Cc: luca.fancellu@arm.com
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <20221107091145.4373-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Nov 2022 13:13:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4116

On 07/11/2022 09:11, luca fancellu via lists.yoctoproject.org wrote:
> To fix the issue, rename "linux-yocto" folder into "files" and adjust
> ARMFILESPATHS to point to that in linux-yocto_%.bbappend, prepend
> ARMFILESPATHS to FILESEXTRAPATHS in arm-ffa-transport.inc.
>
> Remove ARMFILESPATHS prepend from FILESEXTRAPATHS for corstone1000 in
> meta-arm-bsp, because the platform has always the "arm-ffa" in
> MACHINE_FEATURES, which causes ARMFILESPATHS to be prepended.
>
> While there, remove the FILESEXTRAPATHS prepend of ARMFILESPATHS for
> the n1sdp that will be added by arm-ffa-transport.inc only when
> needed.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Hi,

Please can this bug fix be backported to langdale.

Peter

> ---
>   meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc       | 2 --
>   meta-arm/recipes-kernel/linux/arm-ffa-transport.inc             | 2 +-
>   .../linux/{linux-yocto => files}/arm-ffa-transport.cfg          | 0
>   meta-arm/recipes-kernel/linux/{linux-yocto => files}/efi.cfg    | 0
>   .../generic-arm64-kmeta/generic-arm64-standard.scc              | 0
>   .../linux/{linux-yocto => files}/no-strict-devmem.cfg           | 0
>   meta-arm/recipes-kernel/linux/{linux-yocto => files}/tee.cfg    | 0
>   meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend            | 2 +-
>   8 files changed, 2 insertions(+), 4 deletions(-)
>   rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/arm-ffa-transport.cfg (100%)
>   rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/efi.cfg (100%)
>   rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/generic-arm64-kmeta/generic-arm64-standard.scc (100%)
>   rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/no-strict-devmem.cfg (100%)
>   rename meta-arm/recipes-kernel/linux/{linux-yocto => files}/tee.cfg (100%)
>
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index 99a40e77775f..79d9e0c3da2e 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -36,7 +36,6 @@ SRC_URI:append:corstone500 = " \
>   # Corstone1000 KMACHINE
>   #
>   FILESEXTRAPATHS:prepend:corstone1000 := "${ARMBSPFILESPATHS}"
> -FILESEXTRAPATHS:prepend:corstone1000 := "${ARMFILESPATHS}"
>   COMPATIBLE_MACHINE:corstone1000 = "${MACHINE}"
>   KCONFIG_MODE:corstone1000 = "--alldefconfig"
>   KMACHINE:corstone1000 = "corstone1000"
> @@ -115,7 +114,6 @@ COMPATIBLE_MACHINE:n1sdp = "n1sdp"
>   KBUILD_DEFCONFIG:n1sdp = "defconfig"
>   KCONFIG_MODE:n1sdp = "--alldefconfig"
>   FILESEXTRAPATHS:prepend:n1sdp := "${ARMBSPFILESPATHS}"
> -FILESEXTRAPATHS:prepend:n1sdp := "${ARMFILESPATHS}"
>   SRC_URI:append:n1sdp = " \
>       file://0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch \
>       file://0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch \
> diff --git a/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc b/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
> index dec31dd44da1..b3d377b4bf7a 100644
> --- a/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
> +++ b/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
> @@ -1,4 +1,4 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +FILESEXTRAPATHS:prepend := "${ARMFILESPATHS}"
>   
>   # Enable ARM-FFA transport
>   SRC_URI:append = " \
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/arm-ffa-transport.cfg b/meta-arm/recipes-kernel/linux/files/arm-ffa-transport.cfg
> similarity index 100%
> rename from meta-arm/recipes-kernel/linux/linux-yocto/arm-ffa-transport.cfg
> rename to meta-arm/recipes-kernel/linux/files/arm-ffa-transport.cfg
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg b/meta-arm/recipes-kernel/linux/files/efi.cfg
> similarity index 100%
> rename from meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
> rename to meta-arm/recipes-kernel/linux/files/efi.cfg
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc b/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm64-standard.scc
> similarity index 100%
> rename from meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc
> rename to meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm64-standard.scc
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/no-strict-devmem.cfg b/meta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg
> similarity index 100%
> rename from meta-arm/recipes-kernel/linux/linux-yocto/no-strict-devmem.cfg
> rename to meta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/files/tee.cfg
> similarity index 100%
> rename from meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> rename to meta-arm/recipes-kernel/linux/files/tee.cfg
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
> index 896add8d0a6c..a641ec2da26c 100644
> --- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
> @@ -1,4 +1,4 @@
> -ARMFILESPATHS := "${THISDIR}/${PN}:"
> +ARMFILESPATHS := "${THISDIR}/files:"
>   
>   COMPATIBLE_MACHINE:generic-arm64 = "generic-arm64"
>   FILESEXTRAPATHS:prepend:generic-arm64 = "${ARMFILESPATHS}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4091): https://lists.yoctoproject.org/g/meta-arm/message/4091
> Mute This Topic: https://lists.yoctoproject.org/mt/94862413/5715260
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoyes@arm.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

