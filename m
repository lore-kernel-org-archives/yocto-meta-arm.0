Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2614C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:46:06 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.60.1652719563902426387
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=OPH0S2+/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id n10so12538753qvi.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z8B/x6BxgTPvJKjn/8yS41c/sqaw7EYpzY53luHy7RE=;
        b=OPH0S2+/K5+l7nbZqufBoBzSmFuBrRIPOOMKUz8edkS4sQJnzvENJuqMMU/G4+IiZA
         McmBRn5dgEhTHptxMLGFIOgdGTWMEV3tzWGzVyzhpRWLm7spE6iXl+WyVOClotIewBtW
         atjYz7AM2r23PATLCUTMqO/Mh7it5aYIU0tmETCwIIu6iGyHnBV4YBNI/vCSYizT+MGZ
         B+1GDYbz78d80Ktb4d27J59zUv18YmEhZRMnMu5P/TAvvPja2Fde9v9rBd/oWl7XZ+iu
         RoRy7YkPXbAP4zyeb7m+cYgaSEg60I58B5F4ajmiBeK6RSg8OtOYIxhRxdE6Cp8o37F2
         DGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z8B/x6BxgTPvJKjn/8yS41c/sqaw7EYpzY53luHy7RE=;
        b=W88E1t7dEmgFNoAgDZA4oBGPKLfGkxazfR62w4Wc99AqgR3C7ytrPo1zHMlKiRxVWc
         WTrCS1k2SoRuRXbUTEp+apthrw7RpQsEt8qLq5ydrgOe73cl6WbfRXaLBbagdEYuaum8
         7sYnpR/KJ6WMEswqKSBui8Pp2p/K9OPcQzGJVuZzEWF5/13uq9QD1p3MKezCMbpuR4yK
         tPhCVMLTHJ/cXo2nRzBM1fbOwGpG1VgNzyVb8G6mxrioXMosxm6SHyV7/7CmQj8zhaqJ
         ccg4ZbfwfG088Wq+sZLDkMGNEvmWmPEtTmKRXz1Jr6gKFFAS92ZDxA8En0Fn98GO82sD
         tE2Q==
X-Gm-Message-State: AOAM530xzDs4KjwigcDf9T/kNzGIgmrQnek2g0RlNRfGuFM+Zm8RVzTL
	EsgHYW46Ufdye7ZV70odoIGb2uVpNLzDZlvN
X-Google-Smtp-Source: 
 ABdhPJzB9JtD0+Lt6HJM8YaDOgvo1ZsmGEAC5lUEFWA+oJvXkp+zTnyTf3ynGRNYkXP8MzGEto/pAA==
X-Received: by 2002:a05:6214:2b07:b0:432:f7e6:e443 with SMTP id
 jx7-20020a0562142b0700b00432f7e6e443mr15852228qvb.125.1652719562956;
        Mon, 16 May 2022 09:46:02 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 i2-20020a37b802000000b0069fc13ce1eesm6013285qkf.31.2022.05.16.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:46:02 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] optee-spdevkit: Apply the sysroot patches
Date: Mon, 16 May 2022 12:45:44 -0400
Message-Id: <165271954728.1467292.10587947235538052196.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513154258.560854-1-raj.khem@gmail.com>
References: <20220513154258.560854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 May 2022 16:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3408

On Fri, 13 May 2022 08:42:57 -0700, Khem Raj wrote:
> These patches are needed for getting right C runtime library

Applied, thanks!

[1/2] optee-spdevkit: Apply the sysroot patches
      commit: 62db19b37170d6f66d3cd4c2a85e33cfb92f6d46
[2/2] optee-spdevkit: Disable for 32bit arm
      commit: 9c07b0c0d0cdccc44d755e1c395eed55f0bb70de

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

