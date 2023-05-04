Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D36C7EE22
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 21:11:19 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.6635.1683234676285687040
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 May 2023 14:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=EmXcCAB/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-619bebafb65so5364206d6.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 14:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1683234675; x=1685826675;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Mp1G4EC2Fp3hjvq4mmqRJ6BNOshHTAtqi8noJCAXbs=;
        b=EmXcCAB/hQsPp9DpR6HNFiTvjBC1tRYYf1JgaWMjwt4PgNbF4eKI+b84GJTiU8oxfC
         7DSkMf/SePqH1HpIOs5Ih0Iy12jucY+76tJV7N9y3Jp+NLubAoiVyBksbuRVAQo6fbN6
         /A0QuaOa/uVw5Ln2vAfPRTnYT8nayb8bIn6FuZWEFpcs1MF8IHRFusqMrZkxALOJUvF6
         13lCustALMo2bKqvMxzsUa36/6HtlRYRqdm8Fgex8ldsVcT24U/wO+Y9wm7uYigu2aDG
         +z1TJELqy7JPElhnkKmo+59BpVZPye9s5JVRmCmRoDylgLu4wjobNgt2q6Ob2t9yH0Ua
         t6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683234675; x=1685826675;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Mp1G4EC2Fp3hjvq4mmqRJ6BNOshHTAtqi8noJCAXbs=;
        b=MbvdPplOZS5Cpl8fiJflkXBZo0KVVFQ1llNBfWtCSNwwDR+fLsk+rT3nqChlNLGeSe
         UP0BhSPDF1ebY69+Ts2fkZVIV5iEfY2bqj3aHYzUX+74nsiuTFkPweOAAPs7HD37k//B
         meZvnlR6vUwLO4qGERKYYcZKbQX6ACcNjUOZM2jqoW7+g9xejXs3jF2gJy0bzbgG7Td4
         xx/ELCReIObCkHncS2OUt49t/sZdIpeMHGDMrEhJsgAgxwUYRUyRyEpfP+5nmwrwdCnF
         Xr4Zr2Mch1aOazDnAp9LJegJ8b8wpObyCR6Mn64MbLnR9tDAA5nPMSRUHCsgvaMI+mPB
         Yi/Q==
X-Gm-Message-State: AC+VfDwbO6aPq0J4fAZ2oqAM9BjbKdBMW64nLducAiZG6xbbSNQApmcW
	b6JARzP9h5+EZ2Gw2sV3nPXW3+rtw+pbXvuSvNQ=
X-Google-Smtp-Source: ACHHUZ76t+mKQSlnULuAhZFutRPMM1L33edcbkV/466aD7wzpb61DttL7rIZpVCG4aBLrvrLQyizmQ==
X-Received: by 2002:a05:6214:27c2:b0:5f1:5cf1:b4c8 with SMTP id ge2-20020a05621427c200b005f15cf1b4c8mr17692136qvb.35.1683234675017;
        Thu, 04 May 2023 14:11:15 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id j6-20020a0cf306000000b0061a4a93eeadsm19463qvl.127.2023.05.04.14.11.14
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:11:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 4 May 2023 17:11:14 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm langdale update
Message-ID: <ZFQfcmGe7RObkV5V@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 21:11:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4638

meta-arm has released an updated langdale support tag, 4.1.1.  The tag 
contains 71 patches from between 24 Oct 2022 and 26 Apr 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.1.1) with a yocto-x.y.z tag (i.e., yocto-4.1.1).

Thanks,
Jon

