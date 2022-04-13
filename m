Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA43C4708A
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.3626.1649881847819766510
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 13:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SRkdJGaR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id 3so2395752qkj.5
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 13:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DtndN1essViE9JHY8/aknIxiL1Wh6/tZISXDH6OsaCU=;
        b=SRkdJGaR2MVYjfv78r1UB3Ykoj9J/TtlzR0MuXefm3IDO5mld5rFZLANNLFHXLL8dG
         sfR0tEBezzuM6WPNrmvWQMfqhpY9tv3Yb7B5GyGU2Kkn9xMlPYFiPTpmIxxLjQ97q4Aa
         SzY0tjE1eNaiuwRNd5UychNfsMsr0BW2DP07R3I7wbu5Febg1xvyjeQynZTQc+pN3q0L
         9tCDEqNIqIZYzvQOw602ubbNPNjl2I2NAomlJVbfg6kXyFyWBB1EBkCQQO7UQmOLoThy
         iPiDhyBIrQvUMQwOk5ySAAUtpioFm6Vz1mAUHqjSCKJ+vb/hDfpWTKJg9/J81XMyreas
         Qftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DtndN1essViE9JHY8/aknIxiL1Wh6/tZISXDH6OsaCU=;
        b=qbR8KAOriBQH17gS9O1DtyqqgT7RQcaeHvgqwuTCub+q7nnM2D+nj6eTJClq7qeg8x
         0Sv25hoNabFq6zbd4pjZ4iLVEDJR1RvhjHg9NlrPCr2b/hggO1sFZXSlc+UKqH5xh5hk
         41aAyRg/Eys+JhrKT5WeomzqUXAR+y/tuKlIUH08CQ2QB4gDh2sNFu2jJ0FwJIOSxbqI
         MglQxjVPuvnBZ4tczuIumF25UU2pjk+Sm1AekxBF4BVxdJjKKMeFrv4pxNfwdk4o3r+d
         w5KqqQklTZDNyR/5sQgWrI2NiYdTF1/ajTvmvRMnn3sTMqBFpGKaKMSTqTjz7YvTbjI4
         fh3A==
X-Gm-Message-State: AOAM5313zIgJqkinH4ieOELnLj0xMjaItgY8YOoWIpW0E9i/jcFIpvr2
	1bw51zmxNKBoGjuyksR2UNasj517Xefu7A==
X-Google-Smtp-Source: 
 ABdhPJwRVzEMZv9segbUSSvQ9dArMv+Bh7s2P6lSxAcM/bnIeMny6oecxhvvbSPoakiQ1I8HW406Gw==
X-Received: by 2002:a37:93c2:0:b0:69c:1e3f:6c97 with SMTP id
 v185-20020a3793c2000000b0069c1e3f6c97mr8189294qkd.578.1649881846855;
        Wed, 13 Apr 2022 13:30:46 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 m14-20020a05622a054e00b002e2072cffe6sm29896615qtx.5.2022.04.13.13.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:30:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/scp-firmware: specify version for bbappend
Date: Wed, 13 Apr 2022 16:30:33 -0400
Message-Id: <164988183534.257858.10229575380803856873.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407160903.3809656-1-ross.burton@arm.com>
References: <20220407160903.3809656-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3273

On Thu, 7 Apr 2022 17:09:02 +0100, Ross Burton wrote:
> In preparation for SCP Firmware 2.10 being integrated, make this append
> version-specific so that BSPs can select which SCP release they have
> been tested with.

Applied, thanks!

[1/2] arm-bsp/scp-firmware: specify version for bbappend
      commit: 6919d15ea815f12975884f1349b87e732c161b01
[2/2] arm/scp-firmware: add 2.10
      commit: 07c46c0ead4f1626fe5e8463533a02e7ac44ab80

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

