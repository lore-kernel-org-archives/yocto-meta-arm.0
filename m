Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49000C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 03:09:52 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.31723.1715915389556321365
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 May 2024 20:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=STS8qg/q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.178, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c99c66a40fso580215b6e.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 May 2024 20:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1715915388; x=1716520188; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcW1UnlfpX+JLJm/Teuw4tOIte+hO9WV/vr14bgJj1Q=;
        b=STS8qg/qbBpTQXrmmvLC4sI2H6xIBUGCKisZOK2kSLsS5XOghf72+GGaH4b0NAoYhc
         Bu8NZboqiOBmCvEb2LerTQdcYZVhwt8gOWvtuja+huAp9H2mPQtsDvMX1wbl60GrhaJl
         NKrqlc7WFegNKCFuf5A/Q44qyIG8A7bQ+AhrYAb2wC4s7wDVI0wz+CvodNL/KwIfZ8eL
         7SHkhMorBZonfmn1mWNZmGIjku5AIS7ZMlvCJyrpW2hAzEJKPrN+z1PqTaOT5351o1AF
         ixasF2Vx/VurBDyE/40oYdKekzXeZ5+N//7v5O5LqKCl+YVjBbLQaQALhv4H/78rV0mD
         mGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715915388; x=1716520188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcW1UnlfpX+JLJm/Teuw4tOIte+hO9WV/vr14bgJj1Q=;
        b=C/4jS9Ad0g585hY0M4PSPWsZPN+IRaXcQlwfY8iSOd8lsSrEX3T3A5h02eOSkHX0lO
         ZlU9vv3DTvQyR2C/iieXIerWjYaH5pGBXu7bTQ754qeRs0ccVq6GPPW306TXYoIt8sUp
         l1D0KmTmf1OcvI9cCmtl9zhHj1kRj8vXn/3W2u5eRjrsO/fRYHJrVSEW5fyUsQfMx+bj
         x25NDOegbgov+RjAhV/zmIybbKCId+q1Ef05srQYYaUffTDKkQld33HmpuEANppBsdlw
         Gk8MKPM2I00/JF92t4CUsraoq4MNwtvU9gt90xd7UAc7aFaU05sygMIxU/KEFIZLMfB6
         L86w==
X-Gm-Message-State: AOJu0YzJDJ4l3zehoBF6CvIPTMNqaag8qsagCrah5aEyJJZbVxd8UBiA
	O2RSof6/AZs4nP0n6zeZKLtB5HE27GoUiwxCKoYZPSgIGc23E2uB2nsRq/a5xPmOpU3cOxQyNng
	=
X-Google-Smtp-Source: AGHT+IFXJmVb+yUVzvVbTWxvbVRZEVN48DmSA509v1OIO0crMsQcwQViPt02rXVxAIsaiFbpqinF3A==
X-Received: by 2002:a05:6808:1415:b0:3c9:92ba:fd0a with SMTP id 5614622812f47-3c9970ce727mr24925358b6e.38.1715915388597;
        Thu, 16 May 2024 20:09:48 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7930c538f13sm86818685a.38.2024.05.16.20.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 20:09:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/oeqa/runtime/fvp_boot: move pexpect import into test method
Date: Thu, 16 May 2024 23:09:28 -0400
Message-Id: <171591536813.1562024.2391704984433468710.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515132252.3923595-1-ross.burton@arm.com>
References: <20240515132252.3923595-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 03:09:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5729


On Wed, 15 May 2024 13:22:52 +0000, Ross Burton wrote:
> Move the pexpect import inside the test method so that on machines without
> pexpect installed we can still parse the test cases, even if this one
> won't be pass.
> 
> 

Applied, thanks!

[1/1] arm/oeqa/runtime/fvp_boot: move pexpect import into test method
      commit: 200786d3a84b2c484de6e41c1f51c04173226950

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

