Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6477CC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 22:07:30 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.677.1666390045765144066
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 15:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=KhZZD7Wg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id z8so2550417qtv.5
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p83eyM/g2esQ1B+/gTk72hlNugygA/VZwgZ5277Xd1o=;
        b=KhZZD7Wgpk5cXfkJV8ivOO2IDFZtvbIlFda/41sQ6LmaWPxcs3zVGrqJn/henrDMNY
         ctPkOfWuhtKqv9VbCResuU18RfU+u9jtKME61mTbcqExbW9fbk9rGgr0bqL5adIjlStq
         l2RcAHmcfs/BQCgDBKbWWBRQVvlpAzxVbEHrPQfIhOc05HMDkBiTD677X/3GipYUOraM
         rR5vmywPqBqZH3LCm5QyqOHfIZR2+BJp0RFWcAuW+UcoPFpVp9znFYimIV/2p/t8ziBE
         b4u13DY/1l/uE2fIY0eLXpG2yglIsvCm1MWTUNwBlWrq8/nAK+g17ZxuJvoOb20PuPiy
         tBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p83eyM/g2esQ1B+/gTk72hlNugygA/VZwgZ5277Xd1o=;
        b=PNg5xwnAg7hhFAL3LxyIivPtUE+cpFYa6z/RamnZlagY/vu6L+DMGGhvb3CiVtbtV3
         2D5LiCCpq4EHUmNO6amiu0rpNSHM26+TEd/nuEOpMluO8/I7xl8xlV2Risdhp2bd2ViI
         o+EVShFWy7NMHBHMKXiQnMkv8pCIXDLVxWk+1kNTqqGSXvb7xzoTMh4BGBK2xm6466G9
         tnUl8EM2AYw+zOL4aHy9iIqgY269GpEGcHB3ysxDRw0veTFJBmT/Xnw8yWNvVd9oVB8L
         ko8r0tMc5goR0HWWLVieBEffqYWPqzwBGgA5TjFjLvrpNSX0ORUp31BOJYrzJVsB3P1i
         kvlA==
X-Gm-Message-State: ACrzQf0Hv2oWVenV1az9i99boZrSvUlOTbH/hbvsq89+S/FTxIEoCEub
	ptpUwqpZCOzjhBtyroVUToxEyHne2W5K+A==
X-Google-Smtp-Source: AMsMyM7Q5us+NgWWHSjYuZlKwwktKq1NpzMLntvf6z/Id7oVaY4ZNoP79CQ3Nn1RPcA664aBTRMaCw==
X-Received: by 2002:ac8:7f41:0:b0:39c:f34f:feca with SMTP id g1-20020ac87f41000000b0039cf34ffecamr18322501qtk.644.1666390044456;
        Fri, 21 Oct 2022 15:07:24 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id k2-20020a05620a414200b006bba46e5eeasm11030984qko.37.2022.10.21.15.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:07:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/hafnium: add missing Upstream-Status
Date: Fri, 21 Oct 2022 16:01:45 -0400
Message-Id: <166638250645.2629587.11025127325457816178.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221021162243.1410088-1-ross.burton@arm.com>
References: <20221021162243.1410088-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 22:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4011

On Fri, 21 Oct 2022 17:22:43 +0100, Ross Burton wrote:
> 


Applied, thanks!

[1/1] arm/hafnium: add missing Upstream-Status
      commit: 7730ae58ac252a7fce4b0997d79a37ea7020239f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

