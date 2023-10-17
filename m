Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF4DCDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:49:19 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.216179.1697550557402347156
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ddLLANdv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.54, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c4bad60a1aso3419290a34.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697550556; x=1698155356; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQq4cURcpqyleLUYj/+Knm0aoM9scKXN/zw4PdXtmEs=;
        b=ddLLANdv3ZMsb68HLnehQGQLXADMbWCXQMxk+CxiS0Qc9z4aVL8ZolRsw4j9SFggXE
         jPQs1ExVA3m0yTbfse9h8wXpbSNuTylwzgY22xopZH8Bkgwo4T7EALyioJRvz3if46l8
         UodTg3VSZz9X67SPtyhmShwUcu1NNSiPppotYAHWX59E8T+CsmVw9kyq2ETIZ+BxYKJ9
         UD/1+hU+nb+tDdrBr5kvNdPUfxsP4wLFM3AObQBtegelcWl1Djcil6pQKNQffMrLpG2r
         aPKf7evouBpdQFkUMyNPRl85Dw3GCvvSf8mzXT+tpqO/e7ELDsnT05ZgbbSCdu2iau5K
         O5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697550556; x=1698155356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQq4cURcpqyleLUYj/+Knm0aoM9scKXN/zw4PdXtmEs=;
        b=jJXUbjstWQl8T+fRRA+NEC8SnFanEHAFjVHfd/P+o3qXb4qOTLxtG+YyHdCRzo3T8y
         2W2sElMwWJc7b7dRzO3mCbcOOyyPImmzpmSp3t2d+K9y0gqv2rjmfox3qFpCDXImxm4D
         S5mdFwMH+dZj6lrmGBRoh9zAdR85yqBSxKPIsxuO5nQ69ngwtVS0Rimn1eD7JQlk+swa
         tIu4hifmzpJh2dmcW/5SHGXq1Vi3MInUd8y3D39vF7lMhO4VjgjVdKmmFDPoltzJrLkd
         68n0p6zE8Taw7Y1VQr8vkt9v31GDpQ+0xAcoXyZckN0SlMBDcWcEEgwZh+gwK9F63qNC
         T2/g==
X-Gm-Message-State: AOJu0YzHOc4+Q/0oryH0Z84HYZATKNosBwuLVzlgT25o2Of+F3xzW4Gg
	yOlEKZG6QUf8ojGpUtYi4aiv1a9u70OK/BawdJg=
X-Google-Smtp-Source: AGHT+IGu1a/ZTvdpq++KWoApnURY0robL9o49ypYT0jIKMM7nK4H7rUe03KfO2vLgJmcC25nzvU1PA==
X-Received: by 2002:a05:6830:124a:b0:6bd:db8:db with SMTP id s10-20020a056830124a00b006bd0db800dbmr2096896otp.32.1697550556184;
        Tue, 17 Oct 2023 06:49:16 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id es16-20020a056214193000b0064f53943626sm559467qvb.89.2023.10.17.06.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:49:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm/oeqa/selftest: tag all tests with "meta-arm"
Date: Tue, 17 Oct 2023 09:48:49 -0400
Message-Id: <169755052972.997769.4250441914177341669.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231013165205.1678618-1-ross.burton@arm.com>
References: <20231013165205.1678618-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:49:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5131


On Fri, 13 Oct 2023 17:52:03 +0100, ross.burton@arm.com wrote:
> Tag all of the tests in meta-arm so that they can be selectively ran
> without needing to explicitly list them.
> 
> 

Applied, thanks!

[1/3] arm/oeqa/selftest: tag all tests with "meta-arm"
      commit: cadb42a66c8879fa30db84156e94d10cf1ea63e0
[2/3] CI: don't hardcode the selftest tests to run
      commit: 19d2d8a484d55805704aad1b76cfc36ad4bc9032
[3/3] CI: also run the _qemutiny testcase for poky-tiny
      commit: ebe4d2437ce56fce42821170c1557440cf0aa617

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

