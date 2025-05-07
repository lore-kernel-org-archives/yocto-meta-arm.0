Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C7FC369DC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 06:32:11 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.2114.1746599521972546336
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 May 2025 23:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bbz8/cVP;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5767259e87.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 May 2025 23:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746599520; x=1747204320; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw2bCVyX6svmEfdPfxa5amDPtHl+gfVlb1xAVrSd17E=;
        b=bbz8/cVP1snQc4WbP9TSAOa7br/RK+2Kxq52GXn8LghCMvWRvXrxWvQCKzYkk1tqTb
         Am3a7yQewygJGPp4MNZmnUs/FEhz+6NBROI1ZGOdWVFAc1+VrmumMmMxazg6PG3f5smB
         XLiz6wYNfodIDzvKUg2z3MbTDZVjUh02k3csh5gJ/+BMgyyn5XqWd1dXurGL+jMYZKrA
         ++liyY6wbHbfEbOcLHULszJqg1uGPNzSJlIfisGxi1lcNAyfIDBg2axJfPkWxhyl9blh
         /WIlgazhbZAZz8AMhf4WuOydo6xpBXC10iRPSib/xKuRfbHCAtY9Ceu7DC6o3V3lHf/l
         z8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599520; x=1747204320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw2bCVyX6svmEfdPfxa5amDPtHl+gfVlb1xAVrSd17E=;
        b=vGXwqWeH/2Ufq7+RkiWPiZpzial2B8CImc2m4qwTKSrxf+9w5Oen3TiR8V0MvismHR
         eJon6wHOrEUjU0cC3yaInXfEYrPD0bbM2kTvKAYRLHHPHQnEanuErkmUZ+WmNpmUTXgS
         NFAqBgXL1HdaXNdfH9xNM/mnhJaiobOt88vaHo93iOTeJIIkNix4vOVMfzMFG0F7cNI+
         NzolKfp0RZmQEUI3X47c40U02ic1AVL1vBEcY1kBtHYRhax3J6AyYlDHCDxaigUaYZp7
         IX0jDqDE5FvGQdFUHCLncaaBYAspfNYrHoHdDTcZBUaK22eq3/AL2vY206cbWz62hv0v
         ctbQ==
X-Gm-Message-State: AOJu0YxiCvQ8W8zwj+SOb20Ksjt2SpM54ddNCsG46bNIzTRoTRgN/H6K
	Us6wBFK+wYA3B+pHUz6GVduGqUb/Xy09K49D4ApOUgvNugOTJ6faVXTb4/dZtBg=
X-Gm-Gg: ASbGncuimUeW3MZizXc3h0HOaWn7ZqGnLHSPFMMUlAbvM5J+PJitE4UyOxdWVYj6ctD
	4JJEujGJhXPJV2g307xRFAjxPUTYTkR3tZ4yS53ywg55EXdFKHciSDqP55G2ySvJcBBc+dg8Z1o
	M1i3V61HBTEpIffvJ1HX9Yar8QSmNkQ8GJw0EkHYmBv9yRX6cZ0n0/vLoh0l//+Q3gimLH/VJV9
	JzBzt2NuF9G+nKkHIC7hakBlDKvQ7LIDchS1d8zBWZXFDbGxCvdPE8/bUJYOoDQh0RIkGZG9QeN
	xRFYpUKcS4Sir+N6fjbBI9QFBnnsXA+/PuEzI2/mHrGjY3B7SfJfAcWpCMWJ+ykaiRTRF4ba2w=
	=
X-Google-Smtp-Source: AGHT+IFYl0XdR8QGKEQ0S0PqXaZHSdukfQCbZTril3XSq216ZQkBzCN2o/Uunzm+fiq1uj6BDeqcAw==
X-Received: by 2002:a19:6a04:0:b0:549:b28b:17ca with SMTP id 2adb3069b0e04-54fb93ae216mr571908e87.37.1746599519687;
        Tue, 06 May 2025 23:31:59 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee0e4sm2232192e87.157.2025.05.06.23.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:31:59 -0700 (PDT)
Date: Wed, 7 May 2025 09:31:57 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: denis@denix.org
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arm] [PATCH] optee-test: Suppress new gcc-15
 -Wunterminated-string-initialization
Message-ID: <aBr-XXXtYacQM1yy@nuoska>
References: <20250507014107.1686356-1-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507014107.1686356-1-denis@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 May 2025 06:32:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6490

Hi,

