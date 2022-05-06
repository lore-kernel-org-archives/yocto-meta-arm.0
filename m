Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DBDC433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 21:04:10 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.3292.1651871040533370723
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 May 2022 14:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=qcPAoXS6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id jt15so6255350qvb.8
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 May 2022 14:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O94V0LbspUIgZLV3zh0wz97jLhYejINS/QJcml7GGMU=;
        b=qcPAoXS6KXVDq3yombmVEkYI02lOgCKVV8zLsWG5j35FmmpzLQWSKQnQ9besbuvul5
         QqRd5IYQf8Dgct1OTbu1zBKv0p3SqnqWR4mozPE10Dss0Ez4/Xw2o4XxPnevLIy8aj3u
         8aDYxTs6T3vxfmSlW9zoxSwe51mgEZKt5a8bZYmW9T+0UTe3hUrMzA3hfSCEEH1bsiGm
         jffHtDDFY0VB1EejtU8EHlt5dE781X3MnMQIp0xCBsSdLYOffFGCz8xPGx9V76K+cT5W
         g1cPmKsxactAI5ijVqBTIkkKmBOgVXfAWAU1RLz8paSXaOq8kf36T/W5BUbsxNIDz7xx
         Odiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O94V0LbspUIgZLV3zh0wz97jLhYejINS/QJcml7GGMU=;
        b=Vm+kMcObxshK9ORRJ6Qg+Hg3e0JEy1hunfRAyJYPBwXnaZi11ZFy0I5S7f3cPkuX0F
         RJAmKdcUTA2cTiOBY5+/5VmfhS+W/ifl6bi90GHcbcytNlkz8KHec4YUYMG1ZInN3AsK
         D3q+U+8joQFqhogsNGrvBDuujweraTWoJmIzmxJyiNjUdTPCVeehSbz31c4dZdiV0ynJ
         wtATXL5RmF2g/SXFd55uCatIj+mx/V0rRxVlRwJC7qHunKfywAngXyEdwOtU6PD+SFWH
         sXozdLO4tn7UBsHDWecG4Sr0pfUMO6TncS1TYddhRvyVO+J1QjBrEvGqqZo0yz9iLZgx
         fewA==
X-Gm-Message-State: AOAM5318AJSOYIs4reC1nBMxuAcUisxPsHfbWSXpXiTJbz377NH7Rboc
	Uhrp5lKatUY+K4t9PPiDhOHL60UxlCYPHJGx
X-Google-Smtp-Source: 
 ABdhPJwyXj4lLl428dmyKYJmA8eq+IwPqIh2TkBFgnIQ1OfjR2rBUNf3dHTcM/X5pSHSBmHLvokISw==
X-Received: by 2002:a05:6214:27c6:b0:45a:b5f0:691d with SMTP id
 ge6-20020a05621427c600b0045ab5f0691dmr4140711qvb.9.1651871039472;
        Fri, 06 May 2022 14:03:59 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 m19-20020ac84453000000b002f39b99f674sm3043865qtn.14.2022.05.06.14.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 14:03:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Sumit Garg <sumit.garg@linaro.org>
Cc: ross.burton@arm.com,
	daniel.thompson@linaro.org
Subject: Re: [PATCH 1/2] Add new target: "qemuarm-secureboot"
Date: Fri,  6 May 2022 16:43:07 -0400
Message-Id: <165186978769.656860.3661763487070519095.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504094851.201843-1-sumit.garg@linaro.org>
References: <20220504094851.201843-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 May 2022 21:04:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3372

On Wed, 4 May 2022 15:18:50 +0530, Sumit Garg wrote:
> Add a new 32 bit target as "qemuarm-secureboot" on similar lines as
> "qemuarm64-secureboot". The boot flow looks like:
> 
> BL1 (TF-A) -> BL2 (TF-A) -> OP-TEE -> u-boot -> Linux
> 
> Along with this enable support for OP-TEE based firmware TPM.

Applied, thanks!

[1/2] Add new target: "qemuarm-secureboot"
      commit: 152f94fa5616cd692eef73f9b23a166a4c1f0e48
[2/2] linux-yocto: tee.cfg: Enable TEE based fTPM driver
      commit: 7e4cbdb508d4d1e35a6de6451806f72be3d37639

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

