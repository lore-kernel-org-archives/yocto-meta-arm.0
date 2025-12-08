Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0854ED3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 18:26:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1979.1765218391705710631
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Dec 2025 10:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E6F3C40C3E;
	Mon,  8 Dec 2025 18:26:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8p_DlawlkLUj; Mon,  8 Dec 2025 18:26:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A856C406B5;
	Mon,  8 Dec 2025 18:26:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F1A76176518; Mon,  8 Dec 2025 13:26:26 -0500 (EST)
Date: Mon, 8 Dec 2025 13:26:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: mohammedjavitham@ami.com
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Gayatri L <gayathril@ami.com>, Hariharan R <hariharanr@ami.com>
Subject: Re: [meta-arm] [PATCH] arm/fvp-base-a-aem: update to 11.30.27
Message-ID: <20251208182626.GH11121@denix.org>
References: <SA1PR10MB5885A090DB0B9F373F6A84F6DEA2A@SA1PR10MB5885.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR10MB5885A090DB0B9F373F6A84F6DEA2A@SA1PR10MB5885.namprd10.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Dec 2025 18:26:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6788

On Mon, Dec 08, 2025 at 09:46:08AM +0000, Mohammed Javith Akthar M via lists.yoctoproject.org wrote:
> Update Armv-A Base RevC AEM FVP to latest version
> 
> Testing:
> 
> Able to boot openbmc firmware in updated fvp
> ./meta-arm/scripts/runfvp --console build/fvp/tmp/deploy/images/fvp/obmc-phosphor-image-fvp.fvpconf
> 
> Signed-off-by: Mohammed Javith Akthar M <mohammedjavitham@ami.com>

License-Update: tag is missing:
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#license-updates


> ---
>  ...-base-a-aem_11.29.27.bb => fvp-base-a-aem_11.30.27.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.29.27.bb => fvp-base-a-aem_11.30.27.bb} (64%)
> 
> diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
> similarity index 64%
> rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
> rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
> index a45fa153..23bf7a16 100644
> --- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
> +++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
> @@ -4,11 +4,11 @@ LICENSE:append = " & Artistic-2.0 & BSL-1.0 & BSD-2-Clause & Unlicense"
> 
>  SUMMARY = "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture Envelope Model FVP"
>  LIC_FILES_CHKSUM = "file://license_terms/license_agreement.txt;md5=1a33828e132ba71861c11688dbb0bd16 \
> -                    file://license_terms/third_party_licenses/third_party_licenses.txt;md5=92ea58bb219213dfdc48111b693019b6 \
> -                    file://license_terms/third_party_licenses/arm_license_management_utilities/third_party_licenses.txt;md5=abcaafefc7b7a0cdf6664c51f9075c5b"
> +                    file://license_terms/third_party_licenses/third_party_licenses.txt;md5=a5ce56e117d0ab63791fbb7c35ec2211 \
> +                    file://license_terms/third_party_licenses/arm_license_management_utilities/third_party_licenses.txt;md5=25c38921c5071644ed088288e5bd9b8e"
> 
> -SRC_URI[fvp-aarch64.sha256sum] = "8fce0dc6346c37b0df4809d08b599463c880b6375f9b58d89a73fa6f9ab2e129"
> -SRC_URI[fvp-x86_64.sha256sum] = "8a8c4a609c32890ce96799aa7319fff3ecf752c7a9dab52b2e968cb80cc1836f"
> +SRC_URI[fvp-aarch64.md5sum] = "0905dcb10065ba6f82a757cdaa961079"
> +SRC_URI[fvp-x86_64.md5sum] = "8f81bd127bc5bbf9f48eb5dd395a9c40"

This is wrong - md5sum hashes can be omitted, as they are weak, but sha256sum 
hashes are required.


>  # The CSS used in the FVP homepage make it too difficult to query with the tooling currently in Yocto
>  UPSTREAM_VERSION_UNKNOWN = "1"
> -The information contained in this message may be confidential and proprietary to American Megatrends (AMI). This communication is intended to be read only by the individual or entity to whom it is addressed or by their designee. If the reader of this message is not the intended recipient, you are on notice that any distribution of this message, in any form, is strictly prohibited. Please promptly notify the sender by reply e-mail or by telephone at 770-246-8600, and then delete or destroy all copies of the transmission.

Is this part of the patch? It shouldn't be here.

-- 
Denys

