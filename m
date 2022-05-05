Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99710C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 17:13:19 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.14012.1651770792404795585
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=fOp5/zFW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id j6so3635451qkp.9
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aa3NAX493O+oD21MqFhxzn58iOe0u6IKVlx2AnjnYq0=;
        b=fOp5/zFWRQQulTg2GG6/Fbbv/6uqiF2AgU2HOovotJsDo/6edrVkmDsK2kEoI71vY6
         hIcr/8UGs1+7bDiVHceJMdcsleCBkGcLxuUSKMg4CjPGck2fhPAEdHOHiTOviG/hGQ3y
         2fccEuNWXk9WwF6c+pLCBSySrd97D0HdvP1tSLy0FTmy+llI27vS8SmDoJXT9e1/fTXu
         bvbn4hQpp2BEp7Le7jZrFonzabAYDBZH0xTDioJZ+v6MKCwc54JLYMXQtCLqczUI2C2U
         IjwNCJNpPwe9CD8rGoyl+jVkkM/b2lWwlqbZvkMvGKCcK6Ul7EGswQxr0sqVLKGQ0fST
         bKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aa3NAX493O+oD21MqFhxzn58iOe0u6IKVlx2AnjnYq0=;
        b=a65afKN4Ke/3hBgyZoVqlQu0fAKsug7qYQARjRFVqGnlB7zdlv2tvpbtmnGnTa/SGF
         IK1gOD5o7ef2DvdVymEMVBINyBGJgW05hYYk+NX2ACxsUvMVRoDkJws3IRsxl9oAFhi4
         WCUj3af0fO7u6rsq5TgIAPtqogCx5bQxzTvwrT0dTp0K3Px3frafZ2s18He7jGlA+5Q5
         O/8QBiQM2o0vSg1dhd6EbANAdYaSXf34metGiYeIH1c+gXSGftmJzzf5WgI37I3pkzxf
         EJTuufLdIXrzNAopXJzKPyRdkECPmdk8XlvljglbvsMmMp68udpUEKjLho+GntuOMec5
         Jo2w==
X-Gm-Message-State: AOAM531O0zf2n6niNY8CQpkRukzfIluQ/aUB3iM+4JCqaH6vGeIHOLQ6
	4qc9ZUks+oIpkxcbeMw/IX+uxe0lJbHPXgRW
X-Google-Smtp-Source: 
 ABdhPJxObvlstE2DYhGlPMl5OiRELYc3+CRi44yncyd1ci/UQS7x3oKqUN2PelHcT8xfB2K2KRzbrA==
X-Received: by 2002:a05:620a:28ca:b0:69e:76f6:cbd5 with SMTP id
 l10-20020a05620a28ca00b0069e76f6cbd5mr20321962qkp.622.1651770791427;
        Thu, 05 May 2022 10:13:11 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 z11-20020ac8100b000000b002f39b99f683sm1128231qti.29.2022.05.05.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 10:13:11 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm/trusted-firmware-m: upgrade to 1.6.0.
Date: Thu,  5 May 2022 13:13:02 -0400
Message-Id: <165171962770.1050116.14087735977914886011.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504131711.783449-1-ross.burton@arm.com>
References: <20220504131711.783449-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 May 2022 17:13:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3369

On Wed, 4 May 2022 14:17:10 +0100, Ross Burton wrote:
> Upgrade all SRCREVs, and drop the merged patch to use cbor2.

Applied, thanks!

[1/2] arm/trusted-firmware-m: upgrade to 1.6.0.
      commit: 83df1de70980d929c6c0ebc14d74d2e86b21aad4
[2/2] arm-bsp/trusted-firmware-m: move corstone1000 to TF-M 1.6.0.
      commit: 68b1e2d3e3c9d25d894bf76e2cf700bf383e464c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