On Tue, May 06, 2025 at 09:41:07PM -0400, Denys Dmytriyenko via lists.yoctoproject.org wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Mark corresponding arrays with nonstring attribute to suppress the new
> gcc-15 warning -Wunterminated-string-initialization that becomes an
> error due to the global -Werror.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  ...-15-Wunterminated-string-initializat.patch | 69 +++++++++++++++++++
>  .../optee/optee-test_4.4.0.bb                 |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch
> 
> diff --git a/meta-arm/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch b/meta-arm/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch
> new file mode 100644
> index 00000000..0f52f3d6
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch
> @@ -0,0 +1,69 @@
> +From a8e58203dcb4c13ee340259cd2692202ac8414d1 Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@konsulko.com>
> +Date: Tue, 6 May 2025 21:35:55 -0400
> +Subject: [PATCH] Suppress new gcc-15 -Wunterminated-string-initialization
> +
> +GCC 15 now warns when character arrays are being initialized by strings
> +and terminating NUL character doesn't fit. GCC 15.1 also allows marking
> +such arrays with nonstring attribute to suppress the warning. W/o such
> +attribute, the warning becomes error due to the global -Werror. Add the
> +attribute accordingly.
> +
> +Fixes these errors:
> +
> +| ./regression_4000_data.h:7919:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (20 chars into 19 available) [-Werror=unterminated-string-initialization]
> +|  7919 |         "encryption standard";
> +|       |         ^~~~~~~~~~~~~~~~~~~~~
> +| ./regression_4000_data.h:8387:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (113 chars into 112 available) [-Werror=unterminated-string-initialization]
> +|  8387 |         "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomn"
> +|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +| ./regression_4000.c:1295:47: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (4 chars into 3 available) [-Werror=unterminated-string-initialization]
> +|  1295 | static const uint8_t hash_data_sm3_a1_in[3] = "abc";
> +|       |                                               ^~~~~
> +
> +Upstream-Status: Pending

Thanks, this is the correct fix. Can you submit upstream? They react
pretty fast there.

I still don't like -Werror as default since compiler and versions
at distro/intregrator level may differ greatly from what upstream
uses and supports.

Cheers,

-Mikko

> +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> +---
> + host/xtest/regression_4000.c      | 2 +-
> + host/xtest/regression_4000_data.h | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/host/xtest/regression_4000.c b/host/xtest/regression_4000.c
> +index 3aa15be..46e6f8e 100644
> +--- a/host/xtest/regression_4000.c
> ++++ b/host/xtest/regression_4000.c
> +@@ -1292,7 +1292,7 @@ static const uint8_t hash_data_shake256_out2[] = {
> +  * https://tools.ietf.org/html/draft-sca-cfrg-sm3-02
> +  * Appendix A.1
> +  */
> +-static const uint8_t hash_data_sm3_a1_in[3] = "abc";
> ++static const uint8_t hash_data_sm3_a1_in[3] __attribute__((nonstring)) = "abc";
> + 
> + static const uint8_t hash_data_sm3_a1_out[] = {
> + 	0x66, 0xc7, 0xf0, 0xf4, 0x62, 0xee, 0xed, 0xd9,
> +diff --git a/host/xtest/regression_4000_data.h b/host/xtest/regression_4000_data.h
> +index 0881ac3..eb101b2 100644
> +--- a/host/xtest/regression_4000_data.h
> ++++ b/host/xtest/regression_4000_data.h
> +@@ -7914,7 +7914,7 @@ static struct derive_key_ecdh_t {
> + };
> + 
> + /* G/MT 0003 (SM2) Part 5 Annex C.2 - encryption/decryption */
> +-static const uint8_t gmt_0003_part5_c2_sm2_testvector_ptx[19] =
> ++static const uint8_t gmt_0003_part5_c2_sm2_testvector_ptx[19] __attribute__((nonstring)) =
> + /* M */
> + 	"encryption standard";
> + static const uint8_t gmt_0003_part5_c2_sm2_testvector_private[] = {
> +@@ -8383,7 +8383,7 @@ static const uint8_t mac_data_sha3_512_out1[] = {
> +  * GM/T 0042-2015
> +  * Section D.3 Test vector 1
> +  */
> +-static const uint8_t mac_data_sm3_d31_in[112] =
> ++static const uint8_t mac_data_sm3_d31_in[112] __attribute__((nonstring)) =
> + 	"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomn"
> + 	"opnopqabcdbcdecdefdefgefghfghighijhijkijkljklmklmn"
> + 	"lmnomnopnopq";
> +-- 
> +2.25.1
> +
> diff --git a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb b/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
> index d514c82c..80df523d 100644
> --- a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
> @@ -5,6 +5,7 @@ SRCREV = "695231ef8987866663a9ed5afd8f77d1bae3dc08"
>  
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
>  
> +SRC_URI += "file://0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch"
>  
>  # Include ffa_spmc test group if the SPMC test is enabled.
>  # Supported after op-tee v3.20
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6488): https://lists.yoctoproject.org/g/meta-arm/message/6488
> Mute This Topic: https://lists.yoctoproject.org/mt/112661556/7159507
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


