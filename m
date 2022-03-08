Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF64C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 13:57:04 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.8177.1646747823511975566
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 05:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=QSPYqbR7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id b12so14693090qvk.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 05:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L1RVxJMeCIhnlPA7UuSC46V1cPg9zVh+8UCbTVyCsxU=;
        b=QSPYqbR7EJxuoWMlYrAbXZrA+DvFd6XNy5DN28ISrnlIpDCVCov3znobCneU2EOwqT
         6UEtbN08B/KszmOc1UtUNkgOksl16lLOeZG/ZuUlNZ94Z/Beo1TmDwAXH2DFqXXdi9kV
         q5TtFNd7m1P4P/pD1HpMA5KzA7ik+pW4D66efeCEZitf9Z0Uxnix38K+d0t2C0niHrD0
         San3SId03HMaO8UaoaNQ7H9toFZUiu/i8Yw9iXY80dzWDitAx2zoVJqGp/0RH3RP5vJm
         fQht/VKmkxj5dUMSd3jAqVRlisNlJm5RaIfmDGsNM9SZN9qYspIWjzUJFoG86N/G/eU8
         mymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1RVxJMeCIhnlPA7UuSC46V1cPg9zVh+8UCbTVyCsxU=;
        b=Iifq2TqgCCVk+3N5i25Klo0J6wHZLb9pb2HNbqM5y/FFBPO94g6SndRMUHPkOdRvFa
         I8DwaFbyPSnrjwHolAU0p/3ZZrvEoMWMcGWRZH8tlljDRk7XHT3oefCFQQ35itKUGPVp
         fAFMkyqFksir5RVsN0bm0KfLKTA76iGFQMfLNwIEvEU2cpBccrqmh5WYy059YRz0tAk8
         ccSsAAE8ZkmMiY4855ucSl0JyR/HF3eZXtRMmcgacuxXUcTNOssDAo7WNNBSrx48YGu+
         Sleh2kQzCYt5pMh+b9QQncSUc3RyOsbRLVCzQED9b+tWNz4bNDrQJ3ltflSZnIDp9Wdb
         goyA==
X-Gm-Message-State: AOAM532WQ/KaDoVEbCcPl1EJNI6vYZ+Vi8i4rwLW+dPM5quRv7hWjmCh
	Pa2z0MoTBk9i2tYoSTHTw+AI5MqV3MywHw==
X-Google-Smtp-Source: 
 ABdhPJwPBp86kLnSFJM96DPh2PjtwMacNrn7nUyoTVFank3jaZ8tyESIumi7zvKv2YXNxYfMdTeDDg==
X-Received: by 2002:a05:6214:240b:b0:435:8f71:994d with SMTP id
 fv11-20020a056214240b00b004358f71994dmr7488307qvb.86.1646747822598;
        Tue, 08 Mar 2022 05:57:02 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:e36c:6a84:e7f7:3230])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a37de11000000b0047caf996ef8sm7674895qkj.20.2022.03.08.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 05:57:02 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm-bsp/docs: Set required Kas version to 3.0 for
 fvp-baser-aemv8r64
Date: Tue,  8 Mar 2022 08:56:37 -0500
Message-Id: <164674779771.2128532.1881643276283941952.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304145423.523188-1-peter.hoyes@arm.com>
References: <20220304145423.523188-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 13:57:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3131

On Fri, 4 Mar 2022 14:54:23 +0000, Peter Hoyes wrote:
> poky master has changed a variable name to BB_ENV_PASSTHROUGH_ADDITIONS.
> Support for this has been added in Kas 3.0

Applied, thanks!

[1/1] arm-bsp/docs: Set required Kas version to 3.0 for fvp-baser-aemv8r64
      commit: fec543da699a140302372cd76d40727a24bd6550

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

