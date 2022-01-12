Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AA3C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:55:20 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.25343.1642002918645739881
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 07:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=6Raw2xoM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id f17so3462761qtf.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xLBzK1c85fGgFkQ1dMNlsx9v1U73Ifndfe3WyDrQOwU=;
        b=6Raw2xoM/6et/JKvbkPIEguq+czQ4jiISw5AkN9MCC0n4ykBAZNC7vIIUgBR9keZdO
         d/3AsFGWKm/JhvD4s8NjdlEscSL0B9K+ds4PsDtjxwkmz4WOex9Mn0xXrPBKeXP+i1NU
         Qr3bkHod3+mn7Q3BZl31Rnf7/rpsisJJvokYumONEBTbF7Ya8Sffw1GsR/bnxyfEXrDY
         cyV5H7Tbq6wk6yzAGOgItS0zH7pZRdjknKU8TAozFSz/8cUfrC4suMMrFWfIrAvE18Ic
         1eOzfp8rRQcwB5m9Hd6YwgE6mXnY9hEZfOmSo5WqVLlwwoX0DxWoC99T7XHVg9B+/MAH
         R6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xLBzK1c85fGgFkQ1dMNlsx9v1U73Ifndfe3WyDrQOwU=;
        b=x8c3y2I6M192GxtaLXzOd1598pwzszguItnXN+TYGeL44acXyBkKKxOVOj/8JjzI7S
         0ngkMB4Ncs+aSk/Xy3zwMronO3GQdgvAW5BWCJEowe7UkFj25ocn97IYvWgb2Psvw0iQ
         j359f2QM48AeJjz0cTiICzkrHdl3IcxTDcZgr/Jt1/1SudzUyHQLAOARALyN3kjnhoSx
         Tx23J3zkqCPbJe3T1wqA+EBIiaTYCGGGXPg4kIsN+R4MleKuP6+G4R5bFiOj5p8nubXL
         G2jwPFbQbQPIlILOIsFhDMObAB0qQwp/qFE2n4tIhfWFNvr0/xt2LOF7Gzw2GbDudrvG
         cqtQ==
X-Gm-Message-State: AOAM531bHB2WT52y4NnPPbD0iKe06sc8nlRaQigPpm2p0wIpelH0t7I6
	wPROL7f6yfAjfp/I8NdKJvkcs0IuSvubCQ==
X-Google-Smtp-Source: 
 ABdhPJzLi/BBkW5S3eabX9qm5fW9VyLOXTl0ncSmoLewYH7pseNN009N2DYS07DmWuhOnYB+P3Fykg==
X-Received: by 2002:ac8:58c9:: with SMTP id u9mr59547qta.109.1642002917699;
        Wed, 12 Jan 2022 07:55:17 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:584a:a7c3:657e:d1c5])
        by smtp.gmail.com with ESMTPSA id k8sm118064qtx.35.2022.01.12.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 07:55:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] arm/edk2-firmware: explicitly set level of
 parallelisation
Date: Wed, 12 Jan 2022 10:55:05 -0500
Message-Id: <164200290693.3080473.5091045254153819630.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220111183044.3220036-1-ross.burton@arm.com>
References: <20220111183044.3220036-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 12 Jan 2022 15:55:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2824

On Tue, 11 Jan 2022 18:30:42 +0000, Ross Burton wrote:
> Explicitly set the level of parallelisation instead of letting build.sh
> determine it.

Applied, thanks!

[1/3] arm/edk2-firmware: explicitly set level of parallelisation
      commit: 0b1f4967b71527113814ec86b1d4cf19e8d29a80
[2/3] arm-bsp/edk2-firmware: enable building EDK2 for Juno
      commit: 24ef21c36b52aaf5f3c542b27faf6e2f4e288ddd
[3/3] arm-bsp/juno: also build EDK2 firmware
      commit: 44ea1e59a29372f72a9053dcf133ebb148308d8a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

