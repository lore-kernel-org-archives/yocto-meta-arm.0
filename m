Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6293C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 00:59:47 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.4129.1644454786818795122
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 16:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=yuzDShAZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id o10so3407303qkg.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 16:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NzPb3qCkf8OTmHk8jdf3eom+e8cAdHOXTgiUieoHWwk=;
        b=yuzDShAZJyAXb6QcSbhppdwV0gQqRhnpPr6tiC4guLHVcZes8titir4gG7L3Yyccur
         uijnJraqFeA1mdYi8p22uagfAd3kadoLRHKN2y9x0s/c+HGv2S7djOisi0JCvS+OdB3r
         8MkiR+NNRWigbaPAYiDi3ESgQy4LQs677VjLD+Q6KFjfN6OWJQMP0S+q8Er4HLKA8z7V
         bgq5R381tiz0M+DthWA4C5F597l2RUh7dI0ZSljCkfLWHUuPY1SXgWI0qcLMGSdJQcdA
         P3xvsJ3tsJPI9t/htiIDRCJnGFc5yoVKQChfPWNeGUAJJE0uhShxZlYbf6XpPnBUeH48
         KxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzPb3qCkf8OTmHk8jdf3eom+e8cAdHOXTgiUieoHWwk=;
        b=WqtYc/jVHMGBMEDRO8lEssavgp4rdwu0Qc2f9DVnxIitbDB79/ZT1huYrVQuTDH7nK
         m08jaY+TCVUJL5ANc5BeBudDZ6lK8Lq7d3eBOdOQjKHIPD47qtcU/u0edcJSSLpjsQpu
         1ZskeDh9wmCj7D5SkhM+6QJsHEOKkJ2nP6kDKwsTIPztmBLRfjJCpa0dpEJ0rx1jjiRN
         R//bBx6X3jUadfPn4WjNp/QDdsKnRm/O5NgtA/qKCIpupGnQnSNFP/FHkIhWVJHF2Jjd
         5017tC8csx12BW41937Kku1GAfKkPXRiIjPBUCzDIz8rFl6ububA3lDfcCbxEQhZyJmQ
         b0zQ==
X-Gm-Message-State: AOAM53129Ri3XWXr+p/TYB8sBwjVKHlSrMfFf+F57CSqqqsceNuZ+WUS
	Jh9HDVUjFmE86amqO5bBH6aLSJz2vAKmjA==
X-Google-Smtp-Source: 
 ABdhPJzdqDeb+RUUy56Y3qWD8Avk+yGPf5p3+aw8Wft6/3DswtvVWId/jI3+6+1fb+fVORLP1AF5dQ==
X-Received: by 2002:a37:270a:: with SMTP id n10mr2686360qkn.422.1644454785823;
        Wed, 09 Feb 2022 16:59:45 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:4a13:d3da:c114:3dbe])
        by smtp.gmail.com with ESMTPSA id
 s14sm9692762qkp.79.2022.02.09.16.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 16:59:45 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/5] arm-bsp/linux-yocto: drop redundant KMACHINE
 assignments
Date: Wed,  9 Feb 2022 19:59:22 -0500
Message-Id: <164445476242.3984483.11879947300409166804.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209174624.3824874-1-ross.burton@arm.com>
References: <20220209174624.3824874-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Feb 2022 00:59:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2976

On Wed, 9 Feb 2022 17:46:20 +0000, Ross Burton wrote:
> KMACHINE defaults to MACHINE, so remove the redundant assignments.

Applied, thanks!

[1/5] arm-bsp/linux-yocto: drop redundant KMACHINE assignments
      commit: c9e1f1fe25adfad4d358dc64db4d901ddfacf9a2
[2/5] arm-bsp/sgi575: use the default linux-yocto version
      commit: ebef5db57cd407697f7eaf89ee0802ee57388710
[3/5] arm-bsp/juno: move to linux-yocto 5.15
      commit: 0d0bafe7f3f5cc72f6b7b2f11cbd72cb80bf47f8
[4/5] arm-bsp/firmware-image-juno: remove default dependencies
      commit: 11b4fd20a0eec7cd9013f3d9d8ae550c64f5107c
[5/5] arm-bsp/linux-yocto: remove unused 5.4 and 5.7 kernels
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

