Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68294EB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 19:32:45 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.117034.1692041561730100676
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 12:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=inaOw/ry;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-40fda01c8beso21173111cf.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 12:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692041560; x=1692646360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0NXDnv5e3qttV5Wm2qahTn80u7ioM/4y+9PEFWRq4I=;
        b=inaOw/rySFYbxg31kCeevILNuGjfo5+F9q9altMb+5jjnNyc3/qpvvTDKIeo471RCG
         D+4Wl79P42PQuWIHX8ckfkfETZ0PsQ7oRpF0xlPoKnE38CCDNisu8RFGDwC6+4i1t/HI
         ibDD/CbIs3s+7CUWOJnKxdfOKjmwoAPY0Dv1l84yHA6S0+28+fPSjn8h+eMtCTrEDaIA
         Ey8oWgZmw9xRyKzPu8m35qpTZA4Mizw8uqL9kj4JvCh20rGHOlFfcQssthAkOzKPDpgY
         YOcamfM6Jz10IxT0l9MCNJIrFFssi7mFh+8eJ3J9oGsm0VMFpVee7rOAt+7BpIYLQc9y
         pLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692041560; x=1692646360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0NXDnv5e3qttV5Wm2qahTn80u7ioM/4y+9PEFWRq4I=;
        b=P9GBrGivMq63XBWYTZvfOJnGDVEYAHmhbDiuU6KZeU7phjhkfmkPY2QTknvII3tWhD
         6l6vtRLWJ8RdwPV63nkn+rC8zVmTXSc5qAuKgA8IvU6pcmSkf8FOsU2RWm6GV2TXCnM+
         QTwXmitCMZ/mgPpXbT7R1fqnpELVGA4Zy2lTfvRULQM5FHvbJTqQHYCTdozTQIdhxabD
         w6hTx+FiOviCL8wQtf6k6Wv/TMv4c7/xhyoZ5R5Lo6sETcXJtEADQM5XEW3suULv3lNd
         CFHjBCIZROfQX7RmfbnwTx+S1wb7CBgj3L2/c2ghcSljpF4e9rsj0PkCQqlFqalg7vOx
         J32A==
X-Gm-Message-State: AOJu0Yw4us2mNuZQgQSHbUJD1BbEX63dsvaHUoafCXkcfAu9piQoWliW
	0oqEblKPCWmAIXS+pZz1YKBeAQHTz+cYHTDSVS4=
X-Google-Smtp-Source: AGHT+IFclxGUr2YWZLilbYN4HmI10exIRVC3XF9HMIKMugH1D2EQYIjvWlfB5bBAZKUBFcShVEuwSQ==
X-Received: by 2002:a05:622a:4ca:b0:40e:f7cb:8c44 with SMTP id q10-20020a05622a04ca00b0040ef7cb8c44mr16659970qtx.23.1692041560354;
        Mon, 14 Aug 2023 12:32:40 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z1-20020ac875c1000000b00401e04c66fesm3323944qtq.37.2023.08.14.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 12:32:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH mickledore 1/3] CI: remove master refspec for meta-virtualization yml file
Date: Mon, 14 Aug 2023 15:28:05 -0400
Message-Id: <169204128623.3199631.2173356671410472854.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230814175042.3629846-1-jon.mason@arm.com>
References: <20230814175042.3629846-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 19:32:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4959


On Mon, 14 Aug 2023 12:50:40 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/3] CI: remove master refspec for meta-virtualization yml file
      (no commit info)
[2/3] arm/linux-yocto: move 6.1 patches to a unique bbappend
      (no commit info)
[3/3] arm/recipes-kernel: Add preempt-rt support for generic-arm64
      commit: 992c07f7c030caf0c52665cfbd2a30899bba7015

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

