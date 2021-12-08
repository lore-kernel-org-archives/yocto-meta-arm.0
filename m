Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3871EC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 16:23:58 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.15541.1638980636748554584
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 08:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=tRTeT4PS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id gu12so2664459qvb.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 08:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9a+SXdo/kmn3DvivZ+DgHXmutgedugsrO9Zr7D8L41A=;
        b=tRTeT4PS1OFb0UAUvkEQdikwz18RjiIa4C1bxdiI5VJpQlkZ66RcEZWuyl6hOsRopV
         JmNwWCjFMao0kdL1m8bwvTBioCwSiWXPH0bzhpG8SWGkFtPIFe8tE1t3xLGYUHlaxJFx
         +fw6nQUKCVp1mC7EHrjAQwBFuB6XJ3qBpdltckp+hhGp5UyrHzVz/lz7vOfR+gZdwqGL
         0+O76FsrIuDXAqM3K7k1QrqiRBwkgZcy2gac/VT/L94x8K4d2mLXHj+kdn+0snfZ+jd/
         3nebqqD2UUHjvw6d6PslOPPhsX0BGPio21dZQSSMC/+QnscQFkyygT++psjUkV/chEBY
         8JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9a+SXdo/kmn3DvivZ+DgHXmutgedugsrO9Zr7D8L41A=;
        b=RZMecIYVWtlEe3XXkVgcGxdBOMYr7A7b3Drvdz5hZ4Hkp6u6R+/bGz1XgNqjSqnPnh
         ZaK3wBvLCCbW+iZ/PjbgKW2pACPw5wo0H1afByrQhdBr5uqKVNu18m1Ls24RjQXSYESI
         ytYkT6eyvxf617r5nPUO5+n/9u8xKDtEriu9MQje+KTPnyYG5IG2Xj5fQbwqXDynjwYP
         dQGwp12KrLnndJrL/lpzU156fMZHaxDcXIAYty5nI8jb/AN2U34uCDtCYRemf3ph73Bm
         ajL0PAm5PpceG0mEMXbJtMVeHid6jUE5R+bZTjpaVgj6phP1rsD84xeNGISrl1G7N4Yx
         dwaw==
X-Gm-Message-State: AOAM531Mxr2r2c0JnKVs/VR1MH4vozMTkt9yhBFPu8PzFYTSGm1ZanZb
	LilpnOfI2keOb8gMeQPGcihe71hdRkapaQ==
X-Google-Smtp-Source: 
 ABdhPJw6JEcGfOocEdA/yktqdsDy6Afcs/LbtQ0zu4YTJ3Pj353DD01nZ9fcE5xPCuf84X8uvOWyBg==
X-Received: by 2002:a05:6214:21a6:: with SMTP id
 t6mr8632960qvc.5.1638980635694;
        Wed, 08 Dec 2021 08:23:55 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:45db:2bdc:4d86:d1fa])
        by smtp.gmail.com with ESMTPSA id
 l25sm1540189qkk.48.2021.12.08.08.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 08:23:55 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/8] Corstone1000: MHU driver patchset
Date: Wed,  8 Dec 2021 11:22:41 -0500
Message-Id: <163898056033.12967.15451418169984184257.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
References: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 16:23:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2570

On Wed, 8 Dec 2021 13:58:52 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Adding the following features to Corstone1000:
> 
> - openamp support
> - MHU driver
> - increasing optee core heap size
> - adding missing header for optee-spdevkit
> 
> [...]

Minor change needed for openamp patch, as their master branch was removed in favor of a main branch.

Applied, thanks!

[1/8] arm-bsp/optee-os: increase core heap size
      commit: 7d69d62dc4d6941d41cdcb5c08229bad01b4e8b6
[2/8] arm/optee-spdevkit: add missing header file in optee-spdevkit
      commit: a55cb25bd6dd8fd4c889a68ee035eba53c0d7c11
[3/8] arm/secure-partitions: remove platform specific dependencies
      commit: 75091146ff89e1b32407c50f96a0ea1dd1bb35df
[4/8] arm-bsp/secure-partitions: corstone1000: add mbed-crypto and nanopb to platform code
      commit: bc26590ccd8667f391f5b40b30de24348fb5db67
[5/8] arm-bsp/secure-partitions: corstone1000: add openamp support in SE proxy SP
      commit: 647be3ed4270722d5f2f9b946a8cbfc5324c064f
[6/8] arm/secure-partitions: pass TS_PLATFORM in the configure task
      commit: 584f509329b5e0fee4719a70631786a85fc11984
[7/8] arm-bsp/secure-partitions: Implement mhu driver
      commit: e128e8b296b75b1532c799206164921d0324a2a9
[8/8] arm-bsp/optee-os: add MHU device regions in the SP manifest
      commit: 7fa39fc38dea903dc95c06c6a3d4816c3e1099e3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

