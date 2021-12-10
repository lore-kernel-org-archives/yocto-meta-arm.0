Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AB8C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:50:47 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.8034.1639147845719111346
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 06:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=oj8rRrOf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id b11so8165449qvm.7
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 06:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZ3UAy7jDOMeBOvwT28Ll2pXO6b2Cw2vvR5sKBYJ4oY=;
        b=oj8rRrOfSfhWwW8eKMgmXzwIScwp++9VkuL9/T+LnX9YZUV6hrddmcpLd3gfmOcuMf
         ve1Zb4Ep7NCIdObupuqAb78dUHmZVU0zXqR1XbHIZj6dqdGZOUbg3cvUVGXah5LJzoMs
         iVtazgzvZnfDmgtt+qAXdamJPMfyCDW6zHfEytBZI5bFuCQ2PFYkhZZ6Ah20Tu6sXET4
         w5kZcsx1p7FTblwHfh+swHM0In1GQNvubTFlHsZGDrm5cCHSuhWH8GRg/Tyvc/2XF/9f
         BddjpF1Iimp+ox/Y7tYXeJdazTJDVgFcrB8I7TJFqiUmoMrSEbkrR2l7n5/QhY+712yx
         6oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZ3UAy7jDOMeBOvwT28Ll2pXO6b2Cw2vvR5sKBYJ4oY=;
        b=eCHbCyXVgcxCDAKCzooafftgTKNIUvrmU3N23tYSIbS6SGNngxe4tCWu04MjD6N90E
         vIFWFq45LOitEEVoJ3tIkzTlefAIVy7owrRgSuuTaEPLN8flNXtyVNc7HLTORYryxz2a
         cNFrNSWyW/iwUgEfdaS86g7pa4XCkiPMIsx1O2gF0IewfDs7Ho+RdnceS4YE4JItrJef
         wwemYdJhlguOfetwo3n3oUVCrgWR2x7aDQaf/B+iyPO6KNWAkQA0vOukMffOzTniJGu0
         sNCSv5SkBKjMT23OI/z9RUGBhfXmgUOHhNlCjEKrm4YdjSJ94f44HsV7qXNc2mozyk2M
         Ie6A==
X-Gm-Message-State: AOAM533ANpK6PGg4P+lX5YVoPombTUnHtGLs/LATN4Bx4KTGStf681l3
	ZU22xfgw7SePdBFc3S1y2jNa6awV2GI7LQ==
X-Google-Smtp-Source: 
 ABdhPJznmr9DqzIGEbm/2UHUb08LdFMyjPsbku5vfpauqPnPlJ1KsiGro5DFEEOfPkndbugAScHYUg==
X-Received: by 2002:ad4:4b26:: with SMTP id s6mr26955694qvw.60.1639147844769;
        Fri, 10 Dec 2021 06:50:44 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:8d70:388b:b90b:fb51])
        by smtp.gmail.com with ESMTPSA id
 a10sm1260238qkc.92.2021.12.10.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:50:44 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][HONISTER 0/8] backport "Corstone1000: MHU driver
 patchset"
Date: Fri, 10 Dec 2021 09:50:29 -0500
Message-Id: <163914782924.9756.10759322492552204637.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209192300.29211-1-abdellatif.elkhlifi@arm.com>
References: <20211209192300.29211-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 14:50:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2611

On Thu, 9 Dec 2021 19:22:52 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Backporting from master MHU driver support.
> 
> Abdellatif El Khlifi (3):
>   arm/secure-partitions: remove platform specific dependencies
>   arm-bsp/secure-partitions: corstone1000: add mbed-crypto and nanopb to
>     platform code
>   arm-bsp/secure-partitions: corstone1000: add openamp support in SE
>     proxy SP
> 
> [...]

Applied, thanks!

[1/8] arm-bsp/optee-os: increase core heap size
      commit: d93bd3a13016b432e531c3e23c22d2fedf02dfcd
[2/8] arm/optee-spdevkit: add missing header file in optee-spdevkit
      commit: 48a646b5ebc83bbf148b9cc8f3baf372a462d4aa
[3/8] arm/secure-partitions: remove platform specific dependencies
      commit: a7a24698884339f119031e8b216e407341bf1a2d
[4/8] arm-bsp/secure-partitions: corstone1000: add mbed-crypto and nanopb to platform code
      commit: 0231b1937236c5b02cf6b0aff6b63416d6d7fb39
[5/8] arm-bsp/secure-partitions: corstone1000: add openamp support in SE proxy SP
      commit: e52c7199252fd28ee1847d220263f2334c325136
[6/8] arm/secure-partitions: pass TS_PLATFORM in the configure task
      commit: 0112ab00a67051b83f8631b05e39e1dc4bb50268
[7/8] arm-bsp/secure-partitions: Implement mhu driver
      commit: 360c498f1e63c730e89166bfaaf6b98029e5b135
[8/8] arm-bsp/optee-os: add MHU device regions in the SP manifest
      commit: 8a02bd6796cc5541164dea9551b8f93df99ec91c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

