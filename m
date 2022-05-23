Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF555C433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 17:03:05 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.30382.1653325377552208442
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=6KjQ1yDB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id k8so12524143qvm.9
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Vrok/zVdPZUooFYaGbW4555VXl9l8tuJGMchrxr1gc=;
        b=6KjQ1yDBwKtT5jU4410Y9+29kDU/P0Bmy4kExSqbDkFp4ZzTgSxwMQgNvTSZVKqNM+
         5RlZCIGAYiKDBkRHIgYrH8O/YQCrWU4aN0841X0C57ufu+eXmC5okb0SWg+ylMYaXDJQ
         s1pugFmULKVGNycOGNILaFSyid+tosYnw+ifHtPrNpWdyR8c+ufJcUVAJXsYq6YXIhQn
         CRREHjkMqejJUUNCNO//bNzNYoeKqQp5gLS9umus5HH5rzK1XOxVc+Aq6IOm1ZQgVd98
         Q/+poHAZF6mpYt1TnfdRPVdZube//OLwk8wYzA6oAs/opaH2rWJBZcEuPc+2dUuSra2G
         D5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Vrok/zVdPZUooFYaGbW4555VXl9l8tuJGMchrxr1gc=;
        b=lgIDaWfgVEY3B+/LV3X1b+tqcRQW66s/Zxr9fUx+fRdCIDomEjGpdbnbyKFnYKTqWJ
         W7bwciq3RpdVOn+rEKjwLTdOufybIeFXguv4GqoR/dN9gE+FzJL2MpeXawOLq8ghfKA0
         Z8oCMI0TO9OvCRF4TFd3T4BHzS5P1T/cs2jiM2X+zYBKwvVpT0PBD5dR9kGsjyWg8mwC
         +lqWRYcQ4bd9vNslJXbEGDPAlLdMemDrorqoAwLOYRxS+pIpT1G6W0gv/x62mSSOBJnF
         pnzgnngRp7jiqS86pR8v0Sf95Dj0vfaQAtaiOdOGlhV0+wpr89SJurMxn1vxgDBuqFdv
         m7VQ==
X-Gm-Message-State: AOAM533eshtmPkBlx+IT17cp/yD5x9iGUVhcsLaHIDTPQ4CwGTyt/Oi8
	lZY9iY3JXgu8Cyq316aLLZS6ogak7GjbYWFs
X-Google-Smtp-Source: 
 ABdhPJzk/pSUobKOzX5NVhPYfNCif0yAxLg5VP46DjOLPJj/fydb0wr0s4LvqNCxiYUBWx9wkobBQQ==
X-Received: by 2002:a05:6214:b69:b0:461:f79a:b894 with SMTP id
 ey9-20020a0562140b6900b00461f79ab894mr16470678qvb.56.1653325376501;
        Mon, 23 May 2022 10:02:56 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 i27-20020a05620a0a1b00b006a3457ef710sm4591626qka.30.2022.05.23.10.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:02:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: Emekcan Aras <Emekcan.Aras@arm.com>,
	nd@arm.com
Subject: Re: [PATCH 0/3] arm/trusted-firmware-a: upgrade mbedtls to 2.28
Date: Mon, 23 May 2022 13:02:45 -0400
Message-Id: <165332536667.1082672.2802493870287359271.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518131356.86191-1-emekcan.aras@arm.com>
References: <20220518131356.86191-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 17:03:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3460

On Wed, 18 May 2022 14:13:53 +0100, emekcan.aras@arm.com wrote:
> This patchset upgrades the mbedtls to 2.28 and fixes issues in the
> corstone1000 and TC due to the upgrade.
> 
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> 
> emeara01 (3):
>   arm/trusted-firmware-a: upgrade mbedtls to 2.28
>   arm-bsp/trusted-firmware-a: corstone1000: fix FF-A Version in SPMC
>     manifest
>   arm-bsp/trusted-firmware-a: increase BL2 size for TC
> 
> [...]

Applied, thanks!

[1/3] arm/trusted-firmware-a: upgrade mbedtls to 2.28
      commit: 36ccb480e9a5c3145ecd788f4a085369e066dd58
[2/3] arm-bsp/trusted-firmware-a: corstone1000: fix FF-A Version in SPMC manifest
      commit: aa4d137309d8ac2e4a4a43e1d80f29e882ca0e0a
[3/3] arm-bsp/trusted-firmware-a: increase BL2 size for TC
      commit: c42e8bbf4e86ece9ca4c28898e37333374b95a09

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

